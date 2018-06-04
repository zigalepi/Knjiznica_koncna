package si.feri.knjiznica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import si.feri.knjiznica.Razredi.ProfilDAO;
import si.feri.knjiznica.Razredi.Uporabnik;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;

@Controller
public class ProfilController {

    @RequestMapping(value = {"/profil" }, method = RequestMethod.GET)
    public String profil(Model model, HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession(true);
        int id = (int) session.getAttribute("currentSessionId");
        ProfilDAO profilDAO = new ProfilDAO();
        model.addAttribute("uporabnik", profilDAO.profilUporabnika(id));
        return "Profil2";
    }

    @RequestMapping(value = {"/UrediProfil" }, method = {RequestMethod.GET, RequestMethod.POST})
    public String urediProfil(Model model, HttpServletRequest request, @RequestParam(value = "rIme", required = false) String ime, @RequestParam(value = "rPriimek", required = false) String priimek, @RequestParam(value = "rEmail", required = false) String email, @RequestParam(value = "rNaslov", required = false) String naslov, @RequestParam(value = "rKraj", required = false) String kraj, @RequestParam(value = "rPostna", required = false) Integer postna, @RequestParam(value = "rUporabnisko", required = false) String upoIme, @RequestParam(value = "rGeslo", required = false) String geslo, @RequestParam(value = "rGeslo1", required = false) String geslo1) throws SQLException {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("currentSessionId") == null) {
            return "redirect:/";
        }
        int id = (int) session.getAttribute("currentSessionId");

        ProfilDAO profilDAO = new ProfilDAO();

        Uporabnik uporabnik;
        if (ime != null) {
            uporabnik = profilDAO.posodobiPodatkeUporabnika(id, ime, priimek, email, naslov, kraj, postna, upoIme, geslo, geslo1);
        } else {
            uporabnik = profilDAO.podatkiUporabnika(id);
        }


        model.addAttribute("uporabnik", uporabnik);


        model.addAttribute("napake", profilDAO.getNapake());
        return "UrediProfil";
    }





}
