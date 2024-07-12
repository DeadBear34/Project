<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="path/to/your/custom/styles.css">
    <style>
        
        .card {
            margin-bottom: 20px;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .advertisement {
            margin-top: 20px;
            text-align: center;
        }
        .decoration {
            margin-top: 20px;
            text-align: center;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .btn-group {
            position: absolute;
            bottom: 15px;
            left: 15px;
        }
        .btn-group .btn {
            margin-right: 10px;
        }
        .notification {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #4CAF50;
        color: white;
        padding: 15px;
        border-radius: 5px;
        z-index: 9999;
        display: none;
    }

    .notification.show {
        display: block;
    }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div id="notification" class="notification"></div>
    <div class="container mt-4">
        
        <h2>Product List</h2>
        <form action="ObatServlet" method="get" class="form-inline mb-4">
            <input type="hidden" name="action" value="search">
            <input type="text" name="keyword" class="form-control mr-sm-2" placeholder="Search Products">
            <button type="submit" class="btn btn-outline-primary my-2 my-sm-0">Search</button>
            <div class="btn-group ml-auto" role="group" aria-label="Filter Products">
                <a href="ObatServlet?action=filter&keyword=Antibiotik" class="btn btn-outline-primary">Antibiotik</a>
                <a href="ObatServlet?action=filter&keyword=Analgestik" class="btn btn-outline-primary">Analgestik</a>
                <a href="ObatServlet?action=filter&keyword=Antiinflamasi" class="btn btn-outline-primary">Antiinflamasi</a>
                <a href="ObatServlet?action=filter&keyword=Antidepresan" class="btn btn-outline-primary">Antidepresan</a>
                <a href="ObatServlet?action=filter&keyword=Antijamur" class="btn btn-outline-primary">Antijamur</a>
                <a href="ObatServlet?action=filter&keyword=Kartikosteroid" class="btn btn-outline-primary">Kartikosteroid</a>
            </div>
        </form>
        
        <c:choose>
            <c:when test="${empty obats}">
                <div class="alert alert-info" role="alert">
                    No products found.
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-deck">
                    <c:forEach var="obat" items="${obats}" varStatus="loop">
                        <div class="card position-relative">
                            <img src="IMG/apotek/${obat.namaObat}.jpg" class="card-img-top" alt="${obat.namaObat}">
                            
                            <div class="card-body">
                                <h5 class="card-title">${obat.namaObat}</h5>
                                <p class="card-text">${obat.jenisObat}</p>
                                <p class="card-text">${obat.bentukSediaan}</p>
                                <p class="card-text">${obat.dosis}</p>
                                <p class="card-text">Rp.${obat.harga}</p><br>
                                <div class="btn-group">
                                    <a href="ObatServlet?action=detail&idObat=${obat.idObat}" class="btn btn-primary">View Details</a>
                                    <button class="btn btn-success addToCartBtn" data-id="${obat.idObat}"><i class="fa fa-plus"></i> Add to Cart</button>
                                </div>
                            </div>
                        </div>
                        <c:if test="${(loop.index + 1) % 3 == 0 || loop.last}">
                            </div>
                            <c:if test="${!loop.last}">
                                <div class="card-deck">
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="text-center mt-4">
                    <button id="showMoreBtn" class="btn btn-primary">Show More</button>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Advertisement Section -->
        <div class="advertisement mt-4">
            <img src="https://lifepack.id/wp-content/uploads/2022/08/lifepack-banner-tanggal-tua-diskon.jpg" alt="Advertisement" class="img-fluid">
        </div>

        <!-- Decorative Elements -->
        <div class="decoration mt-4">
            <h3>Special Offers</h3>
            <p>Check out our latest special offers!</p>
            <a href="#" class="btn btn-primary" background: green>View Offers</a><br>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
$(document).ready(function() {
    // Event listener untuk tambah ke keranjang
    $(".addToCartBtn").click(function(e) {
        e.preventDefault();
        var idObat = $(this).data("id");

        // Implementasi AJAX untuk menambahkan ke keranjang
        $.ajax({
            type: "POST",
            url: "AddToCartServlet",
            data: { idObat: idObat },
            success: function(response) {
                // Tampilkan notifikasi
                showNotification("Product added to cart successfully!");
                
                // Tambahkan jeda 1 detik sebelum memuat ulang halaman
                setTimeout(function() {
                    location.reload(); // Memuat ulang halaman setelah 1 detik
                }, 100);
            },
            error: function(xhr, status, error) {
                // Handle error jika diperlukan
                console.error("Error adding product to cart: " + error);
            }
        });
    });

    // Fungsi untuk menampilkan notifikasi
    function showNotification(message) {
        var notification = $("#notification");
        notification.text(message);
        notification.addClass("show");

        // Hilangkan notifikasi setelah beberapa detik
        setTimeout(function() {
            notification.removeClass("show");
        }, 3000); // Notifikasi akan hilang setelah 3 detik (3000 milidetik)
    }
});
</script>

<br>

    <jsp:include page="footer.jsp" />
</body>
</html>