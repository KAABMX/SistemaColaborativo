/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
//import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Complementarios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Horario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivel;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivelprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Tema;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Temaprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.HorarioDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.NivelDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.TemaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.TemaprofesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author dani3
 */
@Controller
@MultipartConfig
public class ControladorVerAsesorias {
    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private ProfesorDAO profesor_bd;
    @Autowired
    private HorarioDAO horario_bd;
    @Autowired
    private TemaprofesorDAO temaprofesor_bd;
    @Autowired
    private TemaDAO tema_bd;
    @Autowired
    private NivelDAO nivel_bd;
    
    
    @RequestMapping(value = "/alumno/verasesorias")
    public String mostrarListaAsesorias(HttpServletRequest request, ModelMap model, Principal principal){
        List<Nivel> niveles=nivel_bd.getNivels();
        model.addAttribute("niveles", niveles);
        return  "vistaalumno/niveles";
    }
    
    @RequestMapping(value = "/alumno/vermaterias")
    public String mostrarListaMaterias(HttpServletRequest request, ModelMap model, Principal principal){
        int idNivel=Integer.parseInt(request.getParameter("idnivel"));
        Nivel nivel=nivel_bd.getNivel(idNivel);
        List<Tema> temas=nivel.getTemas();
        model.addAttribute("temas",temas);
        return  "vistaalumno/temas";
    }

    @RequestMapping(value = "/alumno/verprofesor")
    public String mostrarListaProfesores(HttpServletRequest request, ModelMap model, Principal principal){
        int idTema=Integer.parseInt(request.getParameter("idtema"));
        Tema tema=tema_bd.getTema(idTema);
        System.out.println(tema);
        List<Temaprofesor> temaprofesor=tema.getTemaprofesors();
        List<Profesor> profesores= new ArrayList<>();
        for (Temaprofesor temaprofesor1 : temaprofesor) {
            profesores.add(temaprofesor1.getProfesor());
        }
        model.addAttribute("profesores", profesores);
        return  "vistaalumno/profesores";
    }    
    
    @RequestMapping(value = "/alumno/verperfirprofesor")
    public String mostrarPerfilProfesor(HttpServletRequest request, ModelMap model, Principal principal){
        int idProfeor=Integer.parseInt(request.getParameter("idprofesor"));
        Profesor profesor=profesor_bd.getProfesor(idProfeor);
        model.addAttribute("profesor", profesor);
        return  "vistaalumno/perfilprofesor";
    }      
}
