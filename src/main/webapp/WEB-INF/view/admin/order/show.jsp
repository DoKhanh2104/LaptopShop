<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Order</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">

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
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table Order</h3>

                                                </div>
                                                <hr>
                                                <div>
                                                    <table class="table table-bordered table-hover">
                                                        <thead class="text-center">
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Total Price</th>
                                                                <th>User</th>
                                                                <th>Receiver Name</th>
                                                                <th>Receiver Address</th>
                                                                <th>Receiver Phone</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>

                                                        </thead>
                                                        <c:forEach var="order" items="${orders}">
                                                            <tr>
                                                                <td class="text-center">${order.id}</td>
                                                                <td class="text-center">

                                                                    <fmt:formatNumber type="number"
                                                                        value="${order.totalPrice}" /> Đ

                                                                </td>
                                                                <td class="text-center">${order.user.fullName}</td>
                                                                <td class="text-center">${order.receiverName}</td>
                                                                <td class="text-center">${order.receiverAddress}</td>
                                                                <td class="text-center">${order.receiverPhone}</td>
                                                                <td class="text-center">${order.status}</td>
                                                                <td class="text-center">
                                                                    <a href="/admin/order/${order.id}"
                                                                        class="btn btn-success">View</a>
                                                                    <a href="/admin/order/update/${order.id}"
                                                                        class="btn btn-warning mx-2">Update</a>
                                                                    <a href="/admin/order/delete/${order.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </table>

                                                    <nav class="d-flex justify-content-center"
                                                        aria-label="Page navigation example">
                                                        <ul class="pagination">
                                                            <li class="page-item">
                                                                <a class="page-link ${currentPage == 1 ? 'disabled' : ''}"
                                                                    href="/admin/order?page=${currentPage - 1}"
                                                                    aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </li>
                                                            <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                                                <li
                                                                    class="page-item ${currentPage == loop.index ? 'active' : ''}">
                                                                    <a class="page-link"
                                                                        href="/admin/order?page=${loop.index}">${loop.index}</a>
                                                                </li>
                                                            </c:forEach>


                                                            <li class="page-item">
                                                                <a class="page-link ${currentPage == totalPage ? 'disabled' : ''}"
                                                                    href="/admin/order?page=${currentPage + 1}"
                                                                    aria-label="Next">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </div>
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