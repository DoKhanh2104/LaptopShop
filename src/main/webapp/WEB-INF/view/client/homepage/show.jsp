<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>

                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />

                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css">

                    <title>Home Page</title>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <jsp:include page="../layout/banner.jsp" />

                    <!-- Laptop Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">
                                    <div class="col-lg-4 text-start">
                                        <h1>Highlight Product</h1>
                                    </div>
                                    <div class="col-lg-8 text-end">
                                        <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                            <li class="nav-item">
                                                <a class="d-flex m-2 py-2 bg-light rounded-pill active"
                                                    href="/products">
                                                    <span class="text-dark" style="width: 130px;">All Products</span>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4" mode>
                                                    <!-- Item -->
                                                    <c:forEach var="product" items="${products}">
                                                        <div class="col-md-6 col-lg-4 col-xl-3 ">
                                                            <a href="/product/${product.id}">
                                                                <div class="rounded position-relative fruite-item ">
                                                                    <div
                                                                        class="fruite-img overflow-hidden border border-secondary border-bottom-0 rounded-top">
                                                                        <img style="height: 200px;object-fit: cover"
                                                                            src="/images/product/${product.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                        style="top: 10px; left: 10px;">Laptop</div>
                                                                    <div style="height: 220px;"
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                        <h4 style="min-height: 52px;font-size: 20px;">
                                                                            <a href="/product/${product.id}">
                                                                                ${product.name}
                                                                            </a>

                                                                        </h4>
                                                                        <p style="font-size: 12px;">${product.shortDesc}
                                                                        </p>
                                                                        <div class="text-align-center mb-2">
                                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${product.price}" /> Đ
                                                                            </p>

                                                                        </div>
                                                                        <!-- <form
                                                                            action="/add-product-to-cart/${product.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" /> -->
                                                                        <button data-product-id="${product.id}"
                                                                            class="btnAddToCartHomePage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart
                                                                        </button>
                                                                        <!-- </form> -->
                                                                    </div>
                                                                </div>
                                                            </a>

                                                        </div>
                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Laptop Shop End-->

                    <!-- Feature -->
                    <jsp:include page="../layout/feature.jsp" />

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                    
                    <script>
                    $(document).ready(function() {
                        console.log('Homepage loaded');
                        
                        $('.btnAddToCartHomePage').click(function(e) {
                            e.preventDefault();
                            console.log('Homepage button clicked!');
                            
                            const productId = $(this).attr('data-product-id');
                            console.log('Product ID:', productId);
                            
                            const token = $("meta[name='_csrf']").attr("content");
                            const header = $("meta[name='_csrf_header']").attr("content");
                            const quantity = 1;
                            
                            console.log('Token:', token);
                            console.log('Header:', header);
                            console.log('Quantity:', quantity);
                            
                            $.ajax({
                                url: '/api/add-product-to-cart',
                                type: 'POST',
                                contentType: 'application/json',
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader(header, token);
                                },
                                data: JSON.stringify({
                                    productId: parseInt(productId),
                                    quantity: parseInt(quantity)
                                }),
                                success: function(response) {
                                    console.log('Success:', response);
                                    $('#sumCart').text(response);
                                    
                                    $.toast({
                                        heading: '🛒 Thành công',
                                        text: 'Sản phẩm đã được thêm vào giỏ hàng của bạn!',
                                        position: 'top-right',
                                        icon: 'success',
                                        showHideTransition: 'slide',
                                        allowToastClose: true,
                                        hideAfter: 3000,
                                        stack: 5,
                                        textAlign: 'left',
                                        bgColor: '#28a745',
                                        textColor: 'white',
                                        loader: false
                                    });
                                },
                                error: function(xhr, status, error) {
                                    console.error('Error:', error);
                                    console.error('Response:', xhr.responseText);
                                    
                                    $.toast({
                                        heading: '❌ Lỗi',
                                        text: 'Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại!',
                                        position: 'top-right',
                                        icon: 'error',
                                        showHideTransition: 'slide',
                                        allowToastClose: true,
                                        hideAfter: 4000,
                                        stack: 5,
                                        textAlign: 'left',
                                        bgColor: '#dc3545',
                                        textColor: 'white',
                                        loader: false
                                    });
                                }
                            });
                        });
                    });
                    </script>
                </body>

                </html>