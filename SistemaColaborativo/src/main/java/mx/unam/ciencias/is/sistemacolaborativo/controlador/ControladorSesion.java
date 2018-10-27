package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Experiencia;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ExperienciaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
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
    
    @Autowired
    ProfesorDAO profesor_db;
    
    @Autowired
    CurriculumDAO curriculum_db;
    
    @Autowired
    EstudiosDAO estudios_db;
    
    @Autowired
    ExperienciaDAO experiencia_db;

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
        return new ModelAndView("indexusuario", model);

    }

    @RequestMapping(value = "/profesor/inicio", method = RequestMethod.GET)
    public ModelAndView inicioP(HttpServletRequest request, ModelMap model, Principal principal) {
        String u = principal.getName();
        Usuario usuario = usuario_db.getUsuario(u);
        Profesor profe = profesor_db.getProfesor(usuario);
        int id_profe = profe.getPk_id_profesor();
        Curriculum cu = curriculum_db.getCurriculum(id_profe);
        Estudios es = estudios_db.getEstudios(id_profe);
        Experiencia exp = experiencia_db.getExperiencia(id_profe);
        model.addAttribute("username", u);
        model.addAttribute("nombre", usuario.getNombre());
        model.addAttribute("apellidoP", usuario.getApellido_p());
        model.addAttribute("apellidoM", usuario.getApellido_m());
        model.addAttribute("correo", usuario.getCorreo());
        model.addAttribute("telefono", usuario.getTelefono());
        model.addAttribute("nivel", profe.getNiveles_educativos());
        model.addAttribute("lugar", cu.getLugar_de_nacimiento());
        model.addAttribute("empresa", exp.getEmpresa());
        model.addAttribute("funcion", exp.getFuncion_trabajo());
        model.addAttribute("tarea", exp.getTarea_trabajo());
        return new ModelAndView("inicioProfesor", model);

    }

    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public String error403() {
        return "error403";
    }

}
