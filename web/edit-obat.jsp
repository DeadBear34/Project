<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Obat</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-4">
    <h2>Edit Obat</h2>
    <form action="ObatServlet?action=update" method="post">
      <input type="hidden" name="idObat" value="${obat.idObat}">
      <div class="form-group">
        <label for="namaObat">Nama Obat</label>
        <input type="text" class="form-control" id="namaObat" name="namaObat" value="${obat.namaObat}" required>
      </div>
      <div class="form-group">
        <label for="jenisObat">Jenis Obat</label>
        <input type="text" class="form-control" id="jenisObat" name="jenisObat" value="${obat.jenisObat}" required>
      </div>
      <div class="form-group">
        <label for="bentukSediaan">Bentuk Sediaan</label>
        <input type="text" class="form-control" id="bentukSediaan" name="bentukSediaan" value="${obat.bentukSediaan}" required>
      </div>
      <div class="form-group">
        <label for="dosis">Dosis</label>
        <input type="text" class="form-control" id="dosis" name="dosis" value="${obat.dosis}" required>
      </div>
      <div class="form-group">
        <label for="indikasi">Indikasi</label>
        <input type="text" class="form-control" id="indikasi" name="indikasi" value="${obat.indikasi}" required>
      </div>
      <div class="form-group">
        <label for="efekSamping">Efek Samping</label>
        <input type="text" class="form-control" id="efekSamping" name="efekSamping" value="${obat.efekSamping}" required>
      </div>
      <div class="form-group">
        <label for="harga">Harga</label>
        <input type="text" class="form-control" id="harga" name="harga" value="${obat.harga}" required>
      </div>
      <div class="form-group">
        <label for="produsen">Produsen</label>
        <input type="text" class="form-control" id="produsen" name="produsen" value="${obat.produsen}" required>
      </div>
      <div class="form-group">
        <label for="jumlahStok">Jumlah Stok</label>
        <input type="text" class="form-control" id="jumlahStok" name="jumlahStok" value="${obat.jumlahStok}" required>
      </div>
      <button type="submit" class="btn btn-primary">Update Obat</button>
    </form>
  </div>
</body>
</html>
