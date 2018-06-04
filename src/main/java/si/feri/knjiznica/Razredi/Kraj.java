package si.feri.knjiznica.Razredi;

public class Kraj {
    private int idKraj;
    private int postnaSt;
    private String naziv;


    public Kraj(int idKraj, int postnaSt, String naziv) {
        this.idKraj = idKraj;
        this.postnaSt = postnaSt;
        this.naziv = naziv;
    }

    public int getIdKraj() {
        return idKraj;
    }

    public void setIdKraj(int idKraj) {
        this.idKraj = idKraj;
    }

    public int getPostnaSt() {
        return postnaSt;
    }

    public void setPostnaSt(int postnaSt) {
        this.postnaSt = postnaSt;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }
}
