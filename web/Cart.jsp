<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    .button-container {
  width: 100%; /* Menggunakan lebar maksimum */
  margin-top: 10px; /* Jarak antara tombol di bagian atas */
}

.button-container .btn {
  width: 100%; /* Tombol mengisi lebar container */
  padding: 10px;
  text-align: center;
  white-space: nowrap;
  max-width: 150px; /* Sesuaikan jika perlu */
}
  </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-4" style="min-height: 850px">
        <h2>Your Cart</h2>
        
        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="alert alert-info" role="alert">
                    Your cart is empty.
                </div>
            </c:when>
            <c:otherwise>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="totalPrice" value="0" />
                        <c:forEach items="${cartItems}" var="item">
                            <tr>
                                <td>${item.namaObat}</td>
                                <td>Rp.${item.harga}</td>
                                <td>${item.quantity}</td>
                                <td>Rp.${item.harga * item.quantity}</td>
                                <td>
                                    <a href="CartServlet?action=remove&idObat=${item.idObat}" class="btn btn-danger btn-sm">Remove</a>
                                </td>
                            </tr>
                            <c:set var="totalPrice" value="${totalPrice + (item.harga * item.quantity)}" />
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-right">
                    <h4>Total Price: Rp.<c:out value="${totalPrice}" /></h4>
                    <div class="button-container">
                        <a href="ObatServlet?action=list&page=user_home" class="btn btn-primary">Continue Shop</a>
                        <form action="${pageContext.request.contextPath}/ProcessCheckoutServlet" method="post">
                            <input type="hidden" name="totalPrice" value="<c:out value='${totalPrice}' />"><br>
                            <button type="submit" class="btn btn-success">Checkout Cart</button>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
