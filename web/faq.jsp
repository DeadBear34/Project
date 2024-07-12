<%-- 
    Document   : faq
    Created on : Jul 4, 2024, 3:19:57 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/faqs/faq-2/assets/css/faq-2.css">
</head>
<body>
    <jsp:include page="header.jsp" />
<!-- FAQ 2 - Bootstrap Brain Component -->
<section class="bsb-faq-2 bg-light py-3 py-md-5 py-xl-8">
    <div class="container mt-4" style="min-height: 850px">
      <div class="row gy-5 gy-lg-0">
        <div class="col-12 col-lg-6">
          <h3 class="h1 mb-3">How can we help you? On this page, all your questions and uncertainties about ApoteKu's services and the features available on this website will be resolved! </h3>
          <p class="lead fs-4 text-secondary mb-4">We hope you have found an answer to your question. If you need any help, please search your query on our Support Center or contact us via email. Our team is always ready to assist you with your healthcare needs and ensure you receive the best possible service. 
                                                   We are committed to providing you with the support and information you need for a healthy life.</p>
          <a href="#!" class="btn btn-lg bsb-btn-2xl btn-primary">All FAQ</a>
        </div>
        <div class="col-12 col-lg-6">
          <div class="row justify-content-xl-end">
            <div class="col-12 col-xl-11">
              <div class="accordion accordion-flush" id="accordionExample">
                <div class="accordion-item mb-4 shadow-sm">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button bg-transparent fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      How do I create an account?
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>To create an account, please follow these steps:</p>
                      <ul>
                        <li>Go to our website and click 'Sign Up' button which located above or click the 'Register' button.</li>
                        <li>Fill in all the personal information required in the form.</li>
                        <li>Once completed, click 'Register'.</li>
                        <li>Now, you already have an account!</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="accordion-item mb-4 shadow-sm">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed bg-transparent fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      How Does Payment System Work in ApoteKu?
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo">
                    <div class="accordion-body">
                      The payment system is a way to transactions or transfer without needing to complete them offline. ApoteKu offers several payment methods, including credit/debit cards and PayPal.
                    </div>
                  </div>
                </div>
                <div class="accordion-item mb-4 shadow-sm">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed bg-transparent fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Are your products authentic? And how can I find the right medicine?
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree">
                    <div class="accordion-body">
                      All our products are sourced from licensed manufacturers and distributors to ensure authenticity. And you can use our search bar to find medications by name, type, or indication.
                    </div>
                  </div>
                </div>
                <div class="accordion-item mb-4 shadow-sm">
                  <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed bg-transparent fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      What If The Medication I Need Is Not Listed?
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour">
                    <div class="accordion-body">
                      Contact our customer service, and we will assist you in finding the required medication.
                    </div>
                  </div>
                </div>
                <div class="accordion-item shadow-sm">
                  <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed bg-transparent fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                      How Long Does Delivery Take?
                    </button>
                  </h2>
                  <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive">
                    <div class="accordion-body">
                        <p>Standard delivery takes 3-5 business days. Expedited options are available at checkout.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
<jsp:include page="footer.jsp" />
  <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>