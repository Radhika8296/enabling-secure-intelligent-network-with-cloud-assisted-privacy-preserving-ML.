<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="Superman_Web.forgotpassword"
    %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reset Password | Elastic Search</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f8f9fa;
            }

            .navbar-brand {
                font-weight: 700;
            }

            .auth-wrapper {
                min-height: calc(100vh - 180px);
                display: flex;
                align-items: center;
            }

            .auth-card {
                border: none;
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                border-radius: 1rem;
                overflow: hidden;
            }

            .auth-sidebar {
                background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
                color: white;
                padding: 3rem 1.5rem;
            }

            .auth-form {
                padding: 3rem 2rem;
            }

            .btn-primary {
                padding: 0.6rem 1.5rem;
            }

            .social-icons a {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.1);
                color: white;
                margin-right: 0.5rem;
                transition: all 0.3s ease;
            }

            .social-icons a:hover {
                background-color: rgba(255, 255, 255, 0.2);
                transform: translateY(-3px);
            }
        </style>
    </head>

    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="index.aspx">
                    <i class="fas fa-database text-primary me-2"></i>
                    Elastic Search
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.aspx">Register</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="login.aspx">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.aspx">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="auth-wrapper">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="card auth-card">
                            <div class="row g-0">
                                <div class="col-lg-5 d-none d-lg-block">
                                    <div class="auth-sidebar h-100">
                                        <h2 class="mb-4">Password Recovery</h2>
                                        <p class="mb-5">Enter your email address and we'll send you instructions to
                                            reset your password.</p>

                                        <div class="mt-5">
                                            <h5 class="mb-3">Secure Data Exchange</h5>
                                            <ul class="list-unstyled">
                                                <li class="mb-2"><i class="fas fa-check-circle me-2"></i> End-to-end
                                                    encryption</li>
                                                <li class="mb-2"><i class="fas fa-check-circle me-2"></i> Advanced
                                                    search capabilities</li>
                                                <li class="mb-2"><i class="fas fa-check-circle me-2"></i> Real-time
                                                    analytics</li>
                                            </ul>
                                        </div>

                                        <div class="mt-5">
                                            <div class="social-icons">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#"><i class="fab fa-github"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="auth-form">
                                        <div class="text-center mb-5">
                                            <h3 class="fw-bold">Forgot Your Password?</h3>
                                            <p class="text-muted">We'll help you reset it and get back on track</p>
                                        </div>

                                        <form id="form1" runat="server">
                                            <div class="mb-4">
                                                <label for="email" class="form-label">Email Address</label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i
                                                            class="fas fa-envelope"></i></span>
                                                    <input type="text" class="form-control form-control-lg"
                                                        placeholder="Enter your email" runat="server" id="email" />
                                                </div>
                                                <div class="form-text">We'll send a password reset link to this email
                                                </div>
                                            </div>

                                            <div class="d-grid gap-2 mb-4">
                                                <input id="logi" type="button" value="Send Reset Link"
                                                    class="btn btn-primary btn-lg" runat="server"
                                                    onserverclick="Login" />
                                                <input id="reset" type="button" value="Cancel"
                                                    class="btn btn-outline-secondary" runat="server"
                                                    onserverclick="Reset" />
                                            </div>

                                            <div class="text-center">
                                                <p>Remember your password? <a href="login.aspx">Back to Login</a></p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p class="mb-0">
                            ©
                            <script>document.write(new Date().getFullYear());</script> Elastic Search. All Rights
                            Reserved
                        </p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-github"></i></a>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>