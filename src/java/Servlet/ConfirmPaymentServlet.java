package Servlet;

import Model.DetailPembayaranBean;
import Model.Loginbean;
import Model.TransaksiBean;
import controller.TransaksiDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        DetailPembayaranBean detailPembayaran = (DetailPembayaranBean) session.getAttribute("detailPembayaran");
        
        if (detailPembayaran != null) {
            try {
                TransaksiBean transaksi = new TransaksiBean();
                transaksi.setUser_id(detailPembayaran.getUser_id());
                transaksi.setNama(detailPembayaran.getNama());
                transaksi.setAlamat(detailPembayaran.getAlamat());
                transaksi.setNo_telpon(detailPembayaran.getNo_telpon());
                transaksi.setId_kurir(detailPembayaran.getId_kurir());
                transaksi.setBarang(detailPembayaran.getBarangAsString());
                transaksi.setMetodePembayaran(detailPembayaran.getMetodePembayaran());
                transaksi.setTotalBiaya(detailPembayaran.getTotalBiaya());
                transaksi.setKodePembayaran(detailPembayaran.getKodePembayaran());
                transaksi.setKurir(detailPembayaran.getKurir());
                TransaksiDAO transaksiDAO = new TransaksiDAO();
                boolean success = transaksiDAO.addTransaksi(transaksi);
                
                if (success) {
                    session.setAttribute("cart", null);
                    session.setAttribute("cartItemCount", 0);
                    response.sendRedirect(request.getContextPath() + "/paymentSuccess.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/paymentFailure.jsp");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConfirmPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/paymentFailure.jsp");
        }
    }
}
