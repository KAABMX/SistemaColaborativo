package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.Principal;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import static sun.security.krb5.Confounder.bytes;

/**
 *
 * @author hectorsama
 */
@Controller
public class ControladorSesion {

    @Autowired
    UsuarioDAO usuario_db;
    @Autowired
    AlumnoDAO alumno_db;

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
    public ModelAndView inicioU(HttpServletRequest request, ModelMap model, Principal principal) throws IOException {

        String u = principal.getName();
        Usuario usuario = usuario_db.getUsuario(u);
        Alumno alumno=alumno_db.getAlumno(usuario);
        model.addAttribute("nombre", usuario.getNombreC());
        model.addAttribute("correo", usuario.getCorreo());
        model.addAttribute("calificacion", usuario.getCalificacion());
        model.addAttribute("asesorias", alumno.getAsesorar());
        String nombrear=Integer.toString(usuario.getPk_id_usuario())+".jpg";
        model.addAttribute("foto","../imagenes/"+nombrear);
        model.addAttribute("intereses", alumno.getIntereses());
        model.addAttribute("nivel", alumno.getUltimo_nivel_educativo());
        

        
        
        return new ModelAndView("vistaalumno/indexusuario", model);

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
