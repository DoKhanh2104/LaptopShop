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

                    <title>Product</title>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />



                    <!-- Laptop Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">

                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/">Home</a> </li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>

                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4 fruite">
                                            <div class="col-12 col-md-4">
                                                <div class="row g-4">
                                                    <!-- FACTORY -->
                                                    <div class="col-12 text-start" id="factoryFilter">
                                                        <div class="mb-2"><b>Factory</b></div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="APPLE"
                                                                class="form-check-input" id="factory-1">
                                                            <label class="form-check-label"
                                                                for="factory-1">Apple</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="ASUS" class="form-check-input"
                                                                id="factory-2">
                                                            <label class="form-check-label" for="factory-2">Asus</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="LENOVO"
                                                                class="form-check-input" id="factory-3">
                                                            <label class="form-check-label"
                                                                for="factory-3">Lenovo</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="DELL" class="form-check-input"
                                                                id="factory-4">
                                                            <label class="form-check-label" for="factory-4">Dell</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="LG" class="form-check-input"
                                                                id="factory-5">
                                                            <label class="form-check-label" for="factory-5">LG</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="ASER" class="form-check-input"
                                                                id="factory-6">
                                                            <label class="form-check-label" for="factory-6">Aser</label>
                                                        </div>
                                                    </div>
                                                    <!-- TARGET -->
                                                    <div class="col-12 text-start" id="targetFilter">
                                                        <div class="mb-2"><b>Target</b></div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="SINHVIEN-VANPHONG"
                                                                class="form-check-input" id="target-1">
                                                            <label class="form-check-label"
                                                                for="target-1">Student</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="MONG-NHE"
                                                                class="form-check-input" id="target-2">
                                                            <label class="form-check-label" for="target-2">Light</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="GAMING"
                                                                class="form-check-input" id="target-3">
                                                            <label class="form-check-label"
                                                                for="target-3">Gaming</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="THIET-KE-DO-HOA"
                                                                class="form-check-input" id="target-4">
                                                            <label class="form-check-label"
                                                                for="target-4">Graphics</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="DOANH-NHAN"
                                                                class="form-check-input" id="target-5">
                                                            <label class="form-check-label"
                                                                for="target-5">Bussiness</label>
                                                        </div>
                                                    </div>
                                                    <!-- Price -->
                                                    <div class="col-12 text-start" id="priceFilter">
                                                        <div class="mb-2"><b>Price</b></div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="duoi-10-trieu"
                                                                class="form-check-input" id="price-1">
                                                            <label class="form-check-label" for="price-1">Under
                                                                10M</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="10-15-trieu"
                                                                class="form-check-input" id="price-2">
                                                            <label class="form-check-label" for="price-2">From 10M to
                                                                15M</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="15-20-trieu"
                                                                class="form-check-input" id="price-3">
                                                            <label class="form-check-label" for="price-3">From 15M to
                                                                20M</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="checkbox" value="tren-20-trieu"
                                                                class="form-check-input" id="price-4">
                                                            <label class="form-check-label" for="price-4">Over
                                                                20M</label>
                                                        </div>
                                                    </div>
                                                    <!-- Sort -->
                                                    <div class="col-12 text-start">
                                                        <div class="mb-2"><b>Sort</b></div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" id="flexRadioDefault1"
                                                                value="gia-tang-dan">
                                                            <label class="form-check-label" for="flexRadioDefault1">
                                                                Ascending Price
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" id="flexRadioDefault2"
                                                                value="gia-giam-dan">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Descending Price
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" id="flexRadioDefault3" checked
                                                                value="gia-nothing">
                                                            <label class="form-check-label" for="flexRadioDefault3">
                                                                Not Sort
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <!-- Button -->
                                                    <div class="col-12">

                                                        <button
                                                            class="btn border border-secondary rounded-pill px-3 text-primary"
                                                            id="btnFilter">
                                                            Filter
                                                        </button>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-12 col-md-8 text-center">
                                                <div class="row g-4">
                                                    <!-- Item -->
                                                    <c:if test="${totalPage == 0}">
                                                        <div>No data</div>
                                                    </c:if>
                                                    <c:forEach var="product" items="${products}">
                                                        <div class="col-md-6 col-lg-4 col-xl-4 ">
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
                                                                        <form
                                                                            action="/add-product-to-cart/${product.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <button
                                                                                class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                Add to cart
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </a>

                                                        </div>
                                                    </c:forEach>

                                                    <c:if test="${totalPage > 0}">
                                                        <div class="col-12">
                                                            <nav class="d-flex justify-content-center mt-5">
                                                                <ul class="pagination"
                                                                    style="display: flex !important; flex-direction: row !important;">
                                                                    <li
                                                                        class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                                        <a class="page-link"
                                                                            href="/products?page=${currentPage - 1}${qs}">&laquo;</a>
                                                                    </li>
                                                                    <c:forEach begin="1" end="${totalPage}"
                                                                        varStatus="loop">
                                                                        <li
                                                                            class="page-item ${currentPage == loop.index ? 'active' : ''}">
                                                                            <a class="page-link"
                                                                                href="/products?page=${loop.index}${qs}">${loop.index}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                    <li
                                                                        class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
                                                                        <a class="page-link"
                                                                            href="/products?page=${currentPage + 1}${qs}">&raquo;</a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </c:if>

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

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>