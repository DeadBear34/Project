<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Processing</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container mt-4">
        <h2>Payment Processing</h2>
        
        <div class="card">
            <div class="card-body">
                <p class="card-text">Thank you for your order!</p>
                <p class="card-text">Your total cost is: Rp.<%= session.getAttribute("totalCost") %></p>
                <p class="card-text">Delivery Method: <%= session.getAttribute("deliveryMethod") %></p>
                <p class="card-text">Payment Method: <%= session.getAttribute("paymentMethod") %></p>
                <p class="card-text">Selected Courier: <%= ((Model.KurirBean) session.getAttribute("kurir")).getNamaKurir() %> - Rp.<%= ((Model.KurirBean) session.getAttribute("kurir")).getHarga() %></p>
                
                <hr>
                <p class="card-text">Please proceed with your payment.</p>
                
                <!-- Add payment processing form or instructions here -->
                
                <div class="mt-3">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Back to Home</a>
                </div>
            </div>
        </div>
    </div>
        
    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
