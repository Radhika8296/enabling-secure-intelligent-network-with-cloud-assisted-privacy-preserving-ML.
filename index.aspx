<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Superman_Web.index" %>

<!DOCTYPE html>
<html lang="en">

<head>
   <title>Elastic Search | Secure Data Exchange Platform</title>
   <!-- Meta tags -->
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="Elastic Search - Enterprise-grade secure data exchange platform">
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
      .section-padding {
         padding: 80px 0;
      }
      .feature-icon {
         height: 80px;
         display: flex;
         align-items: center;
         justify-content: center;
      }
      .card {
         transition: transform 0.3s ease;
      }
      .card:hover {
         transform: translateY(-5px);
         box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      }
      footer a {
         color: #fff;
         text-decoration: none;
         transition: color 0.3s ease;
      }
      footer a:hover {
         color: #17a2b8 !important;
      }
   </style>
</head>

   <body class="d-flex flex-column min-vh-100">
      <!-- Navigation -->
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
                     <a class="nav-link active" aria-current="page" href="index.aspx"><i class="fas fa-home me-1"></i>Home</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="register.aspx"><i class="fas fa-user-plus me-1"></i>Register</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="login.aspx"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>

      <!-- Hero Section -->
      <header class="bg-primary text-white py-5">
         <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
               <div class="col-lg-7">
                  <h1 class="display-4 fw-bold mb-4">Secure Enterprise Data Exchange</h1>
                  <p class="lead mb-4">Elastic Search provides a secure platform for organizations to store, search, and exchange data with advanced analytics and real-time monitoring capabilities.</p>
                  <a href="register.aspx" class="btn btn-light btn-lg px-4 me-sm-3 fw-bold">Get Started</a>
                  <a href="#features" class="btn btn-outline-light btn-lg px-4">Learn More</a>
               </div>
               <div class="col-lg-5 d-none d-lg-block text-center">
                  <i class="fas fa-database fa-10x text-white-50 opacity-50"></i>
               </div>
            </div>
         </div>
      </header>

      <!-- Features Section -->
      <section class="section-padding">
         <div class="container">
            <div class="row text-center mb-5">
               <div class="col-12">
                  <h2 class="fw-bold mb-3">Why Choose Elastic Search?</h2>
                  <p class="lead">Our platform offers enterprise-grade security with powerful search capabilities</p>
               </div>
            </div>

            <div class="row g-4">
               <div class="col-md-4">
                  <div class="card h-100">
                     <div class="card-body text-center p-4">
                        <div class="feature-icon mb-3">
                           <i class="fas fa-shield-alt fa-3x text-primary"></i>
                        </div>
                        <h4 class="mb-3">Secure Storage</h4>
                        <p>End-to-end encryption ensures your data remains protected at all times, both in transit and
                           at rest.</p>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="card h-100">
                     <div class="card-body text-center p-4">
                        <div class="feature-icon mb-3">
                           <i class="fas fa-search fa-3x text-primary"></i>
                        </div>
                        <h4 class="mb-3">Advanced Search</h4>
                        <p>Powerful search algorithms help you find exactly what you need within seconds across all your
                           data.</p>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="card h-100">
                     <div class="card-body text-center p-4">
                        <div class="feature-icon mb-3">
                           <i class="fas fa-chart-bar fa-3x text-primary"></i>
                        </div>
                        <h4 class="mb-3">Real-time Analytics</h4>
                        <p>Monitor usage patterns and gain insights with comprehensive analytics and reporting tools.
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- Call to Action -->
      <section class="py-5 bg-primary text-white">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-lg-8 text-lg-start">
                  <h3 class="fw-bold mb-3">Ready to secure your enterprise data?</h3>
                  <p class="mb-0">Join thousands of organizations that trust Elastic Search for their data management
                     needs.</p>
               </div>
               <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                  <a href="register.aspx" class="btn btn-light btn-lg px-4">Sign Up Now</a>
               </div>
            </div>
         </div>
      </section>

      <!-- Footer -->
      <footer class="bg-dark">
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
                     <li class="mb-2"><a href="register.aspx" class="text-white-50"><i class="fas fa-user-plus me-2"></i>Register</a></li>
                     <li class="mb-2"><a href="login.aspx" class="text-white-50"><i class="fas fa-sign-in-alt me-2"></i>Login</a></li>
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
      <a href="#" id="toTop" class="btn btn-primary btn-lg rounded-circle position-fixed bottom-0 end-0 m-4 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
         <i class="fas fa-arrow-up"></i>
      </a>

      <!-- Scripts -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Font Awesome JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
      <script>
         // Smooth scrolling
         document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
               e.preventDefault();
               document.querySelector(this.getAttribute('href')).scrollIntoView({
                  behavior: 'smooth'
               });
            });
         });

         // Back to top button
         const toTopButton = document.getElementById('toTop');
         
         // Initially hide the button
         toTopButton.style.display = 'none';
         
         // Show/hide the button based on scroll position
         window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
               toTopButton.style.display = 'flex';
            } else {
               toTopButton.style.display = 'none';
            }
         });
         
         // Scroll to top when clicked
         toTopButton.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({
               top: 0,
               behavior: 'smooth'
            });
         });
      </script>
   </body>

   </html>