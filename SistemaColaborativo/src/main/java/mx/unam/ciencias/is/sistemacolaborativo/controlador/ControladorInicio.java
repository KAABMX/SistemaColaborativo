/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * @author hectorsama, luis
 */
@Controller
public class ControladorInicio {

    @Autowired
    UsuarioDAO Usuario_db;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";

    }

    @RequestMapping(value = "/opcion", method = RequestMethod.GET)
    public String opcion() {
        return "opcion";

    }

    @RequestMapping(value = "/loggea", method = RequestMethod.GET)
    public String login() {
        return "login";

    }

    @RequestMapping(value = "/loggear", method = RequestMethod.GET)
    public String loggea(HttpServletRequest request) {
         if (request.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/sesion/inicioU";
        }

        return "indexusuario";
       
    }

    //En caso de que sea unerror
    @RequestMapping(value = "/login_error")
    public ModelAndView fallo(HttpServletRequest request, ModelMap model) {
          if (request.isUserInRole("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/sesion/inicioU");
        }

        return new ModelAndView("index", model);
       
    }

    @RequestMapping(value = "/sesion/inicioU", method = RequestMethod.GET)
    public ModelAndView inicioU(HttpServletRequest request, ModelMap model, Principal principal) {

        String u = principal.getName();
        Usuario usuario = Usuario_db.getUsuario(u);

        return new ModelAndView("index", model);

    }

    @RequestMapping(value = "/registrarAlumno", method = RequestMethod.GET)
    public String alumno() {
        return "registerAlumno";
    }

    @RequestMapping(value = "/registrarProfesor", method = RequestMethod.GET)
    public String profesor() {
        return "registerProfesor";
    }

    @RequestMapping(value = "/actualizarAlumno", method = RequestMethod.GET)
    public String actualizarAlumno() {
        return "actualizarAlumno";
    }
}