<%-- 
    Document   : index
    Created on : Jun 30, 2024, 11:19:16 PM
    Author     : ismai
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Halaman Login Apotek</title>
  <!-- Panggil file CSS Bootstrap -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Panggil Font Awesome untuk ikon -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" rel="stylesheet">
   <style>
    .divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.h-custom {
height: calc(100% - 73px);
}
@media (max-width: 450px) {
.h-custom {
height: 100%;
}
}
  </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <section class="vh-100">
        <div class="container-fluid h-custom">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
              <img src="IMG/obat.png"
                class="img-fluid" alt="Sample image">
            </div>
              <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" style="font-family: "Orbitron", sans-serif; font-style: normal;">
              <form action="LoginServlet" method="post">

                <div class="divider d-flex align-items-center my-4">
                  <h1 class="text-center fw-bold mx-8 mb-10" style="color: #2196F3;">LOGIN</h1>
                </div>
      
                <!-- Email input -->
                <div data-mdb-input-init class="form-outline mb-4">
                  <input type="text" id="username" name="username" class="form-control form-control-lg"
                    placeholder="Enter a valid Username" />
                  <label class="form-label" for="username">Username</label>
                </div>
      
                <!-- Password input -->
                <div data-mdb-input-init class="form-outline mb-3">
                  <input type="password" id="password" name="password" required class="form-control form-control-lg"
                    placeholder="Enter password" />
                  <label class="form-label" for="password">Password</label>
                </div>
      
                <div class="text-center text-lg-start mt-4 pt-2">
                  <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem; background-color: #2196F3;">Login</button>
                  <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register.jsp"
                      class="link-danger">Register</a></p>
                </div>
      
              </form>
            </div>
          </div>
        </div>
        
      </section>
<!-- Panggil file JavaScript Bootstrap (opsional, jika Anda menggunakan komponen JavaScript) -->
<jsp:include page="footer.jsp" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
