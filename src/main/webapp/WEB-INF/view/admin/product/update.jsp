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

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const productFile = $("#productFile");
                        productFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <title>Update Product</title>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a> </li>
                                    <li class="breadcrumb-item active">Product</li>
                                    <li class="breadcrumb-item active">Update</li>

                                </ol>
                                <div class="mt-5" style="margin-bottom: 20px;">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto ">
                                            <h3>Update Product</h3>
                                            <hr>
                                            <form:form class="row" modelAttribute="newProduct" method="post"
                                                action="/admin/product/update" enctype="multipart/form-data">

                                                <!-- Variable -->
                                                <c:set var="nameError">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="priceError">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="detailDescError">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="shortDescError">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="quantityError">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>


                                                <div class="mb-3" style="display: none;">
                                                    <label for="">ID:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="">Name:</label>
                                                    <form:input type="text"
                                                        class="form-control w-100 ${not empty nameError ? 'is-invalid' : ''} "
                                                        path="name" />
                                                    ${nameError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="">Price:</label>
                                                    <form:input type="text"
                                                        class="form-control w-100 ${not empty priceError ? 'is-invalid' : ''} "
                                                        path="price" />
                                                    ${priceError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-12">
                                                    <label for="">Detail Desciption:</label>
                                                    <form:textarea
                                                        class="form-control ${not empty detailDescError ? 'is-invalid' : ''} "
                                                        rows="2" path="detailDesc" />
                                                    ${detailDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="">Short Desciption:</label>
                                                    <form:input type="text"
                                                        class="form-control w-100 ${not empty shortDescError ? 'is-invalid' : ''} "
                                                        path="shortDesc" />
                                                    ${shortDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="">Quanlity:</label>
                                                    <form:input type="text"
                                                        class="form-control w-100 ${not empty quantityError ? 'is-invalid' : ''} "
                                                        path="quantity" />
                                                    ${quantityError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        path="factory">
                                                        <form:option value="Apple">Apple</form:option>
                                                        <form:option value="Asus">Asus</form:option>
                                                        <form:option value="Lenovo">Lenovo</form:option>
                                                        <form:option value="Dell">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target:</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        path="target">
                                                        <form:option value="Gaming">Gaming</form:option>
                                                        <form:option value="Student">Student</form:option>
                                                        <form:option value="Graphics">Graphics</form:option>
                                                        <form:option value="Graphics">Business</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-12">
                                                    <label for="productFile" class="form-label">Image Product:</label>
                                                    <input type="file" class="form-control" id="productFile"
                                                        accept=".png, .jpg, .jpeg" name="productFile">
                                                </div>

                                                <div class="mb-3 col-12">
                                                    <img style="max-height: 250px;" alt="" id="productPreview"
                                                        src="/images/product/${newProduct.image}">
                                                </div>
                                                <div class="col-12 mb-5 w-100">
                                                    <button type="submit" class="btn btn-warning w-100">Update</button>
                                                </div>

                                            </form:form>
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
                <script src="/js/scripts.js"></script>
                <script src="../../../../resources/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>