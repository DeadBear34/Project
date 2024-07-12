<%-- Payment.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="header.jsp" />
    <div class="container mt-4">
        <h2>Payment Details</h2>
        <!-- Tampilkan informasi pembayaran sesuai dengan proses checkout -->
        <p>Courier: ${sessionScope.courier}</p>
        <p>Payment Method: ${sessionScope.payment}</p>
        <p>Total Price: Rp.${sessionScope.totalPrice}</p>
        <!-- Tambahan informasi lainnya sesuai kebutuhan -->
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
