package Servlet;

import Model.Obatbean;
import controller.ObatDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ObatServlet")
public class ObatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ObatDAO obatDAO;

    public void init() {
        obatDAO = new ObatDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "list":
                    listObats(request, response);
                    break;
                case "detail":
                    showObatDetail(request, response);
                    break;
                case "delete":
                    deleteObat(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateObat(request, response);
                    break;
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertObat(request, response);
                    break;
                case "search":
                    searchObats(request, response);
                    break;
                case "filter":
                    String category = request.getParameter("keyword");
                    filterObats(request, response, category);
                    break;
                default:
                    listObats(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
    private void searchObats(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    String keyword = request.getParameter("keyword");
    List<Obatbean> obats = obatDAO.searchObats(keyword);
    request.setAttribute("obats", obats);
    request.setAttribute("searchKeyword", keyword); // Menyimpan kata kunci pencarian untuk ditampilkan kembali
    
    String page = request.getParameter("page");
    HttpSession session = request.getSession();
    String role = (String) session.getAttribute("role");

    if ("admin_home".equals(page) && "ADMIN".equals(role)) {
        request.getRequestDispatcher("admin_home.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("user_home.jsp").forward(request, response);
    }
    }


    private void filterObats(HttpServletRequest request, HttpServletResponse response, String category)
    throws ServletException, IOException {
    List<Obatbean> obats = obatDAO.filterObats(category);
    request.setAttribute("obats", obats);
    request.getRequestDispatcher("user_home.jsp").forward(request, response);
    }

    
    private void listObats(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Obatbean> obats = obatDAO.getAllObats();
        request.setAttribute("obats", obats);

        String page = request.getParameter("page");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if ("admin_home".equals(page) && "ADMIN".equals(role)) {
            request.getRequestDispatcher("admin_home.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("user_home.jsp").forward(request, response);
        }
    }

    private void showObatDetail(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String idObat = request.getParameter("idObat");
        Obatbean obat = obatDAO.getObatById(idObat);
        request.setAttribute("obat", obat);
        request.getRequestDispatcher("obat_detail.jsp").forward(request, response);
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("new-obat.jsp").forward(request, response);
    }

    private void insertObat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String namaObat = request.getParameter("namaObat");
        String jenisObat = request.getParameter("jenisObat");
        String bentukSediaan = request.getParameter("bentukSediaan");
        String dosis = request.getParameter("dosis");
        String indikasi = request.getParameter("indikasi");
        String efekSamping = request.getParameter("efekSamping");
        String hargaStr = request.getParameter("harga");
        String produsen = request.getParameter("produsen");
        String jumlahStokStr = request.getParameter("jumlahStok");

        if (namaObat != null && jenisObat != null && bentukSediaan != null && dosis != null && indikasi != null && efekSamping != null && hargaStr != null && produsen != null && jumlahStokStr != null) {
            try {
                double harga = Double.parseDouble(hargaStr);
                int jumlahStok = Integer.parseInt(jumlahStokStr);
                Obatbean newObat = new Obatbean(null, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok);
                obatDAO.insertObat(newObat);
                response.sendRedirect(request.getContextPath() + "/ObatServlet?action=list&page=admin_home");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String idObat = request.getParameter("idObat");
    Obatbean existingObat = obatDAO.getObatById(idObat);
    request.setAttribute("obat", existingObat);
    request.getRequestDispatcher("edit-obat.jsp").forward(request, response);
}


    private void updateObat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idObat = request.getParameter("idObat");
        String namaObat = request.getParameter("namaObat");
        String jenisObat = request.getParameter("jenisObat");
        String bentukSediaan = request.getParameter("bentukSediaan");
        String dosis = request.getParameter("dosis");
        String indikasi = request.getParameter("indikasi");
        String efekSamping = request.getParameter("efekSamping");
        String hargaStr = request.getParameter("harga");
        String produsen = request.getParameter("produsen");
        String jumlahStokStr = request.getParameter("jumlahStok");

        if (idObat != null && namaObat != null && jenisObat != null && bentukSediaan != null && dosis != null && indikasi != null && efekSamping != null && hargaStr != null && produsen != null && jumlahStokStr != null) {
            try {
                double harga = Double.parseDouble(hargaStr);
                int jumlahStok = Integer.parseInt(jumlahStokStr);
                Obatbean updatedObat = new Obatbean(idObat, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok);
                obatDAO.updateObat(updatedObat);
                response.sendRedirect(request.getContextPath() + "/ObatServlet?action=list&page=admin_home");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteObat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idObat = request.getParameter("idObat");
        if (idObat != null) {
            obatDAO.deleteObat(idObat);
            response.sendRedirect(request.getContextPath() + "/ObatServlet?action=list&page=admin_home");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
