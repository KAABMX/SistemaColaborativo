/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;
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
    @Autowired
    ProfesorDAO profesor_db;
    @Autowired
    UsuarioDAO Usuario_db;
    
    @RequestMapping(value = "/verProfesores", method = RequestMethod.GET)
    public ModelAndView verProfesor(ModelMap model){
        List<Profesor> profesor = profesor_db.getProfesor();
        List<Integer> profesor_lista = new LinkedList();
        for(Profesor p :profesor){
            System.out.println(profesor_lista.add(p.getPk_id_profesor()));
        }
        
        model.addAttribute("profesor_lista",profesor_lista);
        model.addAttribute(profesor);

        return new ModelAndView("verProfesor", model);

    }
    
}
