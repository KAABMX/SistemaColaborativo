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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
//import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Complementarios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivel;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivelprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Tema;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Temaprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
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
    private TemaprofesorDAO temaprofesor_bd;
    @Autowired
    private TemaDAO tema_bd;
    @Autowired
    private NivelDAO nivel_bd;    
    @Autowired
    private CurriculumDAO curriculum_bd;
    @Autowired
    private EstudiosDAO estudios_bd;
    
    
    @RequestMapping(value = "/verasesorias")
    public String mostrarListaAsesorias(HttpServletRequest request, ModelMap model, Principal principal){
        List<Nivel> niveles=nivel_bd.getNivels();
        model.addAttribute("niveles", niveles);
        boolean log =true;
        if (principal==null) {
            log=true;
            
        }else{
            log=false;
        }
        model.addAttribute("log", log);
        
        return  "vistaalumno/niveles";
        
    }
    
    @RequestMapping(value = "/vermaterias")
    public String mostrarListaMaterias(HttpServletRequest request, ModelMap model, Principal principal){
        int idNivel=Integer.parseInt(request.getParameter("idnivel"));
        Nivel nivel=nivel_bd.getNivel(idNivel);
        List<Tema> temas=nivel.getTemas();
        model.addAttribute("temas",temas);
        boolean log =true;
        if (principal==null) {
            log=true;
            
        }else{
            log=false;
        }
        model.addAttribute("log", log);
        
        
        return  "vistaalumno/temas";
    }

    @RequestMapping(value = "/verprofesor")
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
        
                boolean log =true;
        if (principal==null) {
            log=true;
            
        }else{
            log=false;
        }
        model.addAttribute("log", log);
        
        return  "vistaalumno/profesores";
    }    
    

    
    
    
    @RequestMapping(value = "/verperfirprofesor")
    public String mostrarHorario(HttpServletRequest request, ModelMap model, Principal principal){
        int idProfeor=Integer.parseInt(request.getParameter("idprofesor"));
        //profesor
        Profesor p=profesor_bd.getProfesor(idProfeor);
        model.addAttribute("precio", p.getCosto_x_hora());
        model.addAttribute("idp", p.getPk_id_profesor());
        
        
        //estudios
        Curriculum curriculum=curriculum_bd.getCurriculumF(idProfeor);
        Estudios estudios=estudios_bd.getEstudios(curriculum.getPk_id_cv());
        model.addAttribute("universidad", estudios.getUniversidad());
        model.addAttribute("estudios", estudios.getEstudio());
        
        
        //usuario
        Usuario usuario=p.getUsuario();
        model.addAttribute("nombre", usuario.getNombre());
        model.addAttribute("apellido", usuario.getApellido_p());
        model.addAttribute("apellidoM", usuario.getApellido_m());
        model.addAttribute("correo", usuario.getCorreo());
        String nombrear=Integer.toString(usuario.getPk_id_usuario())+".jpg";
        model.addAttribute("foto","imagenes/"+nombrear);
        String prueba="imagenes/"+nombrear;
        System.out.println(prueba);        

        //niveles
        List<Nivelprofesor> nivelp=p.getNivelprofesor();
        List<Nivel> niveles = new ArrayList<>();
        for (Nivelprofesor nievel : nivelp) {
            niveles.add(nievel.getNivel());
        }
        model.addAttribute("niveles", niveles);
        model.addAttribute("todosniveles", nivel_bd.getNivels());
        System.out.println(nivel_bd.getNivels());


        //temas
        List<Temaprofesor> temap=p.getTemaprofesor();
        List<Tema> temas = new ArrayList<>();
        for (Temaprofesor tema : temap) {
            temas.add(tema.getTema());
        }
        model.addAttribute("temas", temas);

        List<Tema> todostemas = new ArrayList<>();
        for (Nivel nivelt : niveles) {
            for (Tema teman : nivelt.getTemas()) {
                todostemas.add(teman);
            }
        }       

        model.addAttribute("todostemas", todostemas);
        
        //Cambia boton pedir clase por iniciar sesion
        boolean log =true;
        if (principal==null) {
            log=true;
            
        }else{
            log=false;
        }
        model.addAttribute("log", log);
        

        
        return  "vistaalumno/perfilprofesor";
    }    
}
