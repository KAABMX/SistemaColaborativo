/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author hectorsama
 */
@Controller
public class ControladorInicio {
        @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";

    }
    
    @RequestMapping(value = "/opcion", method = RequestMethod.GET)
    public String opcion() {
        return "opcion";

    }

    @RequestMapping(value = "/registrarAlumno", method = RequestMethod.GET)
    public String alumno() {
        return "registerAlumno";
    }
    
        @RequestMapping(value = "/registrarProfesor", method = RequestMethod.GET)
    public String profesors() {
        return "registerProfesor";
    }
    
}
