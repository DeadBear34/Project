package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Database.DbConnection;
import Model.TransaksiBean;

public class TransaksiDAO {
    private Connection connection;

    public TransaksiDAO() throws ClassNotFoundException {
        DbConnection conn = new DbConnection();
        connection = conn.driverConnect();
    }

    // Method to add transaction to database
    public boolean addTransaksi(TransaksiBean transaksi) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into transaksi(user_id, username, alamat, no_telpon, id_kurir, barang, metode_pembayaran, total_biaya, kode_pembayaran, kurir) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, transaksi.getUser_id());
            preparedStatement.setString(2, transaksi.getNama());
            preparedStatement.setString(3, transaksi.getAlamat());
            preparedStatement.setString(4, transaksi.getNo_telpon());
            preparedStatement.setInt(5, transaksi.getId_kurir());
            preparedStatement.setString(6, transaksi.getBarang());
            preparedStatement.setString(7, transaksi.getMetodePembayaran());
            preparedStatement.setDouble(8, transaksi.getTotalBiaya());
            preparedStatement.setString(9, transaksi.getKodePembayaran());
            preparedStatement.setString(10, transaksi.getKurir());

            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
