<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-4" style="min-height: 800px;">
        <h2>Checkout</h2>
        
        <div class="card">
            <div class="card-body">
                <p class="card-text">Total Price: Rp.<%= session.getAttribute("totalPrice") %></p>
                
                <form action="${pageContext.request.contextPath}/ProcessPaymentServlet" method="post">
                    <!-- Delivery method -->
                    <div class="form-group">
                        <label for="deliveryMethod">Delivery Method:</label>
                        <select class="form-control" id="deliveryMethod" name="deliveryMethod">
                            <option value="standard">Standard Delivery</option>
                            <option value="express">Express Delivery (+Rp.5000)</option>
                        </select>
                    </div>
    
                    <!-- Payment method -->
                    <div class="form-group">
                        <label for="paymentMethod">Payment Method:</label>
                        <select class="form-control" id="paymentMethod" name="paymentMethod">
                            <option value="creditCard">Credit Card</option>
                            <option value="paypal">PayPal</option>
                        </select>
                    </div>
    
                    <!-- Kurir selection -->
                    <div class="form-group">
                        <label for="kurir">Select Courier:</label>
                        <select class="form-control" id="kurir" name="kurir">
                            <c:forEach var="kurir" items="${kurirList}">
                                <option value="${kurir.idKurir}">${kurir.namaKurir} - Rp.${kurir.harga}</option>
                            </c:forEach>
                        </select>
                    </div>
    
                    <!-- Hidden input for total price -->
                    <input type="hidden" name="totalPrice" value="<%= session.getAttribute("totalPrice") %>">
    
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary">Proceed to Payment</button><br>
                </form>
            </div>
        </div>
    </div>    
    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
