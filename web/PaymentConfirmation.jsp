<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Konfirmasi Pembayaran</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        // Countdown timer script
        var countDownDate = new Date().getTime() + 5 * 60 * 1000; // 5 minutes in milliseconds

        var x = setInterval(function() {
            var now = new Date().getTime();
            var distance = countDownDate - now;

            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            document.getElementById("countdown").innerHTML = minutes + "m " + seconds + "s ";

            if (distance < 0) {
                clearInterval(x);
                document.getElementById("countdown").innerHTML = "EXPIRED";
                // Perform actions when timer expires, e.g., redirect or enable payment confirmation button
                // Example:
                document.getElementById("paymentConfirmationForm").submit(); // Submit form automatically after timer expires
            }
        }, 1000);
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-4" style="min-height: 800px;">
        <h2>Konfirmasi Pembayaran</h2>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Detail Pembayaran</h5>
                <p class="card-text">Nama: ${detailPembayaran.nama}</p>
                <p class="card-text">No Telpon: ${detailPembayaran.no_telpon}</p>
                <p class="card-text">Alamat: ${alamat}</p>
                <p class="card-text">Metode Pembayaran: ${detailPembayaran.metodePembayaran}</p>
                <p class="card-text">Total Biaya: Rp.${detailPembayaran.totalBiaya}</p>
                <hr>
                <h5>Barang yang Dibeli</h5>
                <ul>
                    <c:forEach items="${detailPembayaran.barang}" var="item">
                        <li>${item}</li>
                    </c:forEach>
                </ul>
                <hr>
                <p class="card-text">Silakan selesaikan pembayaran Anda dalam:</p>
                <p id="countdown">5m 0s</p>
                
                <!-- Form pembayaran konfirmasi -->
                <form id="paymentConfirmationForm" action="${pageContext.request.contextPath}/ConfirmPaymentServlet" method="post">
                    <input type="hidden" name="kodePembayaran" value="${detailPembayaran.kodePembayaran}" />
                    <button type="submit" class="btn btn-success">Konfirmasi Pembayaran</button>
                </form>

                <div class="mt-3">
                    <a href="${pageContext.request.contextPath}/user_home.jsp" class="btn btn-primary">Kembali ke Halaman Utama</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>
