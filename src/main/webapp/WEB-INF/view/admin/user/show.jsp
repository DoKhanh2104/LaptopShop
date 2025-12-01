<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <title>Table User</title>
            </head>

            <body>

                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a> </li>
                                    <li class="breadcrumb-item active">User</li>

                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Table User</h3>
                                                <button onclick=" document.location.href ='./user/create' "
                                                    class="btn btn-primary">Create
                                                    User</button>
                                            </div>
                                            <hr>
                                            <div>
                                                <table class="table table-bordered table-hover">
                                                    <thead class="text-center">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Email</th>
                                                            <th>Full Name</th>
                                                            <th>Role</th>
                                                            <th>Action</th>
                                                        </tr>

                                                    </thead>
                                                    <c:forEach var="user" items="${users}">
                                                        <tr>
                                                            <td class="text-center">${user.id}</td>
                                                            <td>${user.email}</td>
                                                            <td>${user.fullName}</td>
                                                            <td>${user.role.name}</td>
                                                            <td class="text-center">
                                                                <a href="/admin/user/${user.id}"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/user/update/${user.id}"
                                                                    class="btn btn-warning mx-2">Update</a>
                                                                <a href="/admin/user/delete/${user.id}"
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
                                                                href="/admin/user?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                                            <li
                                                                class="page-item ${currentPage == loop.index ? 'active' : ''}">
                                                                <a class="page-link"
                                                                    href="/admin/user?page=${loop.index}">${loop.index}</a>
                                                            </li>
                                                        </c:forEach>


                                                        <li class="page-item">
                                                            <a class="page-link ${currentPage == totalPage ? 'disabled' : ''}"
                                                                href="/admin/user?page=${currentPage + 1}"
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