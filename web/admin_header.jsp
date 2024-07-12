<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APOTEKU - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="CSS/header.css">
</head>
<body>
    <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container">
                    <a class="navbar-brand" href="ObatServlet?action=list&page=admin_home">APOTEKU</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navcol-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="ObatServlet?action=list&page=admin_home">Beranda</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Manage</a>
                                <div class="dropdown-menu" role="menu">
                                    <a class="dropdown-item" role="presentation" href="ObatServlet?action=list&page=admin_obat">Manage Obat</a>
                                    <a class="dropdown-item" role="presentation" href="AdminActivityServlet?action=list">Activity</a>
                                    <a class="dropdown-item" role="presentation" href="OrdersServlet?action=list&page=admin_orders">Manage Orders</a>
                                    <a class="dropdown-item" role="presentation" href="ReportsServlet?action=list&page=admin_reports">Reports</a>
                                </div>
                            </li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <!-- Form pencarian atau yang sesuai -->
                        </form>
                        
                        <!-- Memeriksa sesi login -->
                        <c:if test="${empty sessionScope.user}">
                            <span class="navbar-text"><a href="index.jsp" class="login">Log In</a></span>
                            <a class="btn btn-light action-button" role="button" href="register.jsp">Sign Up</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                            <span class="navbar-text">
                                <form action="LogoutServlet" method="post" class="form-inline my-2 my-lg-0">
                                    <span style="margin-right: 10px; color: #fff;">${sessionScope.uName}</span>
                                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                                </form>
                            </span>
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
