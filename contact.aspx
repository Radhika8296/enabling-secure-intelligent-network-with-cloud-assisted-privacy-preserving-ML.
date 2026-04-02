<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Superman_Web.contact" %>
   <!DOCTYPE html>
   <html lang="en">

   <head>
      <title>Elastic Search | Contact Us</title>
      <!-- Meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description"
         content="Contact Elastic Search - Get in touch with our team for secure data exchange solutions">
      <!-- Bootstrap 5 CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      <!-- Custom CSS -->
      <style>
         body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f8f9fa;
         }
         .bg-custom {
            background-color: #f8f9fa;
         }
         .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
         }
         .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
         }
         footer {
            background-color: #212529;
            color: white;
            margin-top: auto;
         }
         footer a {
            color: #adb5bd;
            text-decoration: none;
            transition: color 0.3s ease;
         }
         footer a:hover {
            color: #ffffff !important;
            text-decoration: none;
         }
         #toTop {
            display: none;
            z-index: 999;
            opacity: 0.8;
         }
         #toTop:hover {
            opacity: 1;
         }
      </style>
   </head>

   <body>
      <!-- Navigation Bar -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
         <div class="container">
            <a class="navbar-brand" href="dashboard.aspx">
            <i class="fas fa-shield-alt me-2"></i>Elastic Search <span class="d-none d-md-inline">SECURE DATA EXCHANGE</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav ms-auto">
                  <li class="nav-item">
                     <a class="nav-link" href="dashboard.aspx"><i class="fas fa-home me-1"></i>Home</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="about.aspx"><i class="fas fa-info-circle me-1"></i>About</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="services.aspx"><i class="fas fa-cogs me-1"></i>Services</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link active" href="contact.aspx"><i class="fas fa-envelope me-1"></i>Contact</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="login.aspx"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>

      <!-- Page Header -->
      <div class="bg-primary text-white py-5">
         <div class="container">
            <div class="row">
               <div class="col-md-8 mx-auto text-center">
                  <h1 class="fw-bold mb-3">Contact Us</h1>
                  <p class="lead mb-0">We'd love to hear from you. Get in touch with our team.</p>
               </div>
            </div>
         </div>
      </div>

      <!-- Contact Info Section -->
      <section class="py-5 bg-light">
         <div class="container">
            <div class="row g-4 text-center">
               <div class="col-md-4">
                  <div class="card h-100 border-0 shadow-sm">
                     <div class="card-body p-4">
                        <div
                           class="rounded-circle bg-primary text-white d-inline-flex align-items-center justify-content-center mb-3"
                           style="width: 60px; height: 60px;">
                           <i class="fas fa-map-marker-alt fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Our Location</h4>
                        <p class="mb-0">123 Business Park, Tech Avenue<br>Bangalore, Karnataka 560001</p>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="card h-100 border-0 shadow-sm">
                     <div class="card-body p-4">
                        <div
                           class="rounded-circle bg-primary text-white d-inline-flex align-items-center justify-content-center mb-3"
                           style="width: 60px; height: 60px;">
                           <i class="fas fa-phone-alt fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Phone Number</h4>
                        <p class="mb-0">Support: (+91) 9036453696<br>Sales: (+91) 8800123456</p>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="card h-100 border-0 shadow-sm">
                     <div class="card-body p-4">
                        <div
                           class="rounded-circle bg-primary text-white d-inline-flex align-items-center justify-content-center mb-3"
                           style="width: 60px; height: 60px;">
                           <i class="fas fa-envelope fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Email Address</h4>
                        <p class="mb-0">
                           <a href="mailto:info@elasticsearch.com"
                              class="text-decoration-none">info@elasticsearch.com</a><br>
                           <a href="mailto:support@elasticsearch.com"
                              class="text-decoration-none">support@elasticsearch.com</a>
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- Contact Form Section -->
      <section class="py-5">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 mx-auto">
                  <div class="card border-0 shadow">
                     <div class="card-body p-5">
                        <h3 class="fw-bold mb-4 text-center">Send Us a Message</h3>
                        <form action="#" method="post">
                           <div class="row g-3">
                              <div class="col-md-6">
                                 <label for="name" class="form-label">First Name</label>
                                 <input type="text" class="form-control" id="name" name="Name"
                                    placeholder="Your first name" required>
                              </div>
                              <div class="col-md-6">
                                 <label for="lastname" class="form-label">Last Name</label>
                                 <input type="text" class="form-control" id="lastname" name="Last Name"
                                    placeholder="Your last name" required>
                              </div>
                              <div class="col-md-6">
                                 <label for="email" class="form-label">Email</label>
                                 <input type="email" class="form-control" id="email" name="Email"
                                    placeholder="Your email address" required>
                              </div>
                              <div class="col-md-6">
                                 <label for="phone" class="form-label">Phone</label>
                                 <input type="text" class="form-control" id="phone" name="Phone"
                                    placeholder="Your phone number" required>
                              </div>
                              <div class="col-12">
                                 <label for="message" class="form-label">Message</label>
                                 <textarea class="form-control" id="message" name="Message" rows="5"
                                    placeholder="How can we help you?" required></textarea>
                              </div>
                              <div class="col-12">
                                 <div class="d-grid">
                                    <button type="submit" class="btn btn-primary btn-lg">Send Message</button>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- Map Section -->
      <section class="py-5 bg-light">
         <div class="container">
            <div class="row">
               <div class="col-12">
                  <div class="card border-0 shadow">
                     <div class="card-body p-0">
                        <iframe
                           src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d497698.6600798865!2d77.35073573336324!3d12.954517008640543!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae1670c9b44e6d%3A0xf8dfc3e8517e4fe0!2sBengaluru%2C%20Karnataka!5e0!3m2!1sen!2sin!4v1656151626201!5m2!1sen!2sin"
                           width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- Footer -->
      <footer>
         <div class="container">
            <div class="row py-4">
               <div class="col-lg-4 mb-4 mb-lg-0">
                  <h5 class="text-white mb-3">About Elastic Search</h5>
                  <p class="text-white-50">Elastic Search provides secure data exchange solutions with advanced encryption and authentication for enterprises worldwide since 2015.</p>
               </div>
               <div class="col-lg-4 mb-4 mb-lg-0">
                  <h5 class="text-white mb-3">Quick Links</h5>
                  <ul class="list-unstyled">
                     <li class="mb-2"><a href="dashboard.aspx" class="text-white-50"><i class="fas fa-home me-2"></i>Dashboard</a></li>
                     <li class="mb-2"><a href="about.aspx" class="text-white-50"><i class="fas fa-info-circle me-2"></i>About</a></li>
                     <li class="mb-2"><a href="services.aspx" class="text-white-50"><i class="fas fa-cogs me-2"></i>Services</a></li>
                     <li class="mb-2"><a href="contact.aspx" class="text-white-50"><i class="fas fa-envelope me-2"></i>Contact</a></li>
                     <li><a href="login.aspx" class="text-white-50"><i class="fas fa-sign-in-alt me-2"></i>Login</a></li>
                  </ul>
               </div>
               <div class="col-lg-4">
                  <h5 class="text-white mb-3">Connect With Us</h5>
                  <div class="d-flex gap-3 fs-4">
                     <a href="#" class="text-decoration-none"><i class="fab fa-facebook"></i></a>
                     <a href="#" class="text-decoration-none"><i class="fab fa-twitter"></i></a>
                     <a href="#" class="text-decoration-none"><i class="fab fa-linkedin"></i></a>
                     <a href="#" class="text-decoration-none"><i class="fab fa-instagram"></i></a>
                     <a href="#" class="text-decoration-none"><i class="fab fa-youtube"></i></a>
                  </div>
               </div>
            </div>
            <hr class="my-4 bg-light opacity-25">
            <div class="row">
               <div class="col-md-7">
                  <p class="text-white-50 mb-0">
                     ©
                     <script>document.write(new Date().getFullYear());</script> Elastic Search. All Rights Reserved
                  </p>
               </div>
               <div class="col-md-5 text-md-end">
                  <p class="text-white-50 mb-0">Designed with <i class="fa fa-heart text-danger"></i> for security</p>
               </div>
            </div>
         </div>
      </footer>

      <!-- Back to top button -->
      <a href="#" id="toTop" class="btn btn-primary btn-lg rounded-circle position-fixed bottom-0 end-0 m-4">
         <i class="fa fa-arrow-up"></i>
      </a>

      <!-- Scripts -->
      <script src='js/jquery-2.2.3.min.js'></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
      <script src="js/jquery.waypoints.min.js"></script>
      <script src="js/jquery.countup.js"></script>
      <script src="js/move-top.js"></script>
      <script src="js/easing.js"></script>
      <script>
         // Counter
         $('.counter').countUp();

         // Smooth scrolling
         $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
               scrollTop: $(this.hash).offset().top
            }, 1000);
         });

         // Back to top
         $(document).ready(function () {
            $().UItoTop({
               easingType: 'easeOutQuart'
            });

            // Show/hide back to top button based on scroll position
            $(window).scroll(function() {
               if ($(this).scrollTop() > 300) {
                  $('#toTop').fadeIn();
               } else {
                  $('#toTop').fadeOut();
               }
            });
         });
      </script>
   </body>

   </html>