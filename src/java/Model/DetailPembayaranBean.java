package Model;

import java.util.List;

public class DetailPembayaranBean {
    private int user_id;
    private String nama;
    private String alamat;
    private String no_telpon;
    private int id_kurir;
    private List<String> barang;
    private String metodePembayaran;
    private double totalBiaya;
    private String kodePembayaran;
    private String kurir;

    // Getters and setters
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getNo_telpon() {
        return no_telpon;
    }

    public void setNo_telpon(String no_telpon) {
        this.no_telpon = no_telpon;
    }

    public int getId_kurir() {
        return id_kurir;
    }

    public void setId_kurir(int id_kurir) {
        this.id_kurir = id_kurir;
    }

    public List<String> getBarang() {
        return barang;
    }

    public void setBarang(List<String> barang) {
        this.barang = barang;
    }

    public String getMetodePembayaran() {
        return metodePembayaran;
    }

    public void setMetodePembayaran(String metodePembayaran) {
        this.metodePembayaran = metodePembayaran;
    }

    public double getTotalBiaya() {
        return totalBiaya;
    }

    public void setTotalBiaya(double totalBiaya) {
        this.totalBiaya = totalBiaya;
    }

    public String getKodePembayaran() {
        return kodePembayaran;
    }

    public void setKodePembayaran(String kodePembayaran) {
        this.kodePembayaran = kodePembayaran;
    }

    public String getKurir() {
        return kurir;
    }

    public void setKurir(String kurir) {
        this.kurir = kurir;
    }

    public String getBarangAsString() {
        if (barang == null || barang.isEmpty()) {
            return "";
        }
        StringBuilder barangBuilder = new StringBuilder();
        for (String item : barang) {
            barangBuilder.append(item).append(", ");
        }
        return barangBuilder.substring(0, barangBuilder.length() - 2);
    }
}
