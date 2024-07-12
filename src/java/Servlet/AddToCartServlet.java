package Servlet;

import Model.Cartbean;
import Model.Obatbean;
import controller.ObatDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private ObatDAO obatDAO;

    @Override
    public void init() throws ServletException {
        obatDAO = new ObatDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idObatStr = request.getParameter("idObat");

        try {
            int idObat = Integer.parseInt(idObatStr);

            Obatbean obat = obatDAO.getObatById(idObatStr);

            if (obat != null) {
                HttpSession session = request.getSession();
                List<Cartbean> cart = (List<Cartbean>) session.getAttribute("cart");

                if (cart == null) {
                    cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                }

                boolean found = false;
                for (Cartbean item : cart) {
                    if (item.getIdObat().equals(obat.getIdObat())) {
                        item.setQuantity(item.getQuantity() + 1);
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    Cartbean cartItem = new Cartbean(
                            obat.getIdObat(),
                            obat.getNamaObat(),
                            obat.getHarga(),
                            1
                    );
                    cart.add(cartItem);
                }

                int cartItemCount = cart.stream().mapToInt(Cartbean::getQuantity).sum();
                session.setAttribute("cartItemCount", cartItemCount);

                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print("{\"status\": \"success\", \"message\": \"Product added to cart.\", \"cartItemCount\": " + cartItemCount + "}");
                out.flush();
            } else {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print("{\"status\": \"error\", \"message\": \"Product not found.\"}");
                out.flush();
            }
        } catch (NumberFormatException e) {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"status\": \"error\", \"message\": \"Invalid product ID.\"}");
            out.flush();
        }
    }
}
