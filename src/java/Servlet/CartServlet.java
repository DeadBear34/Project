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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private ObatDAO obatDAO;

    @Override
    public void init() throws ServletException {
        obatDAO = new ObatDAO();
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "view"; // Default action if not provided
        }

        switch (action) {
            case "add":
                addToCart(request, response);
                break;
            case "remove":
                removeFromCart(request, response);
                break;
            case "clear":
                clearCart(request, response);
                break;
            case "view":
            default:
                showCart(request, response); // Default action
                break;
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cartbean> cart = getOrCreateCart(session);

        String idObatStr = request.getParameter("idObat");
        if (idObatStr != null && !idObatStr.isEmpty()) {
            try {
                int idObat = Integer.parseInt(idObatStr);
                Obatbean obat = obatDAO.getObatById(Integer.toString(idObat));

                if (obat != null) {
                    boolean found = false;
                    for (Cartbean item : cart) {
                        if (item.getIdObat() != null && item.getIdObat().equals(String.valueOf(idObat))) {
                            item.setQuantity(item.getQuantity() + 1);
                            found = true;
                            break;
                        }
                    }

                    if (!found) {
                        Cartbean cartItem = new Cartbean(obat.getIdObat(), obat.getNamaObat(), obat.getHarga(), 1);
                        cart.add(cartItem);
                    }

                    updateSessionAttributes(session, cart);
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/CheckoutError.jsp");
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/ObatServlet?action=list&page=user_home");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cartbean> cart = getOrCreateCart(session);

        String idObatStr = request.getParameter("idObat");
        if (idObatStr != null && !idObatStr.isEmpty()) {
            try {
                int idObat = Integer.parseInt(idObatStr);
                Iterator<Cartbean> iterator = cart.iterator();
                while (iterator.hasNext()) {
                    Cartbean item = iterator.next();
                    if (item.getIdObat() != null && item.getIdObat().equals(String.valueOf(idObat))) {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        } else {
                            iterator.remove();
                        }
                        break;
                    }
                }

                updateSessionAttributes(session, cart);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/CheckoutError.jsp");
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/CartServlet?action=view");
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        session.removeAttribute("cartItemCount");

        response.sendRedirect(request.getContextPath() + "/CartServlet?action=view");
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cartbean> cart = getOrCreateCart(session);

        if (cart.isEmpty()) {
            request.setAttribute("emptyCart", true);
        } else {
            request.setAttribute("cartItems", cart);
        }

        request.getRequestDispatcher("Cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private List<Cartbean> getOrCreateCart(HttpSession session) {
        List<Cartbean> cart = (List<Cartbean>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private void updateSessionAttributes(HttpSession session, List<Cartbean> cart) {
        session.setAttribute("cart", cart);
        int cartItemCount = cart.stream().mapToInt(Cartbean::getQuantity).sum();
        session.setAttribute("cartItemCount", cartItemCount);
    }

    @Override
    public String getServletInfo() {
        return "Cart Servlet";
    }
}
