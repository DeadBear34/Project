<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Obat Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <style>
    .container {
      height: 100%;
      max-width: 800px;
    }
    .mt-4 {
      margin-top: 2rem;
    }
    .btn-group {
      margin-bottom: 1rem;
    }
    .alert {
      margin-top: 1rem;
    }
  </style>
</head>
<body>
    <jsp:include page="admin_header.jsp" />

    <!-- Menampilkan peran pengguna -->
    <div class="container mt-4">
        <c:if test="${not empty sessionScope.role}">
            <div class="alert alert-info" role="alert">
                Your role: ${sessionScope.role}
            </div>
        </c:if>
    </div>

    <div class="container mt-4" style="min-height:800px">
        <h2 class="d-inline">Obat List</h2>
        <form id="searchForm" class="form-inline float-right" action="ObatServlet" method="GET">
            <input id="searchInput" class="form-control mr-sm-2" type="text" placeholder="Search" name="keyword" value="${searchKeyword}">
            <input type="hidden" name="action" value="search">
            <input type="hidden" name="page" value="${param.page}">
            <button class="btn btn-outline-primary my-2 my-sm-3" type="submit">Search</button>
        </form>
        <div class="clearfix"></div>
        <div class="float-right mb-2">
            <a href="ObatServlet?action=new&page=${param.page}" class="btn btn-success">Add New Obat</a>
        </div>
        <div class="clearfix"></div>
        
        <!-- Check if obats list is empty -->
        <c:if test="${empty obats}">
            <div class="alert alert-info mt-4" role="alert">
                No medicines found.
            </div>
        </c:if>

        <c:if test="${not empty obats}">
            <table id="obatTable" class="table table-striped mt-4">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nama Obat</th>
                        <th>Jenis Obat</th>
                        <th>Bentuk Sediaan</th>
                        <th>Dosis</th>
                        <th>Indikasi</th>
                        <th>Efek Samping</th>
                        <th>Harga</th>
                        <th>Produsen</th>
                        <th>Jumlah Stok</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="obat" items="${obats}" varStatus="status">
                        <tr class="obat-row" data-id="${obat.idObat}" style="<c:if test='${status.index >= 10}'>display: none;</c:if>">
                            <td>${obat.idObat}</td>
                            <td>${obat.namaObat}</td>
                            <td>${obat.jenisObat}</td>
                            <td>${obat.bentukSediaan}</td>
                            <td>${obat.dosis}</td>
                            <td>${obat.indikasi}</td>
                            <td>${obat.efekSamping}</td>
                            <td>${obat.harga}</td>
                            <td>${obat.produsen}</td>
                            <td>${obat.jumlahStok}</td>
                            <td>
                                <div class="btn-group" role="group">
                                    <a href="ObatServlet?action=edit&idObat=${obat.idObat}&page=${param.page}" class="btn btn-primary btn-sm mr-1">Edit</a>
                                    <a href="javascript:void(0);" onclick="confirmDelete(${obat.idObat})" class="btn btn-danger btn-sm">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Tombol Show More -->
            <c:if test="${not empty obats && obats.size() > 10}">
                <div id="showMoreBtnDiv" class="text-center">
                    <button id="showMoreBtn" class="btn btn-primary">Show More</button>
                </div>
            </c:if>
        </c:if>
    </div>

    <!-- Optional: JavaScript function for confirmation dialog -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Hide the "Show More" button if there are less than 10 items
            var obatRows = document.querySelectorAll('.obat-row');
            if (obatRows.length <= 10) {
                document.getElementById('showMoreBtnDiv').style.display = 'none';
            }

            // Show more functionality
            var showMoreBtn = document.getElementById('showMoreBtn');
            showMoreBtn.addEventListener('click', function() {
                obatRows.forEach(function(row) {
                    row.style.display = '';
                });

                // Hide the button if all rows are shown
                showMoreBtn.style.display = 'none';
            });
        });

        function confirmDelete(idObat) {
            if (confirm('Are you sure you want to delete this obat?')) {
                window.location.href = 'ObatServlet?action=delete&idObat=' + idObat + '&page=${param.page}';
            }
        }
            </script><br>
    <jsp:include page="footer.jsp" />
</body>
</html>
