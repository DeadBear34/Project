package Model;

public class Obatbean {
    private String idObat;
    private String namaObat;
    private String jenisObat;
    private String bentukSediaan;
    private String dosis;
    private String indikasi;
    private String efekSamping;
    private double harga;
    private String produsen;
    private int jumlahStok;

    public Obatbean(String idObat, String namaObat, String jenisObat, String bentukSediaan, String dosis, String indikasi, String efekSamping, double harga, String produsen, int jumlahStok) {
        this.idObat = idObat;
        this.namaObat = namaObat;
        this.jenisObat = jenisObat;
        this.bentukSediaan = bentukSediaan;
        this.dosis = dosis;
        this.indikasi = indikasi;
        this.efekSamping = efekSamping;
        this.harga = harga;
        this.produsen = produsen;
        this.jumlahStok = jumlahStok;
    }

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

    public String getJenisObat() {
        return jenisObat;
    }

    public void setJenisObat(String jenisObat) {
        this.jenisObat = jenisObat;
    }

    public String getBentukSediaan() {
        return bentukSediaan;
    }

    public void setBentukSediaan(String bentukSediaan) {
        this.bentukSediaan = bentukSediaan;
    }

    public String getDosis() {
        return dosis;
    }

    public void setDosis(String dosis) {
        this.dosis = dosis;
    }

    public String getIndikasi() {
        return indikasi;
    }

    public void setIndikasi(String indikasi) {
        this.indikasi = indikasi;
    }

    public String getEfekSamping() {
        return efekSamping;
    }

    public void setEfekSamping(String efekSamping) {
        this.efekSamping = efekSamping;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public String getProdusen() {
        return produsen;
    }

    public void setProdusen(String produsen) {
        this.produsen = produsen;
    }

    public int getJumlahStok() {
        return jumlahStok;
    }

    public void setJumlahStok(int jumlahStok) {
        this.jumlahStok = jumlahStok;
    }
}
