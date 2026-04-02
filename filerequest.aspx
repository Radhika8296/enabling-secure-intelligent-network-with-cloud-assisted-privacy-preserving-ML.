<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filerequest.aspx.cs" Inherits="Superman_Web.filerequest" %>

<!DOCTYPE html>
<html lang="zxx">
   <head>
      <title>Elastic Search | Intranet for secure data exchange</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Bootstrap 5 CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Font Awesome Icons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
      
      <!-- Custom CSS -->
      <style>
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
         }
         .bg-custom {
            background-image: url('images/bg1.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
         }
         .bg-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 0;
         }
         .bg-custom > * {
            position: relative;
            z-index: 1;
         }
         .card {
            transition: transform 0.3s, box-shadow 0.3s;
         }
         .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
         }
         footer a {
            color: #f8f9fa;
            text-decoration: none;
         }
         footer a:hover {
            color: #ffffff !important;
            text-decoration: underline;
         }
      </style>
   </head>
 <body class="d-flex flex-column min-vh-100 bg-custom">
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
                     <a class="nav-link" href="userpage.aspx">
                        <i class="fas fa-home me-1"></i>Home
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="fileupload.aspx">
                        <i class="fas fa-upload me-1"></i>Data load
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="managerequest.aspx">
                        <i class="fas fa-tasks me-1"></i>Requests
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link active" aria-current="page" href="filerequest.aspx">
                        <i class="fas fa-download me-1"></i>Get Files
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="managemyfiles.aspx">
                        <i class="fas fa-folder me-1"></i>My Files
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


 
      <div class="py-5" style="min-height:500px;">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card shadow">
                        <div class="card-header bg-dark text-white">
                            <h4 class="mb-0">Documents Available for Request</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="SqlDataSource1" 
                                        EmptyDataText="<div class='alert alert-info'>There are no documents available at this time.</div>" 
                                        CssClass="table table-striped table-hover" 
                                        Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDeleted="RowDelete" EnableModelValidation="True">
                                        <Columns>
                                            <asp:BoundField DataField="DocId" HeaderText="ID" SortExpression="DocId" />                                            
                                            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />                                            
                                            <asp:BoundField DataField="UploadedBy" HeaderText="Uploaded By" SortExpression="UploadedBy" />  
                                            <asp:BoundField DataField="UploadedDate" HeaderText="Uploaded Date" SortExpression="UploadedDate" />                    
                                            <asp:BoundField DataField="DocAuthor" HeaderText="Author" SortExpression="DocAuthor" />                       
                                            <asp:ButtonField ButtonType="Button" CommandName="Request" HeaderText="Action" 
                                                ShowHeader="True" Text="Request File" ControlStyle-CssClass="btn btn-primary btn-sm" />
                                        </Columns>
                                        <HeaderStyle CssClass="table-dark" />
                                        <RowStyle CssClass="align-middle" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>


     
       <div class="flex-grow-1"></div>



    
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
                     <li class="mb-2"><a href="userpage.aspx"><i class="fas fa-home me-2"></i>Dashboard</a></li>
                     <li class="mb-2"><a href="fileupload.aspx"><i class="fas fa-upload me-2"></i>Upload Files</a></li>
                     <li class="mb-2"><a href="filerequest.aspx"><i class="fas fa-download me-2"></i>Download Files</a></li>
                     <li class="mb-2"><a href="managemyfiles.aspx"><i class="fas fa-folder me-2"></i>My Files</a></li>
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
