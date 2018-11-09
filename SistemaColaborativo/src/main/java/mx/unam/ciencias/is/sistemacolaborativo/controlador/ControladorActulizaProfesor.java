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
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
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
public class ControladorActulizaProfesor {
    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private ProfesorDAO profesor_bd;
    @Autowired
    private CurriculumDAO cv_bd;
    @Autowired
    private EstudiosDAO estudios_bd;
    
    
    @RequestMapping(value = "/profesor/actualizaprofesor")
    public String mostrarActiliza(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());
            System.out.println("hola");
    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    
    model.addAttribute("usuario",usuario);
    model.addAttribute("profesor",profesor);
    model.addAttribute("curriculum",curriculum);
    model.addAttribute("estudios",estudios);
    //model.addAttribute("experiencia",experiencia);
        return  "vistaprofesor/actualizarProfesor";
    }
   
    @RequestMapping(value = "/profesor/realizaactualizaprofesor")
    public String Actilizar(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());

    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    
	String correo = request.getParameter("correo");
	String nombre = request.getParameter("nombre");
	String paterno = request.getParameter("paterno");
	String materno = request.getParameter("materno");
	String telefono = request.getParameter("telefono");
	String sexo = request.getParameter("sexo");
	
	
        usuario.setNombre(nombre);
        usuario.setApellido_p(paterno);
        usuario.setApellido_m(materno);
        usuario.setCorreo(correo);
        
        
        String costo =request.getParameter("costo");
        profesor.setCosto_x_hora(costo);
        
	
        String lugar =request.getParameter("lugar");
        curriculum.setLugar_de_nacimiento(lugar);

	String estudiosg = request.getParameter("estudios");  
	String universidad =request.getParameter("universidad");
        estudios.setUniversidad(universidad);
        
        usuario_bd.actualizar(usuario);
        profesor_bd.actualizar(profesor);
        cv_bd.actualizar(curriculum);
        estudios_bd.actualizar(estudios);
  
        return  "redirect:/profesor/inicio";
    }
}
