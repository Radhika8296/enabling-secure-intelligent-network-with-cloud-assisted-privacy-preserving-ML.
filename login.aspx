<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Superman_Web.login" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Elastic Search | Login</title>
      <!-- Meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="Elastic Search - Secure login to access data exchange platform">
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
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)), url('images/bg1.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
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

   <body class="d-flex flex-column min-vh-100" style="background: linear-gradient(rgba(29, 53, 87, 0.7), rgba(29, 53, 87, 0.8)), url('images/bg1.jpg'); background-size: cover; background-position: center;">
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
                     <a class="nav-link" href="index.aspx"><i class="fas fa-home me-1"></i>Home</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="register.aspx"><i class="fas fa-user-plus me-1"></i>Register</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="login.aspx"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>

      <!-- Login Section -->
      <div class="py-5 container" >
         <div class="row justify-content-center">
            <div class="col-md-6">
               <div class="card shadow border-0 rounded-3">
                  <div class="card-header bg-dark text-white py-3">
                     <h4 class="mb-0"><i class="fas fa-sign-in-alt me-2"></i>Login</h4>
                  </div>
                  <div class="card-body p-4">
                     <form id="form1" runat="server">
                        <div class="mb-3">
                           <label for="txtIPAddress" class="form-label">IP Address</label>
                           <div class="input-group">
                              <span class="input-group-text"><i class="fas fa-network-wired"></i></span>
                              <input id="uname" runat="server" class="form-control" placeholder="Enter your IP address" required>
                           </div>
                        </div>
                        <div class="mb-3">
                           <label for="txtPassword" class="form-label">Password</label>
                           <div class="input-group">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                              <input type="password" id="pswd" runat="server" class="form-control" placeholder="Enter your password" required>
                           </div>
                        </div>
                        <div class="mb-3 form-check">
                           <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
                           <label class="form-check-label" for="chkRemember">Remember me</label>
                        </div>
                        <div class="d-grid gap-2">
                           <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                           <a href="register.aspx" class="btn btn-outline-secondary">Create an Account</a>
                        </div>
                        <div class="mt-3 text-center">
                           <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
    
      <!-- Footer -->
      <footer class="bg-dark text-white py-4 mt-auto">
         <div class="container">
            <div class="row gy-4">
               <div class="col-lg-4 col-md-6">
                  <h5 class="text-white mb-3">About Elastic Search</h5>
                  <p class="small text-muted mb-0">Elastic Search is a powerful platform for secure data exchange and management, providing robust solutions for businesses and individuals.</p>
               </div>
               <div class="col-lg-4 col-md-6">
                  <h5 class="text-white mb-3">Quick Links</h5>
                  <ul class="list-unstyled">
                     <li><a href="index.aspx"><i class="fas fa-home me-2"></i>Home</a></li>
                     <li><a href="register.aspx"><i class="fas fa-user-plus me-2"></i>Register</a></li>
                     <li><a href="login.aspx"><i class="fas fa-sign-in-alt me-2"></i>Login</a></li>
                  </ul>
               </div>
               <div class="col-lg-4 col-md-6">
                  <h5 class="text-white mb-3">Connect With Us</h5>
                  <div class="social-icons">
                     <a href="#" class="me-2 fs-5"><i class="fab fa-facebook-f"></i></a>
                     <a href="#" class="me-2 fs-5"><i class="fab fa-twitter"></i></a>
                     <a href="#" class="me-2 fs-5"><i class="fab fa-linkedin-in"></i></a>
                     <a href="#" class="me-2 fs-5"><i class="fab fa-github"></i></a>
                     <a href="#" class="fs-5"><i class="fab fa-instagram"></i></a>
                  </div>
                  <p class="small text-muted mt-3">&copy; 2023 Elastic Search. All rights reserved.</p>
               </div>
            </div>
         </div>
      </footer>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Font Awesome JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
   </body>
</html>
