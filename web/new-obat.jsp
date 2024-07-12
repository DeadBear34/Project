<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Obat</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-4">
    <h2>Add New Obat</h2>
    <form action="ObatServlet?action=insert" method="post">
      <div class="form-group">
        <label for="namaObat">Nama Obat</label>
        <input type="text" class="form-control" id="namaObat" name="namaObat" required>
      </div>
      <div class="form-group">
        <label for="jenisObat">Jenis Obat</label>
        <input type="text" class="form-control" id="jenisObat" name="jenisObat" required>
      </div>
      <div class="form-group">
        <label for="bentukSediaan">Bentuk Sediaan</label>
        <input type="text" class="form-control" id="bentukSediaan" name="bentukSediaan" required>
      </div>
      <div class="form-group">
        <label for="dosis">Dosis</label>
        <input type="text" class="form-control" id="dosis" name="dosis" required>
      </div>
      <div class="form-group">
        <label for="indikasi">Indikasi</label>
        <input type="text" class="form-control" id="indikasi" name="indikasi" required>
      </div>
      <div class="form-group">
        <label for="efekSamping">Efek Samping</label>
        <input type="text" class="form-control" id="efekSamping" name="efekSamping" required>
      </div>
      <div class="form-group">
        <label for="harga">Harga</label>
        <input type="text" class="form-control" id="harga" name="harga" required>
      </div>
      <div class="form-group">
        <label for="produsen">Produsen</label>
        <input type="text" class="form-control" id="produsen" name="produsen" required>
      </div>
      <div class="form-group">
        <label for="jumlahStok">Jumlah Stok</label>
        <input type="text" class="form-control" id="jumlahStok" name="jumlahStok" required>
      </div>
      <button type="submit" class="btn btn-primary">Add Obat</button>
    </form>
  </div>
</body>
</html>
