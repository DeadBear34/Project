package Servlet;

import Model.Product;
import controller.ProductDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;

    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // default action
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertProduct(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("new-product.jsp").forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String imageUrl = request.getParameter("image");
        String category = request.getParameter("category");

        if (name != null && priceStr != null && imageUrl != null && category != null) {
            try {
                double price = Double.parseDouble(priceStr);
                Product newProduct = new Product(null, name, price, imageUrl, category); // Pass null for id as it's auto-generated
                productDAO.insertProduct(newProduct);
                response.sendRedirect(request.getContextPath() + "/ProductServlet");
            } catch (NumberFormatException e) {
                // Handle invalid price format
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Product existingProduct = productDAO.getProductById(id); // Parse id to Integer
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("edit-product.jsp").forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String imageUrl = request.getParameter("image");
        String category = request.getParameter("category");

        if (idStr != null && name != null && priceStr != null && imageUrl != null && category != null) {
            try {
                int id = Integer.parseInt(idStr);
                double price = Double.parseDouble(priceStr);
                Product updatedProduct = new Product(idStr, name, price, imageUrl, category);
                productDAO.updateProduct(updatedProduct);
                response.sendRedirect(request.getContextPath() + "/ProductServlet");
            } catch (NumberFormatException e) {
                // Handle invalid price format
                e.printStackTrace();
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                productDAO.deleteProduct(id);
                response.sendRedirect(request.getContextPath() + "/ProductServlet");
            } catch (NumberFormatException e) {
                // Handle invalid id format
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
