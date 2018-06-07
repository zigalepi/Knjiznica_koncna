package si.feri.knjiznica.Razredi;

public class Komentar {
    private int idKomentar;
    private String vsebina;
    private String tipKomentarja;
    private int tk_idKnjiga;
    private int tk_idUporabnik;
    public String upIme;



    public Komentar(int idKomentar, String vsebina, String tipKomentarja, int tk_idKnjiga, int tk_idUporabnik, String upIme) {
        this.idKomentar = idKomentar;
        this.vsebina = vsebina;
        this.tipKomentarja = tipKomentarja;
        this.tk_idKnjiga = tk_idKnjiga;
        this.tk_idUporabnik=tk_idUporabnik;
        this.upIme=upIme;
    }

    public int getIdKomentar() {
        return idKomentar;
    }

    public void setIdKomentar(int idKomentar) {
        this.idKomentar = idKomentar;
    }

    public String getVsebina() {
        return vsebina;
    }

    public void setVsebina(String vsebina) {
        this.vsebina = vsebina;
    }

    public String getTipKomentarja() {
        return tipKomentarja;
    }

    public void setTipKomentarja(String tipKomentarja) {
        this.tipKomentarja = tipKomentarja;
    }

    public int getTk_idKnjiga() {
        return tk_idKnjiga;
    }

    public void setTk_idKnjiga(int tk_idKnjiga) {
        this.tk_idKnjiga = tk_idKnjiga;
    }

    @Override
    public String toString() {
        return "Komentar{" +
                "idKomentar=" + idKomentar +
                ", vsebina='" + vsebina + '\'' +
                ", tipKomentarja='" + tipKomentarja + '\'' +
                ", tk_idKnjiga=" + tk_idKnjiga +
                ", tk_idUporabnik=" + tk_idUporabnik +
                ", upIme=" + upIme +
                '}';
    }
}
