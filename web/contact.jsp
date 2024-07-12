<%-- 
    Document   : contact
    Created on : Jul 4, 2024, 3:20:10 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Designed by Arunlal Panja -->
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Arunlal Panja">
  <title>Contact</title>
  <style>
    #offcanvasTop {
  --bs-offcanvas-height: 80vh;
  background-color: #c5e1d4;
}
  </style>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/faqs/faq-2/assets/css/faq-2.css">
  <link href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" rel="stylesheet">
</head>

<body>
    <jsp:include page="header.jsp" />
  <!-- Breadcrumb Block -->
    <div class="bg-light py-5">
      <div class="container">
        <div class="d-flex justify-content-between">
          <h1 class="fw-bold">Contact us</h1>
          </nav>
        </div>
      </div>
    </div>

  <main>
      <div class="container mt-4" style="min-height: 850px">
      <div class="row g-5">
        <!-- Contact Information Block -->
        <div class="col-xl-6">
          <div class="row row-cols-md-2 g-4">
            <div class="aos-item" data-aos="fade-up" data-aos-delay="200">
              <div class="aos-item__inner">
                <div class="bg-light hvr-shutter-out-horizontal d-block p-3">
                  <div class="d-flex justify-content-start">
                    <i class="fa-solid fa-envelope h3 pe-2"></i>
                    <span class="h5">Email</span>
                  </div>
                  <span>apoteku3@gmail.com</span>
                </div>
              </div>
            </div>
            <div class="aos-item" data-aos="fade-up" data-aos-delay="400">
              <div class="aos-item__inner">
                <div class="bg-light hvr-shutter-out-horizontal d-block p-3">
                  <div class="d-flex justify-content-start">
                    <i class="fa-solid fa-phone h3 pe-2"></i>
                    <span class="h5">Phone</span>
                  </div>
                  <span>+62123456789, +62876543210</span>
                </div>
              </div>
            </div>
          </div>
          <div class="aos-item mt-4" data-aos="fade-up" data-aos-delay="600">
            <div class="aos-item__inner">
              <div class="bg-light hvr-shutter-out-horizontal d-block p-3">
                <div class="d-flex justify-content-start">
                  <i class="fa-solid fa-location-pin h3 pe-2"></i>
                  <span class="h5">Office location</span>
                </div>
                <span>Jl. H. Amat I No.10, RT.5/RW.3, Kukusan, Kecamatan Beji, Kota Depok, </span>
              </div>
            </div>
          </div>
          <div class="aos-item" data-aos="fade-up" data-aos-delay="800">
            <div class="mt-4 w-100 aos-item__inner">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.2389584396115!2d106.8203717!3d-6.3631122!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ed437ab15bd9%3A0xdeee4055e99aac9a!2sKost%20madaniHome!5e0!3m2!1sid!2sid!4v1720080832284!5m2!1sid!2sid" width="100%" height="420" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
          </div>
        </div>

        <!-- Contact Form Block -->
        <div class="col-xl-6">
          <h2 class="pb-4">Leave a message</h2>
          <div class="row g-4">
            <div class="col-6 mb-3">
              <label for="exampleFormControlInput1" class="form-label">Fname</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="John">
            </div>
            <div class="col-6 mb-3">
              <label for="exampleFormControlInput1" class="form-label">Lname</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Doe">
            </div>
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@gmail.com">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Phone</label>
            <input type="tel" class="form-control" id="exampleFormControlInput1" placeholder="+6234567890">
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Country</label>
            <select class="form-select" aria-label="Default select example">
              <option value="1">Jabodetabek</option>
              <option value="2">Non Jabodetabek</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Message</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="7"></textarea>
          </div>
          <button style="background-color: #1565C0;" type="button" class="btn btn-dark">Send Message</button>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>

