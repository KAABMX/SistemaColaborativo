/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;


import java.io.InputStream;
import java.security.Principal;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
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
public class ControladorActualizaAlumno {
    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private AlumnoDAO alumno_bd;

    
    
    @RequestMapping(value = "/alumno/actualizaalumno")
    public String mostrarActiliza(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Alumno alumno=alumno_bd.getAlumno(usuario);

    
    model.addAttribute("usuario",usuario);
    model.addAttribute("alumno",alumno);

    //model.addAttribute("experiencia",experiencia);
        return  "vistaalumno/editarperfil";
    }
   
    @RequestMapping(value = "/alumno/realizaactualizaalumno")
    public String Actilizar(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Alumno alumno=alumno_bd.getAlumno(usuario);

    
	String correo = request.getParameter("correo");
        usuario.setCorreo(correo);
	String nombre = request.getParameter("nombre");
        usuario.setNombre(nombre);
	String paterno = request.getParameter("paterno");
        usuario.setApellido_p(paterno);
	String materno = request.getParameter("materno");
        usuario.setApellido_m(materno);
	String interes = request.getParameter("interes");
        alumno.setIntereses(interes);
	String nivel = request.getParameter("nivel");
        alumno.setUltimo_nivel_educativo(nivel);
		
        
        

        
        
        usuario_bd.actualizar(usuario);
        alumno_bd.actualizar(alumno);
 
  
        return  "redirect:/alumno/inicio";
    }
}
