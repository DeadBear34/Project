/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import Model.KurirBean;
import controller.KurirDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ProcessCheckoutServlet")
public class ProcessCheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        HttpSession session = request.getSession();
        session.setAttribute("totalPrice", totalPrice);
        List<KurirBean> kurirList = KurirDAO.getAllKurir();
        session.setAttribute("kurirList", kurirList);
        response.sendRedirect(request.getContextPath() + "/checkout.jsp");
    }
}

