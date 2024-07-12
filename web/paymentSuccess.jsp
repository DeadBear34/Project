<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pembayaran Berhasil</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-4">
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Pembayaran Berhasil!</h4>
            <p>Terima kasih, pembayaran Anda telah berhasil diproses.</p>
            <hr>
            <p class="mb-0">Kode Pembayaran Anda: <strong>${detailPembayaran.kodePembayaran}</strong></p>
            <p class="mb-0">Nama: <strong>${detailPembayaran.nama}</strong></p>
            <p class="mb-0">No Telpon: <strong>${detailPembayaran.no_telpon}</strong></p>
            <p class="mb-0">Alamat: <strong>${detailPembayaran.alamat}</strong></p>
            <p class="mb-0">Metode Pembayaran: <strong>${detailPembayaran.metodePembayaran}</strong></p>
            <p class="mb-0">Total Biaya: <strong>Rp.${detailPembayaran.totalBiaya}</strong></p>
            <p class="mb-0">Kurir: <strong>${detailPembayaran.kurir}</strong></p>
            <hr>
            <p class="mb-0">Barang yang Dibeli:</p>
            <ul>
                <c:forEach items="${detailPembayaran.barang}" var="item">
                    <li>${item}</li>
                </c:forEach>
            </ul>
        </div>

        <div class="mt-3" style="min-height: 800px;">
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Kembali ke Halaman Utama</a><br>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
