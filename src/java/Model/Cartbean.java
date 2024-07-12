package Model;

import java.io.Serializable;

public class Cartbean implements Serializable {
    private String idObat;
    private String namaObat;
    private double harga;
    private int quantity;

    public Cartbean(String idObat, String namaObat, double harga, int quantity) {
        this.idObat = idObat;
        this.namaObat = namaObat;
        this.harga = harga;
        this.quantity = quantity;
    }

    // Getters and Setters
    public String getIdObat() {
        return idObat;
    }

    public void setIdObat(String idObat) {
        this.idObat = idObat;
    }

    public String getNamaObat() {
        return namaObat;
    }

    public void setNamaObat(String namaObat) {
        this.namaObat = namaObat;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
