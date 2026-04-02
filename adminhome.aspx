<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="Superman_Web.adminhome" %>

   <!DOCTYPE html>
   <html lang="en">

   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Admin Dashboard | Elastic Search</title>

      <!-- Bootstrap 5 CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- Font Awesome Icons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

      <!-- Google Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
         rel="stylesheet">

      <style>
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
         }

         .admin-sidebar {
            background-color: #212529;
            min-height: calc(100vh - 56px);
         }

         .admin-sidebar .nav-link {
            color: rgba(255, 255, 255, 0.75);
            border-radius: 0;
            padding: 0.75rem 1.25rem;
         }

         .admin-sidebar .nav-link:hover {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.1);
         }

         .admin-sidebar .nav-link.active {
            color: #fff;
            background-color: #0d6efd;
         }

         .admin-sidebar .nav-link i {
            width: 24px;
            text-align: center;
            margin-right: 0.5rem;
         }

         .stat-card {
            border-radius: 0.75rem;
            border: none;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            transition: all 0.3s ease;
         }

         .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
         }

         .stat-card .card-body {
            padding: 1.5rem;
         }

         .stat-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-size: 1.5rem;
         }

         .action-card {
            border: none;
            border-radius: 0.75rem;
            overflow: hidden;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            transition: all 0.3s ease;
         }

         .action-card:hover {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
         }

         .action-card .card-body {
            padding: 1.5rem;
         }

         .navbar-brand {
            font-weight: 700;
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

   <body>
      <!-- Top Navigation -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top">
         <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="adminhome.aspx">
               <i class="fas fa-shield-alt me-2"></i>
               Elastic Search Admin
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
               aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav ms-auto">
                  <li class="nav-item">
                     <a class="nav-link" href="login.aspx">
                        <i class="fas fa-sign-out-alt me-2"></i>
                        Logout
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>

      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-2 col-md-3 px-0 admin-sidebar d-none d-md-block">
               <div class="d-flex flex-column flex-shrink-0 p-3">
                  <ul class="nav nav-pills flex-column mb-auto">
                     <li class="nav-item">
                        <a href="adminhome.aspx" class="nav-link active">
                           <i class="fas fa-tachometer-alt"></i>
                           Dashboard
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="manageservers.aspx" class="nav-link">
                           <i class="fas fa-server"></i>
                           Servers
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="manageusers.aspx" class="nav-link">
                           <i class="fas fa-users"></i>
                           Users
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="managefiles.aspx" class="nav-link">
                           <i class="fas fa-file-alt"></i>
                           Files
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="usageanalytics.aspx" class="nav-link">
                           <i class="fas fa-chart-line"></i>
                           Analytics
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="validateusers.aspx" class="nav-link">
                           <i class="fas fa-user-check"></i>
                           Validate Users
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="qfiles.aspx" class="nav-link">
                           <i class="fas fa-shield-alt"></i>
                           Quarantine
                        </a>
                     </li>
                     <li class="nav-item">
                        <a href="login.aspx" class="nav-link">
                           <i class="fas fa-sign-out-alt"></i>
                           Logout
                        </a>
                     </li>
                  </ul>
               </div>
            </div>

            <!-- Main Content -->
            <div class="col-lg-10 col-md-9 ms-sm-auto px-md-4 py-4">
               <div
                  class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                  <h1 class="h2">Admin Dashboard</h1>
                  <div class="btn-toolbar mb-2 mb-md-0">
                     <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                     </div>
                     <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <i class="fas fa-calendar me-1"></i>
                        This week
                     </button>
                  </div>
               </div>


               <!-- Quick Actions -->
               <div class="row mb-4">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-header bg-white">
                           <h5 class="card-title mb-0">Quick Actions</h5>
                        </div>
                        <div class="card-body">
                           <form id="form1" runat="server" class="row g-3">
                              <div class="col-md-4">
                                 <asp:Button ID="Button1" runat="server" Text="Quarantine Malicious Files"
                                    CssClass="btn btn-danger w-100 d-flex align-items-center justify-content-center gap-2"
                                    OnClick="Button1_Click">
                                 </asp:Button>
                              </div>
                              <div class="col-md-4">
                                 <a href="validateusers.aspx"
                                    class="btn btn-primary w-100 d-flex align-items-center justify-content-center gap-2">
                                    <i class="fas fa-user-check"></i>
                                    Validate New Users
                                 </a>
                              </div>
                              <div class="col-md-4">
                                 <a href="addserver.aspx"
                                    class="btn btn-success w-100 d-flex align-items-center justify-content-center gap-2">
                                    <i class="fas fa-plus-circle"></i>
                                    Add New Server
                                 </a>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>

      <!-- Footer -->
      <footer class="bg-dark text-white py-5 mt-auto">
         <div class="container-fluid">
            <div class="row g-4">
               <!-- About Elastic Search -->
               <div class="col-lg-4">
                  <h5 class="mb-3">About Elastic Search</h5>
                  <p class="text-white-50">Elastic Search provides a secure platform for data exchange within your organization. Our system ensures data integrity, confidentiality, and availability.</p>
               </div>
               
               <!-- Quick Links -->
               <div class="col-lg-4">
                  <h5 class="mb-3">Quick Links</h5>
                  <ul class="list-unstyled">
                     <li class="mb-2"><a href="adminhome.aspx"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a></li>
                     <li class="mb-2"><a href="manageservers.aspx"><i class="fas fa-server me-2"></i>Manage Servers</a></li>
                     <li class="mb-2"><a href="manageusers.aspx"><i class="fas fa-users me-2"></i>Manage Users</a></li>
                     <li class="mb-2"><a href="usageanalytics.aspx"><i class="fas fa-chart-line me-2"></i>Usage Analytics</a></li>
                  </ul>
               </div>
               
               <!-- Copyright -->
               <div class="col-lg-4">
                  <h5 class="mb-3">Copyright</h5>
                  <p class="text-white-50">© <script>document.write(new Date().getFullYear());</script> Elastic Search. All Rights Reserved</p>
               </div>
            </div>
         </div>
      </footer>

      <!-- Back to top button -->
      <a href="#" class="btn btn-primary back-to-top position-fixed rounded-circle p-2" style="display: none; right: 15px; bottom: 15px; z-index: 99;">
         <i class="fas fa-arrow-up"></i>
      </a>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Font Awesome JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
      
      <!-- Custom JS -->
      <script>
         // Back to top button functionality
         const backToTopButton = document.querySelector('.back-to-top');
         
         window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
               backToTopButton.style.display = 'block';
            } else {
               backToTopButton.style.display = 'none';
            }
         });
         
         backToTopButton.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
         });
      </script>
   </body>

   </html>