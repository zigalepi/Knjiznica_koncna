package si.feri.knjiznica.Razredi;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfilDAO {

    Connection currentCon = null;
    ResultSet rs = null;

    List<String> napake = new ArrayList<>();

    public List<String> getNapake() {
        return napake;
    }

    public Uporabnik profilUporabnika(int id) throws SQLException {


        Connection connection = ConnectionManager.getConnection();

        String sql = "SELECT * FROM knjiga k, izposoja i, uporabnik u WHERE k.idKnjiga = i.tk_idKnjiga and i.tk_idUporabnik = u.idUporabnik AND u.idUporabnik = " + id;

        Statement statement = connection.createStatement();

        ResultSet resultSet = statement.executeQuery(sql);

        Uporabnik uporabnik = new Uporabnik();

        while (resultSet.next()) {

            uporabnik.dodajIzposojenoKnjigo(knjigar(resultSet));

        }

        uporabnik.setMojeKnjige(mojeKnjige(id));


        //profilUporabnika.setIzposojeneKnjige(knjige);

        return uporabnik;
    }


    public Uporabnik podatkiUporabnika(int id) throws SQLException {

        Connection connection = ConnectionManager.getConnection();

        List<Knjiga> knjige = new ArrayList<>();

        String sql = "SELECT * FROM Uporabnik u, Kraj k, Naslov n where idNaslov = tk_idNaslov and tk_idKraj = idKraj and idUporabnik =" + id;

        Statement statement = connection.createStatement();

        ResultSet resultSet = statement.executeQuery(sql);

        Uporabnik uporabnik = new Uporabnik();

        if (resultSet.next()) {
            uporabnik = new Uporabnik(resultSet.getInt("idUporabnik"), resultSet.getString("ime"), resultSet.getString("priimek"), resultSet.getString("upIme"), resultSet.getString("geslo"), resultSet.getString("email"), resultSet.getInt("tk_idNaslov"));
            Naslov naslov = new Naslov(resultSet.getInt("idNaslov"), resultSet.getString("ulica"), resultSet.getString("hisnaSt"), resultSet.getInt("tk_idKraj"));
            Kraj kraj = new Kraj(resultSet.getInt("idKraj"), resultSet.getInt("postanSt"), resultSet.getString("naziv"));

            uporabnik.setNaslov(naslov);
            naslov.setKraj(kraj);
        }
        return uporabnik;
    }





    public Uporabnik posodobiPodatkeUporabnika(int id, String ime, String priimek, String email, String naslov, String kraj, Integer postna, String upoIme, String geslo, String geslo1) throws SQLException {
        String[] imena = { "ime", "priimek", "email", "naslov", "kraj", "postna", "upoIme"};
        String[] vse = { ime, priimek, email, naslov, kraj, postna.toString(), upoIme };

        //for (String podatek : vse) {
        for (int i = 0; i < vse.length; i++) {
            String ime2 = imena[i];
            String podatek = vse[i];

            if (podatek.isEmpty()) {
                napake.add("Podatek " + ime2 + "manjka.");
            }
        }


        Uporabnik uporabnik = podatkiUporabnika(id);

        int position = naslov.trim().lastIndexOf(' ');
        if (position == -1) {
            napake.add("Nimaš presledka v naslovu.");
        } else {
            String ulica = naslov.substring(0, position).trim();
            String hisnaStevilka = naslov.substring(position).trim();

            String stevilka = hisnaStevilka.replaceAll("[^0-9]+", "");
            if (stevilka.isEmpty()) {
                napake.add("Nimaš številk v naslovu.");
            }

            uporabnik.getNaslov().setUlica(ulica);
            uporabnik.getNaslov().setHisnaSt(hisnaStevilka);
        }



        uporabnik.setIme(ime);
        uporabnik.setPriimek(priimek);
        uporabnik.setEmail(email);

        uporabnik.getNaslov().getKraj().setNaziv(kraj);
        uporabnik.getNaslov().getKraj().setPostnaSt(postna);
        uporabnik.setUpIme(upoIme);
        if (!geslo.isEmpty()){
            if (geslo.equals(geslo1)) {
                uporabnik.setGeslo(geslo);
            } else {
                napake.add("Vpisani gesli se ne ujemata!");
            }
        }

        if (napake.isEmpty()) {
            naslov(uporabnik.getNaslov());
            kraj(uporabnik.getNaslov().getKraj());
            uporabnik(uporabnik);
        }

        return uporabnik;
    }

    public void naslov(Naslov naslov) throws SQLException {
        Connection conn2 = ConnectionManager.getConnection();

        String sql2 = "UPDATE naslov SET ulica = ?, hisnaSt = ?,tk_idKraj = ? WHERE idNaslov = ?";
        PreparedStatement statement2 = conn2.prepareStatement(sql2);

        statement2.setString(1, naslov.getUlica());
        statement2.setString(2, naslov.getHisnaSt());
        statement2.setInt(3, naslov.getTk_Kraj());
        statement2.setInt(4, naslov.getIdNaslov());
        statement2.executeUpdate();
    }

    public void uporabnik(Uporabnik uporabnik) throws SQLException {
        Connection conn3 = ConnectionManager.getConnection();

        String sql3 = "UPDATE uporabnik SET ime = ?, priimek = ?, upIme = ?, geslo = ?, email = ?,tk_idNaslov = ? WHERE idUporabnik = ?";
        PreparedStatement statement3 = conn3.prepareStatement(sql3);

        statement3.setString(1, uporabnik.getIme());
        statement3.setString(2, uporabnik.getPriimek());
        statement3.setString(3, uporabnik.getUpIme());
        statement3.setString(4, uporabnik.getGeslo());
        statement3.setString(5, uporabnik.getEmail());
        statement3.setInt(6, uporabnik.getTk_idNaslov());
        statement3.setInt(7, uporabnik.getIdUporabnik());
        statement3.executeUpdate();
    }

    public void kraj(Kraj kraj) throws SQLException {
        Connection conn = ConnectionManager.getConnection();

        String sql1 = "UPDATE kraj SET postanSt = ?, naziv = ? WHERE idKraj = ?";
        PreparedStatement statement1 = conn.prepareStatement(sql1);

        statement1.setInt(1, kraj.getPostnaSt());
        statement1.setString(2, kraj.getNaziv());
        statement1.setInt(3, kraj.getIdKraj());
        statement1.executeUpdate();
    }
    public List<Knjiga> mojeKnjige(int id) throws SQLException {

        List<Knjiga> mojeKnjige = new ArrayList<>();


        Connection connection = ConnectionManager.getConnection();


        String sql = "SELECT * FROM knjiga k WHERE k.tk_idUporabnik = " + id;


        Statement statement = connection.createStatement();

        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {

            mojeKnjige.add(knjigar(resultSet));

        }



        return mojeKnjige;
    }
    public Knjiga knjigar(ResultSet resultSet) throws SQLException {
        Knjiga knjiga = new Knjiga(resultSet.getInt("idKnjiga"), resultSet.getString("naslov"), resultSet.getString("avtor"),
                resultSet.getInt("isbn"), resultSet.getString("zalozba"),
                resultSet.getInt("letoIzdaje"), resultSet.getString("prevod"),
                resultSet.getString("ilustracije"), resultSet.getString("zanr"),
                resultSet.getString("publika"), resultSet.getString("lokacija"));

        return knjiga;
    }
}
