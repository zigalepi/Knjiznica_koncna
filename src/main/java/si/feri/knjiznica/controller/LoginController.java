package si.feri.knjiznica.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import si.feri.knjiznica.Razredi.ConnectionManager;
import si.feri.knjiznica.Razredi.UporabnikDAO;
import si.feri.knjiznica.Razredi.Uporabnik;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@Controller
public class LoginController {

    @Value("Moj JSP")
    private String message = "Hello World";

    @RequestMapping(value = {"/login"},method = RequestMethod.POST)
    public String login(Model model, @RequestParam(value="pGeslo")String geslo, @RequestParam(value="pUporabnisko")String uporabnisko) {
        model.addAttribute("message", this.message);

        try {

            Uporabnik user = new Uporabnik();
            user.setUpIme(uporabnisko);
            user.setGeslo(geslo);

            user = UporabnikDAO.login(user);

            if (user.getPravilno()) {

                HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                session.setAttribute("currentSessionUserName", user.getUpIme());
                Connection conn;
                conn=ConnectionManager.getConnection();
                String searchQuery =
                        "select idUporabnik from uporabnik where upIme='"
                                + uporabnisko
                                + "' AND geslo='"
                                + geslo
                                + "'";
                Statement statement=conn.createStatement();
                ResultSet rs;
                rs = statement.executeQuery(searchQuery);
                rs.next();
                int id= rs.getInt("idUporabnik");
                session.setAttribute("currentSessionId", id);
                conn.close();
                System.out.print("Uporabnik: "+user+" "+id);

                return "redirect:/index";
            } else
                return "redirect:/dodajKnj";
        } catch (Throwable theException) {
            System.out.println(theException);
        }
        return "redirect:/registracija";
    }

    @RequestMapping(value={"/logout"},method=RequestMethod.GET)
    public String logout(Model model){
        model.addAttribute("message",this.message);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession(false);
        session.invalidate();
        return "redirect:/index";
    }



}
