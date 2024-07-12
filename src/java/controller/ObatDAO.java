package controller;

import Model.Obatbean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ObatDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/apotek";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_OBAT_SQL = "INSERT INTO obat (nama_obat, jenis_obat, bentuk_sediaan, dosis, indikasi, efek_samping, harga, produsen, jumlah_stok) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_OBAT = "SELECT * FROM obat WHERE strok > 0";
    private static final String SELECT_OBAT_BY_ID = "SELECT * FROM obat WHERE id_obat = ?";
    private static final String UPDATE_OBAT_SQL = "UPDATE obat SET nama_obat = ?, jenis_obat = ?, bentuk_sediaan = ?, dosis = ?, indikasi = ?, efek_samping = ?, harga = ?, produsen = ?, jumlah_stok = ? WHERE id_obat = ?";
    private static final String UPDATE_OBAT_SQL_BUY = "UPDATE obat SET jumlah_stok = ? WHERE id_obat = ?";
    private static final String DELETE_OBAT_SQL = "DELETE FROM obat WHERE id_obat = ?";
    private static final String SEARCH_OBAT_SQL = "SELECT * FROM obat WHERE indikasi LIKE ?";
    private static final String FILTER_BY_CATEGORY_SQL = "SELECT * FROM obat WHERE jenis_obat = ?";


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertObat(Obatbean obat) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_OBAT_SQL)) {
            preparedStatement.setString(1, obat.getNamaObat());
            preparedStatement.setString(2, obat.getJenisObat());
            preparedStatement.setString(3, obat.getBentukSediaan());
            preparedStatement.setString(4, obat.getDosis());
            preparedStatement.setString(5, obat.getIndikasi());
            preparedStatement.setString(6, obat.getEfekSamping());
            preparedStatement.setDouble(7, obat.getHarga());
            preparedStatement.setString(8, obat.getProdusen());
            preparedStatement.setInt(9, obat.getJumlahStok());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Obatbean> searchObats(String keyword) {
    List<Obatbean> obats = new ArrayList<>();
    try (Connection connection = getConnection();
         PreparedStatement stmt = connection.prepareStatement(SEARCH_OBAT_SQL)) {
        String likeKeyword = "%" + keyword + "%"; 
        stmt.setString(1, likeKeyword); 
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String idObat = rs.getString("id_obat");
            String namaObat = rs.getString("nama_obat");
            String jenisObat = rs.getString("jenis_obat");
            String bentukSediaan = rs.getString("bentuk_sediaan");
            String dosis = rs.getString("dosis");
            String indikasi = rs.getString("indikasi");
            String efekSamping = rs.getString("efek_samping");
            double harga = rs.getDouble("harga");
            String produsen = rs.getString("produsen");
            int jumlahStok = rs.getInt("jumlah_stok");
            obats.add(new Obatbean(idObat, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return obats;
}



    
    public List<Obatbean> getAllObats() {
    List<Obatbean> obats = new ArrayList<>();
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OBAT)) {
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            String idObat = rs.getString("id_obat");
            String namaObat = rs.getString("nama_obat");
            String jenisObat = rs.getString("jenis_obat");
            String bentukSediaan = rs.getString("bentuk_sediaan");
            String dosis = rs.getString("dosis");
            String indikasi = rs.getString("indikasi");
            String efekSamping = rs.getString("efek_samping");
            double harga = rs.getDouble("harga");
            String produsen = rs.getString("produsen");
            int jumlahStok = rs.getInt("jumlah_stok");
            obats.add(new Obatbean(idObat, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok));
        }

        if (obats.isEmpty()) {
            System.out.println("No medicines found in the database.");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return obats;
}


    public Obatbean getObatById(String idObat) {
        Obatbean obat = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OBAT_BY_ID)) {
            preparedStatement.setString(1, idObat);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String namaObat = rs.getString("nama_obat");
                String jenisObat = rs.getString("jenis_obat");
                String bentukSediaan = rs.getString("bentuk_sediaan");
                String dosis = rs.getString("dosis");
                String indikasi = rs.getString("indikasi");
                String efekSamping = rs.getString("efek_samping");
                double harga = rs.getDouble("harga");
                String produsen = rs.getString("produsen");
                int jumlahStok = rs.getInt("jumlah_stok");
                obat = new Obatbean(idObat, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return obat;
    }

    public void updateObat(Obatbean obat) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_OBAT_SQL)) {
            preparedStatement.setString(1, obat.getNamaObat());
            preparedStatement.setString(2, obat.getIdObat());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateObatBuy(Obatbean obat) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_OBAT_SQL_BUY)) {
            preparedStatement.setString(1, obat.getNamaObat());
            preparedStatement.setString(2, obat.getJenisObat());
            preparedStatement.setString(3, obat.getBentukSediaan());
            preparedStatement.setString(4, obat.getDosis());
            preparedStatement.setString(5, obat.getIndikasi());
            preparedStatement.setString(6, obat.getEfekSamping());
            preparedStatement.setDouble(7, obat.getHarga());
            preparedStatement.setString(8, obat.getProdusen());
            preparedStatement.setInt(9, obat.getJumlahStok());
            preparedStatement.setString(10, obat.getIdObat());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Obatbean> filterObats(String keyword) {
    List<Obatbean> obats = new ArrayList<>();
    try (Connection connection = getConnection();
        PreparedStatement stmt = connection.prepareStatement(FILTER_BY_CATEGORY_SQL)) {
        stmt.setString(1, keyword); // Menggunakan placeholder untuk jenis_obat
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String idObat = rs.getString("id_obat");
            String namaObat = rs.getString("nama_obat");
            String jenisObat = rs.getString("jenis_obat");
            String bentukSediaan = rs.getString("bentuk_sediaan");
            String dosis = rs.getString("dosis");
            String indikasi = rs.getString("indikasi");
            String efekSamping = rs.getString("efek_samping");
            double harga = rs.getDouble("harga");
            String produsen = rs.getString("produsen");
            int jumlahStok = rs.getInt("jumlah_stok");
            obats.add(new Obatbean(idObat, namaObat, jenisObat, bentukSediaan, dosis, indikasi, efekSamping, harga, produsen, jumlahStok));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return obats;
}

    
    public void deleteObat(String idObat) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_OBAT_SQL)) {
            preparedStatement.setString(1, idObat);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
