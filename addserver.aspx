
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addserver.aspx.cs" Inherits="Superman_Web.addserver" %>

<!DOCTYPE html>
<html lang="zxx">
   <head>
      <title>Elastic Search | Intranet for secure data exchange</title>
      <!--meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="keywords" content="Clean & Dry Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
         Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
      <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      <!--//meta tags ends here-->
      <!-- Bootstrap 5 CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Font Awesome CSS -->
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
         }
         .bg-custom {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('images/bg1.jpg');
            background-size: cover;
            background-position: center;
            min-height: 500px;
         }
         .card:hover {
            transform: translateY(-5px);
            transition: transform 0.3s ease;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
         }
         footer a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
         }
         footer a:hover {
            color: #17a2b8;
         }
      </style>
   </head>
   <body>
      <!-- Navigation -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top">
         <div class="container">
            <a class="navbar-brand fw-bold" href="index.aspx">
               <i class="fas fa-shield-alt me-2"></i>Elastic Search
               <span class="d-none d-md-inline fs-6 fw-light">SECURE DATA EXCHANGE</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                     <a class="nav-link" href="adminhome.aspx">
                        <i class="fas fa-home me-1"></i>Home
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="addserver.aspx">
                        <i class="fas fa-server me-1"></i>Add Server
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="manageservers.aspx">
                        <i class="fas fa-cogs me-1"></i>Servers
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="usageanalytics.aspx">
                        <i class="fas fa-chart-bar me-1"></i>Analytics
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="login.aspx">
                        <i class="fas fa-sign-out-alt me-1"></i>Logout
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>


      <div class="py-5 bg-custom">
         <div class="container">
            <div class="row">
               <div class="col-lg-6">
                  <img src="./images/server.jpg" class="img-fluid rounded" alt="Server Image" />
               </div>
               
               <div class="col-lg-6">
                  <div class="card shadow">
                     <div class="card-header bg-primary text-white">
                        <h3 class="text-center mb-0">Add New Server</h3>
                     </div>
                     <div class="card-body">
                        <form id="form1" runat="server">
                           <div class="mb-3">
                              <label for="sname" class="form-label">Server Name</label>
                              <div class="input-group">
                                 <span class="input-group-text"><i class="fas fa-server"></i></span>
                                 <input type="text" id="sname" runat="server" class="form-control" placeholder="Enter server name" />
                              </div>
                           </div>
                           
                           <div class="mb-3">
                              <label for="surl" class="form-label">Server URL</label>
                              <div class="input-group">
                                 <span class="input-group-text"><i class="fas fa-link"></i></span>
                                 <input type="text" id="surl" runat="server" class="form-control" placeholder="Enter server URL" />
                              </div>
                           </div>
                           
                           <div class="mb-3">
                              <label for="DropDownList1" class="form-label">Location</label>
                              <div class="input-group">
                                 <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                                    <asp:ListItem>Select Location...</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                 </asp:DropDownList>
                              </div>
                           </div>
                           
                           <div class="mb-3">
                              <label for="serverSize" class="form-label">Server Size (MB)</label>
                              <div class="input-group">
                                 <span class="input-group-text"><i class="fas fa-database"></i></span>
                                 <input type="number" id="serverSize" runat="server" class="form-control" min="1" placeholder="Enter server size" />
                              </div>
                           </div>
                           
                           <div class="mb-3">
                              <label for="FileUpload1" class="form-label">Upload Image</label>
                              <div class="input-group">
                                 <span class="input-group-text"><i class="fas fa-image"></i></span>
                                 <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                 <asp:Button ID="Button1" runat="server" Text="Load Image" OnClick="Button1_Click" CssClass="btn btn-secondary" />
                              </div>
                           </div>
                           
                           <div class="mb-3">
                              <asp:Image ID="Image1" runat="server" CssClass="img-fluid" Width="400" Height="150" Visible="false" />
                           </div>
                           
                           <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                              <input type="button" id="reset" value="Reset" onserverclick="Reset" runat="server" class="btn btn-secondary me-md-2" />
                              <input id="upload" type="button" value="Add Server" onserverclick="Upload" runat="server" class="btn btn-primary" />
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>





    
      <!-- Footer -->
      <footer class="bg-dark text-white py-5 mt-auto">
         <div class="container">
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
                     <li class="mb-2"><a href="adminhome.aspx"><i class="fas fa-home me-2"></i>Dashboard</a></li>
                     <li class="mb-2"><a href="addserver.aspx"><i class="fas fa-server me-2"></i>Add Server</a></li>
                     <li class="mb-2"><a href="manageservers.aspx"><i class="fas fa-cogs me-2"></i>Manage Servers</a></li>
                     <li class="mb-2"><a href="usageanalytics.aspx"><i class="fas fa-chart-bar me-2"></i>Usage Analytics</a></li>
                  </ul>
               </div>
               
               <!-- Connect With Us -->
               <div class="col-lg-4">
                  <h5 class="mb-3">Connect With Us</h5>
                  <div class="d-flex gap-3">
                     <a href="#" class="btn btn-sm btn-outline-light rounded-circle">
                        <i class="fab fa-facebook-f"></i>
                     </a>
                     <a href="#" class="btn btn-sm btn-outline-light rounded-circle">
                        <i class="fab fa-twitter"></i>
                     </a>
                     <a href="#" class="btn btn-sm btn-outline-light rounded-circle">
                        <i class="fab fa-linkedin-in"></i>
                     </a>
                     <a href="#" class="btn btn-sm btn-outline-light rounded-circle">
                        <i class="fab fa-instagram"></i>
                     </a>
                     <a href="#" class="btn btn-sm btn-outline-light rounded-circle">
                        <i class="fab fa-youtube"></i>
                     </a>
                  </div>
                  <p class="mt-3 text-white-50">© <script>document.write(new Date().getFullYear());</script> Elastic Search. All Rights Reserved</p>
               </div>
            </div>
         </div>
      </footer>

      <!-- Back to top button -->
      <a href="#" class="btn btn-primary back-to-top position-fixed rounded-circle p-2" style="display: none; right: 15px; bottom: 15px; z-index: 99;">
         <i class="fas fa-arrow-up"></i>
      </a>

      <!-- Bootstrap JS Bundle with Popper -->
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
