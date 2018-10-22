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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Experiencia;
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
    private ExperienciaDAO experiencia_bd;
    @Autowired
    private EstudiosDAO estudios_bd;
    
    
    @RequestMapping(value = "/profesor/actualizaprofesor")
    public String mostrarActiliza(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());
            System.out.println("hola");
  
    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    Experiencia experiencia=experiencia_bd.getExperienciaF(curriculum.getPk_id_cv());
    
    model.addAttribute("usuario",usuario);
    model.addAttribute("profesor",profesor);
    model.addAttribute("curriculum",curriculum);
    model.addAttribute("estudios",estudios);
    model.addAttribute("experiencia",experiencia);
    

        
        return  "vistaprofesor/actualizarProfesor";
    }
   
    @RequestMapping(value = "/profesor/realizaactualizaprofesor")
    public String Actilizar(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor profesor=profesor_bd.getProfesor(usuario);
    Curriculum curriculum =cv_bd.getCurriculumF(profesor.getPk_id_profesor());


    Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
    Experiencia experiencia=experiencia_bd.getExperienciaF(curriculum.getPk_id_cv());
    
	String correo = request.getParameter("correo");
	String nombre = request.getParameter("nombre");
	String paterno = request.getParameter("paterno");
	String materno = request.getParameter("materno");
	String telefono = request.getParameter("telefono");
	String sexo = request.getParameter("sexo");
	
	
        usuario.setNombre(nombre);
        usuario.setApellido_p(paterno);
        usuario.setApellido_m(materno);
        usuario.setTelefono(telefono);
        usuario.setSexo(sexo);
        usuario.setCorreo(correo);
        
        
        String costo =request.getParameter("costo");
        profesor.setCosto_x_hora(costo);
        
	
        String lugar =request.getParameter("lugar");
        curriculum.setLugar_de_nacimiento(lugar);
        
        
	String fecha_inicio =request.getParameter("fecha_inicio");
	String fecha_fin = request.getParameter("fecha_fin");

        try {
        Date estudiosi = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio);
        Date estudiosf = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin);
        estudios.setFecha_inicio(estudiosi);
        estudios.setFecha_fin(estudiosf);        
        } catch (Exception e) {

        }
        
        
        

        
	String universidad =request.getParameter("universidad");
        estudios.setUniversidad(universidad);
        
	String empresa =request.getParameter("empresa");
	String fecha_inicio_trabajo =request.getParameter("fecha_inicio_trabajo");
	String fecha_fin_trabajo =request.getParameter("fecha_fin_trabajo");
	String funcion_trabajo =request.getParameter("funcion_trabajo");
	String tarea_trabajo =request.getParameter("tarea_trabajo");
        experiencia.setEmpresa(empresa);
        
        experiencia.setFuncion_trabajo(funcion_trabajo);
        experiencia.setTarea_trabajo(tarea_trabajo);
        
        try {
        Date trabajoi = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio);
        Date trabajof = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin);
        experiencia.setFecha_inicio(trabajoi);
        experiencia.setFecha_fin(trabajof);
        } catch (Exception e) {

        }
        
        usuario_bd.actualizar(usuario);
        profesor_bd.actualizar(profesor);
        cv_bd.actualizar(curriculum);
        experiencia_bd.actualizar(experiencia);
        estudios_bd.actualizar(estudios);

    

        
        return  "/profesor/actualizaprofesor";
    }
}
