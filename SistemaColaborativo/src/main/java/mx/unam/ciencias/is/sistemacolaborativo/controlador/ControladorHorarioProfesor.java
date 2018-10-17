/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;


import java.security.Principal;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
//import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Complementarios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Horario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ComplementariosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ExperienciaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.HorarioDAO;
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
public class ControladorHorarioProfesor {
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
    @Autowired
    private HorarioDAO horario_bd;

    @RequestMapping(value = "/profesor/mostrarhorario")
    public String mostrarHorario(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
        List<Horario> horarios=p.getHorario();
        model.addAttribute("horarios",horarios);
        return  "vistaprofesor/horario";
    }
    
    @RequestMapping(value = "/profesor/agregarhorario")
    public ModelAndView obtenerHorario(HttpServletRequest request, ModelMap model, Principal principal){
        return new ModelAndView("vistaprofesor/horarioagrega", "command",new Horario());
    }
    
    @RequestMapping(value = "/profesor/guardarhorario")
    public String guardarHorario(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
    String horaInicio=request.getParameter("horaInicio")+":00";
    String horaFin=request.getParameter("horaFin")+":00";
    String dia=request.getParameter("dia");
    Horario horario=new Horario();
    horario.setDia(dia);
    Time hi=Time.valueOf(horaInicio);
    Time hf=Time.valueOf(horaFin);
    horario.setHoraInicio(hi);
    horario.setHoraFin(hf);
    horario.setDisponible(Boolean.TRUE);
    horario.setProfesor(p);
    horario_bd.guardar(horario);
        return  "redirect:/profesor/mostrarhorario";
    }


}
