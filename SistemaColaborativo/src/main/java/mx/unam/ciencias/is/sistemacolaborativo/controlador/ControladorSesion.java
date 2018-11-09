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
    UsuarioDAO usuario_db;

    @RequestMapping(value = "/inicio", method = RequestMethod.GET)
    public String loggea(HttpServletRequest request, Principal principal) {
        // System.out.println(principal.getName()+principal.toString());

        Usuario u = usuario_db.getUsuario(principal.getName());
        //System.out.println(u.getRol()+request.isUserInRole("ROLE_ESTUDIANTE"));
        if (!u.getActivado()) {
            try {
                request.logout();
            } catch (Exception e) {

            }
            return "redirect:/error-activacion";
        }
        if (request.isUserInRole("ROLE_ESTUDIANTE")) {
            return "redirect:/alumno/inicio";
        }
        if (request.isUserInRole("ROLE_PROFESOR")) {
            return "redirect:/profesor/inicio";
        }
        return "index";

    }

    @RequestMapping(value = "/login_error")
    public ModelAndView fallop(HttpServletRequest request, ModelMap model) {
        if (request.isUserInRole("ROLE_ESTUDIANTE")) {
            return new ModelAndView("redirect:/alumno/inicio");
        }
        if (request.isUserInRole("ROLE_PROFESOR")) {
            return new ModelAndView("redirect:/profesor/inicio");
        }

        return new ModelAndView("index", model);
    }

    @RequestMapping(value = "/error-activacion")
    public ModelAndView errorActivacion(HttpServletRequest request, ModelMap model) {
        return new ModelAndView("error-activacion", model);
    }

    @RequestMapping(value = "/alumno/inicio", method = RequestMethod.GET)
    public ModelAndView inicioU(HttpServletRequest request, ModelMap model, Principal principal) {

        String u = principal.getName();
        Usuario usuario = usuario_db.getUsuario(u);
        model.addAttribute("username", u);
        model.addAttribute("nombre", usuario.getNombre());
        return new ModelAndView("vistaalumno/indexusuario", model);

    }

    @RequestMapping(value = "/profesor/inicio", method = RequestMethod.GET)
    public ModelAndView inicioP(HttpServletRequest request, ModelMap model, Principal principal) {
        String u = principal.getName();
        Usuario usuario = usuario_db.getUsuario(u);
        model.addAttribute("username", u);
        model.addAttribute("nombre", usuario.getNombre());
        model.addAttribute("apellidoP", usuario.getApellido_p());
        model.addAttribute("apellidoM", usuario.getApellido_m());
        model.addAttribute("correo", usuario.getCorreo());
        return new ModelAndView("vistaprofesor/inicioProfesor", model);

    }
    @RequestMapping(value = "/pago", method = RequestMethod.GET)
    public ModelAndView pago(HttpServletRequest request, ModelMap model, Principal principal) {
        return new ModelAndView("pago", model);
    }
    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public String error403() {
        return "error403";
    }

}
