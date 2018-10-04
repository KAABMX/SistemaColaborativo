package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hectorsama
 */
@Controller
public class ControladorSesion {

    @Autowired
    UsuarioDAO Usuario_db;

    @RequestMapping(value = "/loggear", method = RequestMethod.GET)
    public String loggea(HttpServletRequest request) {
        if (request.isUserInRole("ROL_ESTUDIANTE")) {
            return "redirect:/sesion/inicioU";
        }
        if (request.isUserInRole("ROL_PROFESOR")) {
            return "redirect:/sesion/inicioP";
        }

        return "index";

    }

    @RequestMapping(value = "/login_error")
    public ModelAndView fallo(HttpServletRequest request, ModelMap model) {
        if (request.isUserInRole("ROLE_ESTUDIANTE")) {
            return new ModelAndView("redirect:/sesion/inicioU");
        }
        if (request.isUserInRole("ROLE_PROFESOR")) {
            return new ModelAndView("redirect:/sesion/inicioU");
        }

        return new ModelAndView("inicio", model);
    }

    @RequestMapping(value = "/sesion/inicioU", method = RequestMethod.GET)
    public ModelAndView inicioU(HttpServletRequest request, ModelMap model, Principal principal) {

        String u = principal.getName();
        Usuario usuario = Usuario_db.getUsuario(u);
        model.addAttribute("username", u);
        return new ModelAndView("indexusuario", model);

    }

    @RequestMapping(value = "/sesion/inicioP", method = RequestMethod.GET)
    public ModelAndView inicioP(HttpServletRequest request, ModelMap model, Principal principal) {

        String u = principal.getName();
        Usuario usuario = Usuario_db.getUsuario(u);
        model.addAttribute("username", u);
        return new ModelAndView("indexusuario", model);

    }

}
