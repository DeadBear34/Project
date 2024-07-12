<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-4">
    <h2>Product List</h2>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Price</th>
          <th>Category</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="product" items="${products}">
          <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.category}</td>
            <td>
              <a href="ProductServlet?action=edit&id=${product.id}" class="btn btn-primary btn-sm">Edit</a>
              <a href="javascript:void(0);" onclick="confirmDelete(${product.id})" class="btn btn-danger btn-sm">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <a href="ProductServlet?action=new" class="btn btn-success">Add New Product</a>
  </div>

  <!-- Optional: JavaScript function for confirmation dialog -->
  <script>
    function confirmDelete(productId) {
      if (confirm('Are you sure you want to delete this product?')) {
        window.location.href = 'ProductServlet?action=delete&id=' + productId;
      }
    }
  </script>
</body>
</html>
