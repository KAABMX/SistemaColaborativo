/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

/**
 *
 * @author dani3
 */
import java.security.Principal;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Asesorar;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Dia;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Horario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivel;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivelprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Tema;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Temaprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AsesorarDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.DiaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.HorarioDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.NivelDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.NivelprofesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.TemaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.TemaprofesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@MultipartConfig
public class ControladorPedirClase {
    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private ProfesorDAO profesor_bd;
    @Autowired
    private AlumnoDAO alumno_bd;
    @Autowired
    private HorarioDAO horario_bd;
    @Autowired
    private DiaDAO dia_bd;
    @Autowired
    private TemaprofesorDAO temaprofesor_bd;
    @Autowired
    private TemaDAO tema_bd;
    @Autowired
    private NivelprofesorDAO nievelprofesor_bd;
    @Autowired
    private NivelDAO nivel_bd;
    @Autowired
    private AsesorarDAO asesorar_bd;

    
    @RequestMapping(value = "/alumno/pedirclase")
    public String pedirClase(HttpServletRequest request, ModelMap model, Principal principal){
        String idProfesor=request.getParameter("idprofesor");
        int id=Integer.valueOf(idProfesor);
        Profesor p=profesor_bd.getProfesor(id);
        model.addAttribute("idprofesor", p.getPk_id_profesor());
        //dias
        List<Dia> dias=p.getDia();
        model.addAttribute("dias", dias);
        //horas
        List<Horario> horarios;
        if (request.getParameter("diasse")==null) {
            horarios=new ArrayList<>();
            model.addAttribute("horarios", horarios);
            
        }else {
        String diasse=request.getParameter("diasse");
        Dia dia= dia_bd.getDia(Integer.valueOf(diasse));
        System.out.println(dia.getDia());
        horarios= dia.getHorarios();
        model.addAttribute("horarios", horarios);
        model.addAttribute("diasse", diasse);
        }
        
        
        //temas
        List<Temaprofesor> temap=p.getTemaprofesor();
        List<Tema> temas = new ArrayList<>();
        for (Temaprofesor tema : temap) {
            temas.add(tema.getTema());
        }
        model.addAttribute("temas", temas);
        
        return  "vistaalumno/pedirclase";
    }
    
    @RequestMapping(value = "/alumno/guardarclase")
    public String guardarAsesoria(HttpServletRequest request, ModelMap model, Principal principal){
       //String idProfesor=request.getParameter("idprofesorr");
       //int idp=Integer.valueOf(idProfesor);
       Profesor p=profesor_bd.getProfesor(1);
        
        Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Alumno a = alumno_bd.getAlumno(usuario);
        System.out.println("idalumno"+a.getUsuario().getCorreo());
        
        
        
        String idTema=request.getParameter("tema");
        int idt=Integer.valueOf(idTema);
        Tema t= tema_bd.getTema(idt);
        System.out.println("idtema "+t.getTema());
        
        String idHorario=request.getParameter("hora");
        int idh=Integer.valueOf(idHorario);
        Horario h= horario_bd.getHorario(idh);
    
        Asesorar nuevo=new Asesorar();
        nuevo.setProfesor(p);
        nuevo.setAlumno(a);
        nuevo.setTema(t);
        nuevo.setComentario(request.getParameter("comentario"));
        nuevo.setHorario(h);
        nuevo.setAceptada(Boolean.FALSE);
        nuevo.setDuracion(0);
        nuevo.setCosto(0.0);
        //System.out.println("asesoras"+nuevo.getAlumno().getPk_id_alumno());
        asesorar_bd.guardar(nuevo);

        model.addAttribute("asesoria", nuevo);
    
    
        return  "vistaalumno/mostrarnuevaclase";
    }
    
    
}


