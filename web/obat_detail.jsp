<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Obat</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-4">
        <h2>Detail Obat</h2>
        <div class="card">
            <img src="images/${obat.idObat}.jpg" class="card-img-top" alt="${obat.namaObat}">
            <div class="card-body">
                <h5 class="card-title">${obat.namaObat}</h5>
                <p class="card-text"><strong>Jenis Obat:</strong> ${obat.jenisObat}</p>
                <p class="card-text"><strong>Bentuk Sediaan:</strong> ${obat.bentukSediaan}</p>
                <p class="card-text"><strong>Dosis:</strong> ${obat.dosis}</p>
                <p class="card-text"><strong>Harga:</strong> ${obat.harga}</p>
                <a href="user_home.jsp" class="btn btn-primary">Kembali ke Daftar Obat</a>
            </div>
        </div>
    </div>
</body>
</html>
