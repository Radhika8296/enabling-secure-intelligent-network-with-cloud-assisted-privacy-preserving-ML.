<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managefiles.aspx.cs" Inherits="Superman_Web.managefiles" %>

   <!DOCTYPE html>
   <html lang="zxx">

   <head>
      <title>Elastic Search | Intranet for secure data exchange</title>
      <!-- Meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="Elastic Search - Manage files in your secure data exchange platform">
      
      <!-- Bootstrap 5 CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      
      <!-- Font Awesome Icons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
      
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      
      <style>
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
         }
         .table {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            overflow: hidden;
         }
         .bg-custom {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('images/bg1.jpg');
            background-size: cover;
            background-position: center;
            min-height: 500px;
            padding: 2rem 0;
         }
         .card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
         }
         .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
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
         
         /* Back to top button */
         .back-to-top {
            position: fixed;
            bottom: 25px;
            right: 25px;
            display: none;
            z-index: 99;
            padding: 10px 12px;
            border-radius: 50%;
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
               aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                     <a class="nav-link" href="validateusers.aspx">
                        <i class="fas fa-user-check me-1"></i>Validate
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="manageusers.aspx">
                        <i class="fas fa-users me-1"></i>Users
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="managefiles.aspx">
                        <i class="fas fa-file me-1"></i>Files
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


      <!-- Main Content -->
      <div class="bg-custom py-5">
         <div class="container">
            <div class="row justify-content-center">
               <div class="col-lg-10">
                  <div class="card shadow-lg p-4 mb-5">
                     <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="fas fa-file me-2"></i>Manage Files</h4>
                     </div>
                     <div class="card-body">
                        <form id="HomeForm" runat="server">
                           <div class="table-responsive">
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                 CssClass="table table-striped table-hover align-middle" 
                                 EmptyDataText="There are no data records to display." Width="100%"
                                 OnRowCommand="GridView1_RowCommand" OnRowDeleted="RowDelete"
                                 EnableModelValidation="True" BorderWidth="0">
                                 <Columns>
                                    <asp:BoundField DataField="DocId" HeaderText="Document ID" SortExpression="DocId" />
                                    <asp:BoundField DataField="DocName" HeaderText="Document Name" SortExpression="DocName" />
                                    <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
                                    <asp:BoundField DataField="DocAuthor" HeaderText="Author" SortExpression="DocAuthor" />
                                    <asp:BoundField DataField="ServerName" HeaderText="Server" SortExpression="ServerName" />
                                    <asp:BoundField DataField="FileSizeMB" HeaderText="Size (MB)" SortExpression="FileSizeMB" />
                                    <asp:BoundField DataField="ServerSpace" HeaderText="Server Space %" SortExpression="ServerSpace" />
                                    <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Action" 
                                       ShowHeader="True" Text="Delete" ControlStyle-CssClass="btn btn-danger btn-sm">
                                       <ControlStyle CssClass="btn btn-danger btn-sm"></ControlStyle>
                                    </asp:ButtonField>
                                 </Columns>
                                 <HeaderStyle CssClass="table-dark" />
                                 <RowStyle CssClass="align-middle" />
                              </asp:GridView>
                           </div>
                           
                           <div class="mt-4 text-end">
                              <a href="fileupload.aspx" class="btn btn-primary">
                                 <i class="fas fa-plus me-2"></i>Upload New File
                              </a>
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
                     <li class="mb-2"><a href="validateusers.aspx"><i class="fas fa-user-check me-2"></i>Validate Users</a></li>
                     <li class="mb-2"><a href="manageusers.aspx"><i class="fas fa-users me-2"></i>Manage Users</a></li>
                     <li class="mb-2"><a href="managefiles.aspx"><i class="fas fa-file me-2"></i>Manage Files</a></li>
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
      <a href="#" class="btn btn-primary btn-sm back-to-top">
         <i class="fas fa-arrow-up"></i>
      </a>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Font Awesome JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
      <!-- jQuery -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
      <!-- Custom JS -->
      <script>
         // Back to top button
         $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
               $('.back-to-top').fadeIn();
            } else {
               $('.back-to-top').fadeOut();
            }
         });
         
         $('.back-to-top').click(function() {
            $('html, body').animate({scrollTop: 0}, 800);
            return false;
         });
      </script>
   </body>
</html>