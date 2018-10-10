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
 * @author juan
 */
@Controller
public class ControladorPerfilAlumno {
    
     /**
      * Metodo que responde a la peticion PerfilAlumno
      * @return el nombre del jsp de PerfilAlumno
      */
    @RequestMapping(value="/peticion3", method = RequestMethod.GET)
    public String registroGET(){
        return "perfil";
    }
}
