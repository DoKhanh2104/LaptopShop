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
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <title>Table User</title>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h1>Table User</h1>
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
                                            <th>Action</th>
                                        </tr>

                                    </thead>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td class="text-center">${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td class="text-center">
                                                <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                                <a href="/admin/user/update/${user.id}"
                                                    class="btn btn-warning mx-2">Update</a>
                                                <a href="/admin/user/delete/${user.id}"
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </body>

            </html>