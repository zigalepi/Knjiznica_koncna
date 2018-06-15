package si.feri.knjiznica.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.knjiznica.Razredi.*;
import si.feri.knjiznica.Razredi.Komentar;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.Date;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

@Controller
public class MainController {

    @Autowired
    private JavaMailSender sender;
    @Value("Moj JSP")
    private String message = "Hello World";
    public List<Knjiga> rezultat = new ArrayList<>();
    public List<Knjiga> izposojaList=new ArrayList<>();
    public List<Knjiga> kosarica=new ArrayList<>();
    public List<Knjiga> zelje=new ArrayList<>();
    public List<Komentar> komentarji=new ArrayList<>();
    public int idKnjiga;
    public String naslov;
    public String avtor;
    public int isbn;
    public String zalozba;
    public int letoIzdaje;
    public String prevod;
    public String ilustracije;
    public String lokacija;
    public String zanr;
    public String publika;
    public Knjiga k;
    public String napakaReg="Uporabniško ime že obstaja";
    public Uporabnik upo;


    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 1);
        return "Index";
    }

    @RequestMapping(value = {"/dodajKnj"}, method = RequestMethod.GET)
    public String index2(Model model) {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 4);
        return "DodajKnj";
    }

    @RequestMapping(value = {"/iskanje"}, method = RequestMethod.GET)
    public String iskanje(Model model) {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 2);
        return "Iskanje";
    }


    @RequestMapping(value = {"/registracija"}, method = RequestMethod.GET)
    public String reg(Model model) {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 3);
        return "Registracija";
    }

    @RequestMapping(value = {"/kosarica"}, method = RequestMethod.GET)
    public String kosarica(Model model) {
        model.addAttribute("message", this.message);

        model.addAttribute("kosarica",kosarica);
        model.addAttribute("izbira", 6);
        return "Kosarica";
    }


    @RequestMapping(value = {"/regBaza"}, method = RequestMethod.POST)
    public String regPb(Model model, @RequestParam(value = "rIme", required = false) String ime, @RequestParam(value = "rPriimek", required = false) String priimek, @RequestParam(value = "rEmail", required = false) String email, @RequestParam(value = "rNaslov", required = false) String naslov, @RequestParam(value = "rKraj", required = false) String kraj, @RequestParam(value = "rPostna", required = false) int postna, @RequestParam(value = "rUporabnisko", required = false) String upoIme, @RequestParam(value = "rGeslo", required = false) String geslo, @RequestParam(value = "rGeslo1", required = false) String geslo1) throws SQLException {
        model.addAttribute("message", this.message);


        boolean pravilnoUp = true;
        Connection conn9 = ConnectionManager.getConnection();

        List<Uporabnik> uporabnikList = new ArrayList<>();

        String sql9 = "SELECT * FROM uporabnik ";

        Statement st9 = conn9.createStatement();


        ResultSet rs9 = st9.executeQuery(sql9);

        // iterate through the java resultset
        while (rs9.next()) {
            uporabnikList.add(new Uporabnik(rs9.getInt("idUporabnik"), rs9.getString("ime"), rs9.getString("priimek"), rs9.getString("upIme"), rs9.getString("geslo"), rs9.getString("email"), rs9.getInt("tk_idNaslov")));
        }
        String nap = "Uporabniško ime že obstaja";
        for (Uporabnik u : uporabnikList) {
            String upo = u.getUpIme();

            if (upo.equals(upoIme)) {
                model.addAttribute("napaka", napakaReg);
                model.addAttribute("napA", "alert alert-warning");
                pravilnoUp = false;
                break;


            } else {

                pravilnoUp = true;

            }


        }


        if (pravilnoUp == true) {


            String naslov1;
            String hisnaSt;
            int stevec = 0;
            for (int i = 0; i < naslov.length(); i++) {

                char x = naslov.charAt(i);

                if (x == '1' || x == '2' || x == '3' || x == '4' || x == '5' || x == '6' || x == '7' || x == '8' || x == '9') {
                    stevec = i;
                    break;
                }
            }

            naslov1 = naslov.substring(0, (stevec - 1));
            System.out.println(naslov1);
            hisnaSt = naslov.substring(stevec);
            System.out.println(hisnaSt);

            Connection conn = ConnectionManager.getConnection();

            List<Kraj> krajList = new ArrayList<>();

            String sql = "SELECT * FROM kraj ";

            Statement st = conn.createStatement();

            // execute the query, and get a java resultset
            ResultSet rs = st.executeQuery(sql);

            // iterate through the java resultset
            while (rs.next()) {
                krajList.add(new Kraj(rs.getInt("idKraj"), rs.getInt("postanSt"), rs.getString("naziv")));
            }
            //st.close();

            int tuji = 0;
            for (Kraj k : krajList) {
                if (k.getPostnaSt() == postna) {
                    tuji = k.getIdKraj();

                }


            }
            if (tuji == 0) {
                kraj(postna, kraj);
                List<Kraj> krajList2 = new ArrayList<>();
                Connection conn5 = ConnectionManager.getConnection();
                String sql5 = "SELECT * FROM kraj ";

                Statement st5 = conn5.createStatement();

                // execute the query, and get a java resultset
                ResultSet rs5 = st5.executeQuery(sql5);

                // iterate through the java resultset
                while (rs5.next()) {
                    krajList2.add(new Kraj(rs5.getInt("idKraj"), rs5.getInt("postanSt"), rs5.getString("naziv")));
                }

                for (Kraj x : krajList2) {
                    int ka = x.getPostnaSt();
                    if (ka == postna) {
                        int z = x.getIdKraj();
                        tuji = z;
                    }
                }
            }


            List<Naslov> naslovList = new ArrayList<>();


            Connection conn6 = ConnectionManager.getConnection();
            String sql6 = "SELECT * FROM naslov ";

            Statement st6 = conn.createStatement();

            // execute the query, and get a java resultset
            ResultSet rs6 = st6.executeQuery(sql6);
            int tuji2 = 0;
            // iterate through the java resultset
            while (rs6.next()) {
                naslovList.add(new Naslov(rs6.getInt("idNaslov"), rs6.getString("ulica"), rs6.getString("hisnaSt"), rs6.getInt("tk_idKraj")));
            }

            for (Naslov n : naslovList) {
                if (n.getUlica().equals(naslov1)) {
                    tuji2 = n.getIdNaslov();
                }
            }
            if (tuji2 == 0) {
                naslov(naslov1, hisnaSt, tuji);  // v PB
                List<Naslov> naslovList2 = new ArrayList<>();
                Connection conn8 = ConnectionManager.getConnection();
                String sql8 = "SELECT * FROM naslov ";

                Statement st8 = conn8.createStatement();

                // execute the query, and get a java resultset
                ResultSet rs8 = st8.executeQuery(sql8);

                // iterate through the java resultset
                while (rs8.next()) {
                    naslovList2.add(new Naslov(rs8.getInt("idNaslov"), rs8.getString("ulica"), rs8.getString("hisnaSt"), rs8.getInt("tk_idKraj")));
                }

                for (Naslov x : naslovList2) {
                    String nas = x.getUlica();
                    if (nas.equals(naslov1)) {
                        int z = x.getIdNaslov();
                        tuji2 = z;
                    }
                }


            }

            conn.close();
            String zadeva="Registracija.";
            String tekst="Spoštovani "+ime+"! \n"+"Uspešno ste se registrirali na spletno stran Moja Knjižnica. Vaše uporabniško ime je: "+upoIme+", vaše geslo pa "+geslo+". Prijetno uporabljenje aplikacije! \n"+"Ekipa Moje Knjižice. ";

            try {

                sendEmail(tekst,email,zadeva);

            }catch(Exception ex) {
                System.out.println("napaka");

            }
            st6.close();


            // naslov(naslov1,hisnaSt,tuji);
            // System.out.println("Za metodo");
            uporabnik(ime,priimek,upoIme,geslo,email,tuji2);
            Uporabnik uporabnik = new Uporabnik();
            uporabnik.setUpIme(upoIme);
            uporabnik.setGeslo(geslo);
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession(true);
            session.setAttribute("currentSessionUser", uporabnik);
            session.setAttribute("currentSessionUserName", uporabnik.getUpIme());
            conn=ConnectionManager.getConnection();
            String searchQuery =
                    "select idUporabnik from uporabnik where upIme='"
                            + upoIme
                            + "' AND geslo='"
                            + geslo
                            + "'";
            Statement statement=conn.createStatement();
            rs = statement.executeQuery(searchQuery);
            rs.next();
            int id= rs.getInt("idUporabnik");
            session.setAttribute("currentSessionId", id);
            conn.close();
            model.addAttribute("izbira", 1);
            return "redirect:/index";


        } else {

            System.out.println("Up ime že obstaja");
            model.addAttribute("izbira", 3);
            return "Registracija";
        }


    }

    public String naslov(String naslov1, String hisnaSt, int id) throws SQLException {


        Connection conn2 =ConnectionManager.getConnection();



        String sql2 = "INSERT INTO naslov (ulica, hisnaSt,tk_idKraj) VALUES (?,?,?)";
        PreparedStatement statement2 = conn2.prepareStatement(sql2);

        statement2.setString(1, naslov1);
        statement2.setString(2, hisnaSt);
        statement2.setInt(3, id);
        int rowsInserted2 = statement2.executeUpdate();
        if (rowsInserted2 > 0) {
            System.out.println("Uspesno naslov!");

        }


        return "Registracija";
    }

    public String uporabnik(String ime, String priimek, String upoIme, String geslo, String email, int id) throws
            SQLException {
        Connection conn3 = ConnectionManager.getConnection();
        System.out.print("dela");

        String sql3 = "INSERT INTO uporabnik ( ime, priimek, upIme, geslo, email,tk_idNaslov ) VALUES (?,?,?,?,?,?)";
        PreparedStatement statement3 = conn3.prepareStatement(sql3);

        statement3.setString(1, ime);
        statement3.setString(2, priimek);
        statement3.setString(3, upoIme);
        statement3.setString(4, geslo);
        statement3.setString(5, email);
        statement3.setInt(6, id);
        int rowsInserted3 = statement3.executeUpdate();
        if (rowsInserted3 > 0) {
            System.out.println("Uspesno uporabnik!");

        }


        return "Registracija";
    }

    public String kraj(int postna, String kraj) throws SQLException {

        int id = 1;
        Connection conn = null;

        conn = ConnectionManager.getConnection();


        String sql1 = "INSERT INTO kraj ( postanSt, naziv) VALUES (?,?)";
        PreparedStatement statement1 = conn.prepareStatement(sql1);

        statement1.setInt(1, postna);
        statement1.setString(2, kraj);
        int rowsInserted1 = statement1.executeUpdate();
        if (rowsInserted1 > 0) {
            System.out.println("Uspesno kraj");

        }
        return "Registracija";


    }


    @RequestMapping(value = {"/iskanjeMetoda"}, method = {RequestMethod.GET, RequestMethod.POST })
    public String iskanjeMetoda(Model model, @RequestParam(value = "izbira1", required = false) String izbira1, @RequestParam(value = "iskanje1", required = false) String iskanje) throws SQLException {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 2);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);

        Connection conn = ConnectionManager.getConnection();
        int c = 0;
        List<Knjiga> knjigaList = new ArrayList<>();
        rezultat=new ArrayList<>();


        String sql = "SELECT * FROM knjiga";

        Statement st = conn.createStatement();

        // execute the query, and get a java resultset
        ResultSet rs = st.executeQuery(sql);

        // iterate through the java resultset
        while (rs.next()) {
            knjigaList.add(new Knjiga(rs.getInt("idKnjiga"), rs.getString("naslov"), rs.getString("avtor"), rs.getInt("isbn"), rs.getString("zalozba"), rs.getInt("letoIzdaje"), rs.getString("prevod"), rs.getString("ilustracije"), rs.getString("lokacija"), rs.getString("zanr"), rs.getString("publika"),rs.getInt("navoljo")));
        }


        for (Knjiga k : knjigaList) {
            String prvo = null;


            switch (izbira1) {
                case "naslov":
                    prvo = k.getNaslov();
                    break;
                case "avtor":
                    prvo = k.getAvtor();
                    break;
                case "isbn":
                    prvo = k.getIsbn() + "";
                    break;
                case "zalozba":
                    prvo = k.getZalozba()+"";
                    break;

                case "leto":
                    prvo = k.getLetoIzdaje() + "";
                    break;

                case "zanr":
                    prvo = k.getZanr()+"";
                    break;

            }

            if (prvo.contains(iskanje)) {
                rezultat.add(k);
            }


        }

        for (Knjiga g : rezultat) {
            System.out.println(g.toString());
        }

        model.addAttribute("nekaj", rezultat);
        return "Iskanje";

    }


    @RequestMapping(value = {"dodajKnj"}, method = RequestMethod.POST)
    public String knj(Model model, @RequestParam(value = "kNaslov", required = false) String naslov, @RequestParam(value = "kAvtorIme", required = false) String avtorIme, @RequestParam(value = "kAvtorPriimek", required = false) String avtorPriimek, @RequestParam(value = "kISBN", required = false) int isbn, @RequestParam(value = "kZalozba", required = false) String zalozba, @RequestParam(value = "kLetoIzdaje", required = false) int letoIzdaje, @RequestParam(value = "kPrevod", required = false) String prevod, @RequestParam(value = "kIlustracije", required = false) String ilustracije, @RequestParam(value = "kZanr", required = false) String zanr, @RequestParam(value = "kCiljnaPublika", required = false) String publika, @RequestParam(value = "kLokacija", required = false) String lokacija) throws SQLException {
        model.addAttribute("message", this.message);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int tk_idUporabnik= (int) session.getAttribute("currentSessionId");
        knjiga(naslov, avtorIme, avtorPriimek, isbn, zalozba, letoIzdaje, prevod, ilustracije, zanr, publika, lokacija, tk_idUporabnik);


        return "DodajKnj";
    }

    public int knjiga(String naslov, String avtorIme, String avtorPriimek, int isbn, String zalozba, int letoIzdaje, String prevod, String ilustracije, String zanr, String publika, String lokacija, int tk_idUporabnik) throws SQLException {
        Connection conn = null;

        conn = ConnectionManager.getConnection();

        String avtor = avtorIme.toLowerCase() + " " + avtorPriimek.toLowerCase();

        String sql1 = "INSERT INTO Knjiga ( naslov,avtor, isbn, zalozba, letoIzdaje,prevod,ilustracije,zanr,publika,lokacija,tk_idUporabnik) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement statement1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
        statement1.setString(1, naslov);
        statement1.setString(2, avtor);
        statement1.setInt(3, isbn);
        statement1.setString(4, zalozba);
        statement1.setInt(5, letoIzdaje);
        statement1.setString(6, prevod);
        statement1.setString(7, ilustracije);
        statement1.setString(8, zanr);
        statement1.setString(9, publika);
        statement1.setString(10, lokacija);
        statement1.setInt(11, tk_idUporabnik);
        int rowsInserted1 = statement1.executeUpdate();
        ResultSet rs = statement1.getGeneratedKeys();
        int risultato = 0;
        if(rs.next()){
            risultato = rs.getInt(1);
        }
        if (rowsInserted1 > 0) {
            System.out.println("Uspesno kraj");

        }
        return risultato;
    }
    @RequestMapping(value = {"seznamZelja"}, method = RequestMethod.GET)
    public String seznamZelja(Model model, @RequestParam(value = "id", required = false) int idK) throws SQLException {
        model.addAttribute("message", this.message);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int idTest= (int)session.getAttribute("currentSessionId");
        System.out.println(idTest);

        Connection conn = null;
        conn = ConnectionManager.getConnection();
        String sql="INSERT INTO Zelje (tk_idUporabnik ) VALUES (?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, idTest);
        int rowsInserted1 = statement.executeUpdate();

        String sql3="SELECT idZelje FROM Zelje WHERE tk_idUporabnik="+"'"+idTest+"'";
        PreparedStatement statement2 = conn.prepareStatement(sql3);

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql3);
        rs.next();
        int tujiId=rs.getInt("idZelje");
        System.out.println(tujiId);


        String sql2="INSERT INTO Zelje_knjige (tk_idZelje,tk_idKnjiga ) VALUES (?,?)";
        PreparedStatement statement3 = conn.prepareStatement(sql2);
        statement3.setInt(1, tujiId);
        statement3.setInt(2, idK);
        int rowsInserted = statement3.executeUpdate();
        return "Iskanje";

    }

    @RequestMapping(value = {"vkosarico"}, method = RequestMethod.GET)
    public String vkosarico(Model model, @RequestParam(value = "id", required = false) int idK) throws SQLException {
        model.addAttribute("message", this.message);
        int a=0;
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int idTest = (int) session.getAttribute("currentSessionId");
        System.out.println(idTest);

        Connection conn = null;
        conn = ConnectionManager.getConnection();

        String sql = "SELECT * FROM Knjiga WHERE idKnjiga="+"'"+idK+"'";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            for(Knjiga knj:kosarica) {
                if (rs.getInt("isbn") == knj.getIsbn()) {
                    a = 1;


                }
            }
            if(a==0) {
                kosarica.add(new Knjiga(rs.getInt("idKnjiga"), rs.getString("naslov"), rs.getString("avtor"), rs.getInt("isbn"), rs.getString("zalozba"), rs.getInt("letoIzdaje"), rs.getString("prevod"), rs.getString("ilustracije"), rs.getString("lokacija"), rs.getString("zanr"), rs.getString("publika"), rs.getInt("navoljo")));
            }

            else
                System.out.println("Že obstaja");


        }

       session.setAttribute("kosarica", kosarica);

        return "Iskanje";
    }

    @RequestMapping(value = {"komentarji"}, method = RequestMethod.GET)
    public String komentarji(Model model, @RequestParam(value = "id", required = false) int idK) throws SQLException {
        model.addAttribute("message", this.message);

        Connection conn = null;
        conn = ConnectionManager.getConnection();

        String sql = "SELECT * FROM Knjiga WHERE idKnjiga="+"'"+idK+"'";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        k=new Knjiga(rs.getInt("idKnjiga"), rs.getString("naslov"), rs.getString("avtor"), rs.getInt("isbn"), rs.getString("zalozba"), rs.getInt("letoIzdaje"), rs.getString("prevod"), rs.getString("ilustracije"), rs.getString("lokacija"), rs.getString("zanr"), rs.getString("publika"),rs.getInt("navoljo"));

        idKnjiga=k.getIdKnjiga();
        model.addAttribute("id",idKnjiga);

        naslov=k.getNaslov();
        model.addAttribute("naslov",naslov);

        avtor=k.getAvtor();
        model.addAttribute("avtor",avtor);

        isbn=k.getIsbn();
        model.addAttribute("isbn",isbn);

        zalozba=k.getZalozba();
        model.addAttribute("zalozba",zalozba);

        letoIzdaje=k.getLetoIzdaje();
        model.addAttribute("letoIzdaje",letoIzdaje);

        prevod=k.getPrevod();
        model.addAttribute("prevod",prevod);

        ilustracije=k.getIlustracije();
        model.addAttribute("ilustracije",ilustracije);

        lokacija=k.getLokacija();
        model.addAttribute("lokacija",lokacija);

        zanr=k.getZanr();
        model.addAttribute("zanr",zanr);

        publika=k.getPublika();
        model.addAttribute("publika",publika);

        komentarji=new ArrayList<>();
        String sql2="SELECT * FROM komentar k,uporabnik u where k.tk_idUporabnik=u.idUporabnik AND tk_idKnjiga="+"'"+idK+"'";

        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(sql2);
        while (rs1.next()) {
            komentarji.add(new Komentar(rs1.getInt("idKomentar"),rs1.getString("vsebina"),rs1.getString("tipKomentarja"),rs1.getInt("tk_idKnjiga"),rs1.getInt("tk_idUporabnik"),rs1.getString("upIme")));
        }
        System.out.println("tvoja mama "+komentarji.toString());

        model.addAttribute("komentarji",komentarji);

        return "knjiga";


    }

    @RequestMapping(value = {"profil"}, method = RequestMethod.GET)
    public String izpisProfil(Model model) throws SQLException {
        model.addAttribute("message", this.message);
        model.addAttribute("izbira", 5);
        upo=new Uporabnik();
        zelje = new ArrayList<>();
        HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int idU=(int)session.getAttribute("currentSessionId");
        ProfilDAO profilDAO = new ProfilDAO();
        model.addAttribute("uporabnik", profilDAO.profilUporabnika(idU));


        Connection conn = null;
        conn = ConnectionManager.getConnection();

        String sql ="select k.*\n" +
                "from zelje z, zelje_knjige zk, knjiga k\n" +
                "where zk.tk_idZelje=z.idZelje AND k.idKnjiga=zk.tk_idKnjiga AND z.tk_idUporabnik="+"'"+idU+"'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            zelje.add(new Knjiga(rs.getInt("idKnjiga"), rs.getString("naslov"), rs.getString("avtor"), rs.getInt("isbn"), rs.getString("zalozba"), rs.getInt("letoIzdaje"), rs.getString("prevod"), rs.getString("ilustracije"), rs.getString("lokacija"), rs.getString("zanr"), rs.getString("publika"),rs.getInt("navoljo")));

        }
        model.addAttribute("nekaj2",zelje);




        return "Profil2";


    }

    @RequestMapping(value={"/izposodi"},method=RequestMethod.GET)
    public String izposodi(Model model)throws SQLException{
        HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int idU=(int)session.getAttribute("currentSessionId");
        int idK=0;
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        long da = (new Date().getTime()) + (14 * 24 * 3600 * 1000) ;
        Date dateV = new Date(da);
        String datum=dateFormat.format(date);
        String datumV=dateFormat.format(dateV);

        Connection conn=ConnectionManager.getConnection();
        String sql;
        PreparedStatement statement;

        System.out.print("kosarica:"+kosarica.size());
        for(int i=0;i<kosarica.size();i++) {
            idK=kosarica.get(i).getIdKnjiga();
            System.out.print("loop:"+i+","+idK);
            sql="INSERT INTO izposoja (datumeIzposoje,datumVrnitve,tk_idUporabnik,tk_idKnjiga ) VALUES ("+"'"+datum+"',"+"'"+datumV +"',"+"'"+idU+"',"+"'"+idK+"')";
            statement = conn.prepareStatement(sql);
            statement.executeUpdate();

        }

        String sql2 ="select naslov\n" +
                "from knjiga \n" +
                "where idknjiga="+"'"+idK+"'";



        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(sql2);
        rs1.next();
        String naslov=rs1.getString("naslov");


        String sql3 ="select datumVrnitve\n" +
                "from izposoja \n" +
                "where tk_idknjiga="+"'"+idK+"'";



        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(sql3);
        rs3.next();
        String dat=rs3.getString("datumVrnitve")+"";


        String sql4 ="select email\n" +
                "from uporabnik \n" +
                "where idUporabnik="+"'"+idU+"'";



        Statement st4 = conn.createStatement();
        ResultSet rs4 = st4.executeQuery(sql4);
        rs4.next();
        String mail =rs4.getString("email");

        for(Knjiga knj:kosarica) {
            String sql5 = "UPDATE knjiga SET navoljo = ? WHERE idKnjiga = ?";
            PreparedStatement statement5 = conn.prepareStatement(sql5);
            statement5.setInt(1, 0);  //o izposojeno
            statement5.setInt(2, knj.getIdKnjiga());
            int rowsUpdated = statement5.executeUpdate();
        }



    String zadeva="Izposoja knjige.";
        String tekst="Spoštovani!\n"+ "Sporocamo vam da ste si izposodili knjigo: "+naslov+ ". Knjigo morate vrniti do: "+dat+"." +"\n Lepo pozdravljeni";

        try {

            sendEmail(tekst,mail,zadeva);

        }catch(Exception ex) {
            System.out.println("napaka");

        }

        kosarica=new ArrayList<>();
       return "Index";
    }

    @RequestMapping(value = {"izpisKom"}, method = RequestMethod.GET)
    public String izpisKom(Model model, @RequestParam(value = "kom", required = false) String vsebina,@RequestParam(value = "check", required = false) String tip) throws SQLException {
        model.addAttribute("message", this.message);
        int idKnjiga=k.getIdKnjiga();

        Connection conn =ConnectionManager.getConnection();
        HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession(false);
        int idU=(int)session.getAttribute("currentSessionId");


        String sql2 = "INSERT INTO komentar ( vsebina, tipKomentarja,tk_idKnjiga,tk_idUporabnik) VALUES (?,?,?,?)";
        PreparedStatement statement2 = conn.prepareStatement(sql2);

        statement2.setString(1, vsebina);
        statement2.setString(2, tip);
        statement2.setInt(3, idKnjiga);
        statement2.setInt(4, idU);
        int rowsInserted2 = statement2.executeUpdate();




        System.out.println(vsebina+" "+tip+" "+idKnjiga+" "+idU);

        return "redirect:/komentarji?id="+idKnjiga;

    }

    private void sendEmail(String tekst, String mail,String zadeva) throws Exception{

        MimeMessage message = sender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setTo(mail);
        helper.setText(tekst);

        helper.setSubject(zadeva);



        sender.send(message);

    }
    @ResponseBody
    @RequestMapping(value = {"izvoziXml"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String iskanje(Model model, @RequestParam(value = "id", required = true) int id, HttpServletResponse response) throws SQLException, JAXBException {

        Knjiga knjiga = new ProfilDAO().knjiga(id);

        response.setContentType("application/xml; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + knjiga.getNaslov() + ".xml\"");

        JAXBContext jaxbContext = JAXBContext.newInstance(Knjiga.class);
        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        StringWriter sw = new StringWriter();
        jaxbMarshaller.marshal(knjiga, sw);
        String xmlString = sw.toString();

        return xmlString;
    }

    @RequestMapping(value = {"/UvoziXml"}, method = RequestMethod.GET)
    public String uvoziXml(Model model) {

        return "UvoziXml";
    }

    @RequestMapping(value = {"/UvoziXmlPost"}, method = RequestMethod.POST)
    public String uvoziXmlPost(Model model, HttpServletRequest request, @RequestParam(value = "xml", required = false) String xml) throws JAXBException, SQLException {
        JAXBContext jaxbContext = JAXBContext.newInstance(Knjiga.class);
        Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();

        StringReader reader = new StringReader(xml);
        Knjiga knjiga = (Knjiga) unmarshaller.unmarshal(reader);


        HttpSession session = request.getSession(true);

        int id = (int) session.getAttribute("currentSessionId");
        int risultato = knjiga(knjiga.getNaslov(), knjiga.getAvtor(), "", knjiga.getIsbn(), knjiga.getZalozba(),knjiga.getLetoIzdaje(), knjiga.getPrevod(), knjiga.getIlustracije(), knjiga.getZanr(), knjiga.getPublika(), knjiga.getLokacija(), id);

        knjiga.setIdKnjiga(risultato);

        return "redirect:/komentarji?id=" + knjiga.getIdKnjiga();
    }

    @RequestMapping(value = {"izbrisiKos"}, method = RequestMethod.GET)
    public String izbrisiKos(Model model, @RequestParam(value = "id", required = false) int idK)  {
        model.addAttribute("message", this.message);
        for (Knjiga knj : kosarica){
            if (idK==knj.getIdKnjiga()){
                kosarica.remove(knj);
                break;
            }
        }



        return "redirect:/kosarica";
    }

    @RequestMapping(value = {"vrni"}, method = RequestMethod.GET)
    public String vrni(Model model, @RequestParam(value = "id", required = false) int idK) throws SQLException {
        model.addAttribute("message", this.message);
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        long da = (new Date().getTime()) + (14 * 24 * 3600 * 1000) ;
        Date dateV = new Date(da);
        String datum=dateFormat.format(date);




        Connection conn = ConnectionManager.getConnection();
        String sql = "UPDATE knjiga SET navoljo = ? WHERE idKnjiga = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, 1);  //o izposojeno
        statement.setInt(2, idK);
        int rowsUpdated = statement.executeUpdate();
        String sq2 = "UPDATE izposoja SET datumVrnitve="+"'"+datum+"'"+ "WHERE tk_idKnjiga =?";

        PreparedStatement statement2 = conn.prepareStatement(sq2);
        statement2.setInt(1, idK);

        int rowsUpdated2 = statement2.executeUpdate();


        return "redirect:/profil";
    }
}


