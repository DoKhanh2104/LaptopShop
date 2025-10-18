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
                <title>User Detail ID : ${id}</title>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h1>User Detail with ID = ${id}</h1>

                            </div>
                            <hr>
                            <div class="card mx-auto" style="width: 60%;">
                                <div class="card-header bg-primary text-white fw-bold">
                                    User Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${id}</li>
                                    <li class="list-group-item">Email: ${userByID.email}</li>
                                    <li class="list-group-item">Full Name: ${userByID.fullName}</li>
                                    <li class="list-group-item">Address: ${userByID.address}</li>
                                </ul>
                            </div>

                            <a class="btn btn-primary mt-3" href="/admin/user">Quay lại</a>
                        </div>
                    </div>
                </div>

            </body>

            </html>