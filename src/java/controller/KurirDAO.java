package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.KurirBean;
import Database.DbConnection;

public class KurirDAO {

    private static Connection connection;

    static {
        try {
            DbConnection conn = new DbConnection();
            connection = conn.driverConnect();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<KurirBean> getAllKurir() {
        List<KurirBean> kurirList = new ArrayList<>();
        try {
            String query = "SELECT * FROM kurir";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idKurir = rs.getInt("id_kurir");
                String namaKurir = rs.getString("nama_kurir");
                double harga = rs.getDouble("harga");
                KurirBean kurir = new KurirBean(idKurir, namaKurir, harga);
                kurirList.add(kurir);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kurirList;
    }
    
    public static KurirBean getKurirById(int kurirId) {
        KurirBean kurir = null;
        try {
            String query = "SELECT * FROM kurir WHERE id_kurir = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, kurirId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idKurir = rs.getInt("id_kurir");
                String namaKurir = rs.getString("nama_kurir");
                double harga = rs.getDouble("harga");
                kurir = new KurirBean(idKurir, namaKurir, harga);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kurir;
    }
}
