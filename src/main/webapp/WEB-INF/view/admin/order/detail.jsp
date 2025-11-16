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
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <title>Table Detail</title>
                </head>

                <body>

                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a> </li>
                                        <li class="breadcrumb-item active">Order</li>
                                        <li class="breadcrumb-item active">View</li>

                                    </ol>
                                    <div class=" mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Order Detail with ID = ${id}</h3>

                                                </div>
                                                <hr>
                                                <div class="d-flex flex-row">
                                                    <c:forEach var="orderDetail" items="${orderDetails}">

                                                        <div class="card mx-auto" style="width: 40%;">

                                                            <div
                                                                class="card-header bg-primary bg-gradient text-black fw-bold">
                                                                Order Information
                                                            </div>

                                                            <ul class="list-group list-group-flush">

                                                                <li class="list-group-item">Product:
                                                                    <img class="card-img-top"
                                                                        src="/images/product/${orderDetail.product.image}"
                                                                        alt="" />
                                                                </li>
                                                                <li class="list-group-item">Product's Name:
                                                                    ${orderDetail.product.name}
                                                                </li>
                                                                <li class="list-group-item">Price:
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price}" /> Đ

                                                                </li>
                                                                <li class="list-group-item">Quantity:
                                                                    ${orderDetail.quantity}
                                                                </li>


                                                            </ul>

                                                        </div>


                                                    </c:forEach>
                                                </div>

                                                <a class="btn btn-primary mt-3" href="/admin/order">Back</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                        crossorigin="anonymous"></script>

                </body>

                </html>