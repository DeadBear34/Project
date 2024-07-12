package Servlet;

import Model.DetailPembayaranBean;
import Model.KurirBean;
import Model.Loginbean;
import Model.Cartbean;
import controller.KurirDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import Model.Loginbean;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String deliveryMethod = request.getParameter("deliveryMethod");
        String paymentMethod = request.getParameter("paymentMethod");
        int kurirId = Integer.parseInt(request.getParameter("kurir"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice")); // Assuming alamat is included in the form

        HttpSession session = request.getSession();
        Loginbean loginBean = (Loginbean) session.getAttribute("loginBean");
        if (loginBean == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        String alamat = loginBean.getAlamat();
        int userId = loginBean.getUserid();
        String username = loginBean.getUsername();

        double deliveryCost = 0.0;
        if (deliveryMethod.equals("express")) {
            deliveryCost = 5000.0;
        }

        KurirBean selectedKurir = KurirDAO.getKurirById(kurirId);
        double kurirHarga = selectedKurir.getHarga();
        double totalCost = totalPrice + deliveryCost + kurirHarga;
        session.setAttribute("userId", userId);
        session.setAttribute("username", username);
        session.setAttribute("alamat", alamat);
        session.setAttribute("deliveryMethod", deliveryMethod);
        session.setAttribute("paymentMethod", paymentMethod);
        session.setAttribute("kurir", selectedKurir);
        session.setAttribute("totalCost", totalCost);
        List<Cartbean> cartItems = (List<Cartbean>) session.getAttribute("cart");
        session.setAttribute("cartItems", cartItems);
        DetailPembayaranBean detailPembayaran = new DetailPembayaranBean();
        detailPembayaran.setUser_id(userId);
        detailPembayaran.setNama(username);
        detailPembayaran.setAlamat(alamat);
        detailPembayaran.setNo_telpon(loginBean.getNo_telpon());
        detailPembayaran.setId_kurir(selectedKurir.getIdKurir());
        
        List<String> barangList = new ArrayList<>();
        for (Cartbean cartItem : cartItems) {
            barangList.add(cartItem.getNamaObat());
        }
        detailPembayaran.setBarang(barangList);
        
        detailPembayaran.setMetodePembayaran(paymentMethod);
        detailPembayaran.setTotalBiaya(totalCost);
        detailPembayaran.setKodePembayaran(generatePaymentCode());
        detailPembayaran.setKurir(selectedKurir.getNamaKurir());

        session.setAttribute("detailPembayaran", detailPembayaran);
        
        response.sendRedirect(request.getContextPath() + "/PaymentConfirmation.jsp");
    }
    private String generatePaymentCode() {
        return "PAY-" + System.currentTimeMillis();
    }
}
