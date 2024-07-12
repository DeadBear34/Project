<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Halaman Registrasi</title>
  <!-- Panggil file CSS Bootstrap -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Panggil Font Awesome untuk ikon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- Form Registrasi -->
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="IMG/obat.png" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form action="RegisterServlet" method="post">

                        <div class="divider d-flex align-items-center my-4">
                            <h1 class="text-center fw-bold mx-8 mb-10" style="color: #2196F3;">REGISTER</h1>
                        </div>

                        <!-- Input untuk username -->
                        <div class="form-outline mb-4">
                            <input type="text" id="username" name="username" class="form-control form-control-lg"
                                placeholder="Enter your Username" required />
                            <label class="form-label" for="username">Username</label>
                        </div>

                        <!-- Input untuk nama -->
                        <div class="form-outline mb-3">
                            <input type="text" id="nama" name="nama" class="form-control form-control-lg"
                                placeholder="Enter your Name" required />
                            <label class="form-label" for="nama">Name</label>
                        </div>
                        
                        <div class="form-outline mb-3">
                            <input type="email" id="email" name="email" class="form-control form-control-lg"
                                placeholder="Enter your email" required />
                            <label class="form-label" for="nama">Email</label>
                        </div>

                        <!-- Input untuk alamat -->
                        <div class="form-outline mb-3">
                            <input type="text" id="alamat" name="alamat" class="form-control form-control-lg"
                                placeholder="Enter your Address" required />
                            <label class="form-label" for="alamat">Address</label>
                        </div>

                        <!-- Input untuk nomor telepon -->
                        <div class="form-outline mb-3">
                            <input type="text" id="no_telpon" name="no_telpon" class="form-control form-control-lg"
                                placeholder="Enter your Phone Number" required />
                            <label class="form-label" for="no_telpon">Phone Number</label>
                        </div>

                        <!-- Input untuk password -->
                        <div class="form-outline mb-3">
                            <input type="password" id="password" name="password" class="form-control form-control-lg"
                                placeholder="Enter your Password" required />
                            <label class="form-label" for="password">Password</label>
                        </div>

                        <!-- Input untuk mengulangi password -->
                        <div class="form-outline mb-3">
                            <input type="password" id="r_password" name="r_password" class="form-control form-control-lg"
                                placeholder="Repeat your Password" required />
                            <label class="form-label" for="r_password">Repeat Password</label>
                        </div>

                        <!-- Tombol submit untuk registrasi -->
                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem; background-color: #2196F3;">Register</button>
                            <p class="small fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="index.jsp"
                                    class="link-danger">Login</a></p>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Panggil file JavaScript Bootstrap (opsional, jika Anda menggunakan komponen JavaScript) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
