<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APOTEKU</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="CSS/header.css">
    <style>
        .cart-icon {
            position: relative;
            display: inline-block;
            margin-left: 10px;
        }
        .cart-icon .fa-shopping-cart {
            font-size: 24px;
            color: #fff;
            vertical-align: middle;
        }
        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #007bff;
            color: #fff;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 12px;
            text-align: center;
            line-height: 20px;
        }
        /* Style for popup */
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            z-index: 1000;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            display: none;
            max-width: 400px; /* Adjust maximum width as needed */
        }
        .popup-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .popup-header h4 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        .popup-body {
            color: #444;
        }
        .popup-body p {
            margin: 5px 0;
        }
        .popup-close {
            cursor: pointer;
            color: #aaa;
            font-size: 24px;
            border: none;
            background: none;
        }
        .popup-close:focus, .popup-close:hover {
            color: #666;
            text-decoration: none;
        }
        .user-icon {
            font-size: 40px;
            color: #007bff;
            margin-right: 10px;
        }
    </style>
    <script>
        function showUserInfo() {
            var popup = document.getElementById("userInfoPopup");
            popup.style.display = "block";
        }

        function closePopup() {
            var popup = document.getElementById("userInfoPopup");
            popup.style.display = "none";
        }

        // Close popup if user clicks outside of it
        window.onclick = function(event) {
            var popup = document.getElementById("userInfoPopup");
            if (event.target == popup) {
                popup.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container">
                    <a class="navbar-brand" href="ObatServlet?action=list&page=user_home">APOTEKU</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navcol-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="ObatServlet?action=list&page=user_home">Beranda</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Jenis Produk </a>
                                <div class="dropdown-menu" role="menu">
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Analgestik">Analgestik</a>
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Antibiotik">Antibiotik</a>
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Antiinflamasi">Antiinflamasi</a>
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Antidepresan">Antidepresan</a>
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Antijamur">Antijamur</a>
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=filter&keyword=Kortikosteroid">Kortikosteroid</a>
                                </div>
                            </li>
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="contact.jsp">Kontak</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="faq.jsp">FAQ</a></li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <!-- Search form or other relevant form -->
                        </form>
                        
                        <!-- Checking login session -->
                        <c:if test="${empty sessionScope.user}">
                            <span class="navbar-text"><a href="index.jsp" class="login">Log In</a></span>
                            <a class="btn btn-light action-button" role="button" href="register.jsp">Sign Up</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                            <span class="navbar-text">
                                <a href="javascript:void(0);" onclick="showUserInfo();" style="margin-right: 10px; color: #fff;">
                                    <i class="fa fa-user-circle"> ${sessionScope.loginBean.username}</i>
                                </a>
                                <div id="userInfoPopup" class="popup">
                                    <div class="popup-header">
                                        <h4><i class="fa fa-user user-icon"></i> Informasi Pengguna</h4>
                                        <button type="button" class="popup-close" onclick="closePopup();">&times;</button>
                                    </div>
                                    <div class="popup-body">
                                        <p><strong>Username:</strong> ${sessionScope.loginBean.username}</p>
                                        <p><strong>Nama:</strong> ${sessionScope.loginBean.nama}</p>
                                        <p><strong>Email:</strong> ${sessionScope.loginBean.email}</p>
                                        <p><strong>No Telpon:</strong> ${sessionScope.loginBean.no_telpon}</p>
                                        <p><strong>Alamat:</strong> ${sessionScope.loginBean.alamat}</p>
                                        <!-- Add other user information as needed -->
                                    </div>
                                </div>
                            </span>
                            <form action="LogoutServlet" method="post" class="form-inline my-2 my-lg-0">
                                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                            </form>
                            <a href="CartServlet" class="cart-icon">
                                <i class="fa fa-shopping-cart"></i>
                                <span style="background: red;" class="cart-count">${empty sessionScope.cartItemCount ? '0' : sessionScope.cartItemCount}</span>
                            </a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
