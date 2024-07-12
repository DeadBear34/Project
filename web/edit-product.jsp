<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Product</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-4">
    <h2>Edit Product</h2>
    <form action="ProductServlet?action=update" method="post">
      <input type="hidden" name="id" value="${product.id}">
      <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
      </div>
      <div class="form-group">
        <label for="price">Price</label>
        <input type="text" class="form-control" id="price" name="price" value="${product.price}" required>
      </div>
      <div class="form-group">
        <label for="image">Image URL</label>
        <input type="text" class="form-control" id="image" name="image" value="${product.imageUrl}">
      </div>
      <div class="form-group">
        <label for="category">Category</label>
        <input type="text" class="form-control" id="category" name="category" value="${product.category}" required>
      </div>
      <button type="submit" class="btn btn-primary">Update Product</button>
    </form>
  </div>
</body>
</html>
