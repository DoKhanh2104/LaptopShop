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
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />

                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");
                            avatarFile.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            });
                        });
                    </script>

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





                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="tab-class">
                                <div class="row g-4">
                                    <div class="col-lg-12 text-center my-5">
                                        <h3>Update Profile</h3>
                                    </div>

                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4" mode>
                                                    <!-- Item -->
                                                    <form:form method="post" action="/update-profile"
                                                        modelAttribute="currentUser" class="row"
                                                        enctype="multipart/form-data">

                                                        <div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                        </div>

                                                        <div class="mb-3 col-12 col-md-6">
                                                            <c:set var="errorEmail">
                                                                <form:errors path="email" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="mb-2" for="">Email:</label>
                                                            <form:input type="email"
                                                                class="form-control ${not empty errorEmail ? 'is-invalid' :''} w-100"
                                                                path="email" disabled="true" />
                                                            ${errorEmail}
                                                        </div>


                                                        <div class="mb-3 col-12 col-md-6">
                                                            <c:set var="fullNameError">
                                                                <form:errors path="fullName"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="mb-2" for="">Fullname:</label>
                                                            <form:input type="text"
                                                                class="form-control ${not empty fullNameError ? 'is-invalid' : ''} "
                                                                path="fullName" />
                                                            ${fullNameError}
                                                        </div>

                                                        <div class="mb-3 col-12 col-md-6">
                                                            <label class="mb-2" for="">Phone:</label>
                                                            <form:input type="text" class="form-control" path="phone" />
                                                        </div>

                                                        <div class="mb-3 col-12 col-md-6">
                                                            <label class="mb-2" for="address">Address:</label>
                                                            <form:input type="text" class="form-control"
                                                                path="address" />
                                                        </div>


                                                        <div class="mb-3 col-12 col-md-6">
                                                            <label for="avatarFile" class="form-label">Avatar:</label>
                                                            <input type="file" class="form-control" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" name="avatarFile">
                                                        </div>

                                                        <div class="mb-3 col-12">
                                                            <img style="max-height: 250px; display: none;" alt=""
                                                                id="avatarPreview">
                                                        </div>

                                                        <div class="col-md-6 mb-5 mx-auto">
                                                            <button type="submit"
                                                                class="btn btn-warning w-100">Update</button>
                                                        </div>

                                                    </form:form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


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