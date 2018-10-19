/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
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
public class ControladorVerProfesor {
/*
    @Autowired
    ProfesorDAO profesor_db;
    @Autowired
    UsuarioDAO Usuario_db;

    @RequestMapping(value = "/verProfesores", method = RequestMethod.GET)
    public ModelAndView verProfesor(HttpServletRequest request, ModelMap model) {
        List<Profesor> profe = profesor_db.getProfesor();
        List<String> profeLista = new LinkedList();
        Profesor pro= new Profesor();
         
        for (Profesor p : profe) {
            if (p.getEstaActivo() == true) {
                profeLista.add(p.getUsuario().getNombreC());
            }
        }
        model.addAttribute("profeLista", profeLista);
        return new ModelAndView("verProfesor", model);
    }*/
}
