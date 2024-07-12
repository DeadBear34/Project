/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class KurirBean {
    private int idKurir;
    private String namaKurir;
    private double harga;

    // Constructor, getters, and setters
    // Constructor, getters, and setters
    public KurirBean(int idKurir, String namaKurir, double harga) {
        this.idKurir = idKurir;
        this.namaKurir = namaKurir;
        this.harga = harga;
    }

    public int getIdKurir() {
        return idKurir;
    }

    public void setIdKurir(int idKurir) {
        this.idKurir = idKurir;
    }

    public String getNamaKurir() {
        return namaKurir;
    }

    public void setNamaKurir(String namaKurir) {
        this.namaKurir = namaKurir;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }
}
