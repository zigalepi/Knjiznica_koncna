package si.feri.knjiznica.Razredi;

public class Naslov {
    private int idNaslov;
    private String ulica;
    private String hisnaSt;
    private int tk_Kraj;
    private Kraj kraj;

    public Naslov(int idNaslov, String ulica, String hisnaSt, int tk_Kraj) {
        this.idNaslov = idNaslov;
        this.ulica = ulica;
        this.hisnaSt = hisnaSt;
        this.tk_Kraj = tk_Kraj;
    }

    public Kraj getKraj() {
        return kraj;
    }

    public void setKraj(Kraj kraj) {
        this.kraj = kraj;
    }

    public int getIdNaslov() {
        return idNaslov;
    }

    public void setIdNaslov(int idNaslov) {
        this.idNaslov = idNaslov;
    }

    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    public String getHisnaSt() {
        return hisnaSt;
    }

    public void setHisnaSt(String hisnaSt) {
        this.hisnaSt = hisnaSt;
    }

    public int getTk_Kraj() {
        return tk_Kraj;
    }

    public void setTk_Kraj(int tk_Kraj) {
        this.tk_Kraj = tk_Kraj;
    }
}
