/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;


import java.io.InputStream;
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
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Complementarios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Experiencia;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ComplementariosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ExperienciaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
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
public class ControladorActulizaProfesor {
    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private ProfesorDAO profesor_bd;
    @Autowired
    private CurriculumDAO cv_bd;
    @Autowired
    private ComplementariosDAO complementarios_bd;
    @Autowired
    private ExperienciaDAO experiencia_bd;
    @Autowired
    private EstudiosDAO estudios_bd;
    
    
    @RequestMapping(value = "/profesor/actualizaprofesor")
    public String mostrarActiliza(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());
            System.out.println("hola");
    Complementarios complementarios=complementarios_bd.getComplementariosF(curriculum.getPk_id_cv());
    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    Experiencia experiencia=experiencia_bd.getExperienciaF(curriculum.getPk_id_cv());
    
    model.addAttribute("usuario",usuario);
    model.addAttribute("profesor",profesor);
    model.addAttribute("curriculum",curriculum);
    model.addAttribute("estudios",estudios);
    model.addAttribute("experiencia",experiencia);
    model.addAttribute("complementarios",complementarios);
    

        
        return  "vistaprofesor/actualizarProfesor";
    }
   
    @RequestMapping(value = "/profesor/realizaactualizaprofesor")
    public String Actilizar(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());

    Complementarios complementarios=complementarios_bd.getComplementariosF(curriculum.getPk_id_cv());
    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    Experiencia experiencia=experiencia_bd.getExperienciaF(curriculum.getPk_id_cv());
    
	String correo = request.getParameter("correo");
	String nombre = request.getParameter("nombre");
	String paterno = request.getParameter("paterno");
	String materno = request.getParameter("materno");
	String telefono = request.getParameter("telefono");
	String sexo = request.getParameter("sexo");
	String costo =request.getParameter("costo");
	
        try {
            Part file = request.getPart("file");
            InputStream is = file.getInputStream();
            byte[] ident = new byte[is.available()];
            is.read(ident);
            profesor.setIdentificacion(ident);
        } catch (Exception e) {

        }
	
        String lugar =request.getParameter("lugar");
	String fecha_inicio =request.getParameter("fecha_inicio");
	String fecha_fin = request.getParameter("fecha_fin");
	String estudiosg = request.getParameter("estudios");
	String universidad =request.getParameter("universidad");
	String empresa =request.getParameter("empresa");
	String fecha_inicio_trabajo =request.getParameter("fecha_inicio_trabajo");
	String fecha_fin_trabajo =request.getParameter("fecha_fin_trabajo");
	String funcion_trabajo =request.getParameter("funcion_trabajo");
	String tarea_trabajo =request.getParameter("tarea_trabajo");
    

        
        return  "vistaprofesor/actualizarProfesor";
    }
}
