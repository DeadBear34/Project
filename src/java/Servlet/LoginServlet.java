package Servlet;

import Database.DbConnection;
import Model.Loginbean;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String Uname = request.getParameter("username");
        String Pname = request.getParameter("password");

        try {
            DbConnection cnc = new DbConnection();
            conn = cnc.driverConnect();

            String sql = "SELECT * FROM tabel_user WHERE username=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Uname);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");

                if (checkPassword(Pname, hashedPassword)) {
                    HttpSession session = request.getSession();

                    Loginbean loginBean = new Loginbean();
                    loginBean.setUsername(Uname);
                    loginBean.setUserid(rs.getInt("user_id"));
                    loginBean.setNama(rs.getString("nama")); 
                    loginBean.setEmail(rs.getString("email")); 
                    loginBean.setNo_telpon(rs.getString("no_telpon"));
                    loginBean.setAlamat(rs.getString("alamat"));
                    session.setAttribute("loginBean", loginBean);

                    session.setAttribute("user", Uname);
                    session.setAttribute("login", true);
                    session.setAttribute("uName", Uname);

                    String role = rs.getString("role");
                    session.setAttribute("role", role);

                    if ("ADMIN".equals(role)) {
                        response.sendRedirect("ObatServlet?action=list&page=admin_home");
                    } else {
                        response.sendRedirect("ObatServlet?action=list&page=user_home");
                    }
                } else {
                    response.sendRedirect("register.jsp");
                }
            } else {
                response.sendRedirect("register.jsp");
            }
        } catch (SQLException e) {
            response.sendRedirect("error.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private boolean checkPassword(String plainTextPassword, String hashedPassword) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(plainTextPassword.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            String generatedPassword = sb.toString();
            return generatedPassword.equals(hashedPassword);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
