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
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Dia;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Horario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivel;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Nivelprofesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Tema;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Temaprofesor;
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
/**
 *
 * @author dani3
 */
@Controller
public class ControladorHorarioProfesor {
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
    private NivelprofesorDAO nievelprofesor_bd;
    @Autowired
    private NivelDAO nivel_bd;
    @Autowired
    private DiaDAO dia_bd;
    
    
    @RequestMapping(value = "/profesor/mostrarhorario")
    public String mostrarHorario(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
        //dias
        List<Dia> dias=p.getDia();
        model.addAttribute("dias",dias);
        model.addAttribute("todosdias", dia_bd.getDias());        
        //horarios
        List<Horario> horarios=new ArrayList<>();
        for (Dia dia : dias) {
           for (Horario horario : dia.getHorarios()) {
               horarios.add(horario);
           }
        }
        model.addAttribute("horarios",horarios);
        //niveles
        List<Nivelprofesor> nivelp=p.getNivelprofesor();
        List<Nivel> niveles = new ArrayList<>();
        for (Nivelprofesor nievel : nivelp) {
            niveles.add(nievel.getNivel());
        }
        model.addAttribute("niveles", niveles);
        model.addAttribute("todosniveles", nivel_bd.getNivels());

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
        
        

        
        return  "vistaprofesor/horario";
    }
    

    
    @RequestMapping(value = "/profesor/guardardia")
    public String guardarDia(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
    Dia dia=new Dia();
    dia.setDia(request.getParameter("dia"));
    dia.setFk_id_profesor(p);
    dia_bd.guardar(dia);
        return  "redirect:/profesor/mostrarhorario";
    }

    @RequestMapping(value = "/profesor/guardarhorario")
    public String guardarHorario(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
    Dia dia=dia_bd.getDia(Integer.valueOf(request.getParameter("diase")));
    String hora=request.getParameter("hora")+":00";
    Horario horario=new Horario();
    Time hi=Time.valueOf(hora);
    horario.setHora(hi);
    horario.setDisponible(Boolean.TRUE);
    horario.setIddia(dia);
    horario_bd.guardar(horario);
        return  "redirect:/profesor/mostrarhorario";
    }
    
    @RequestMapping(value = "/profesor/guardartema")
    public String guardarTema(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
    String tema=request.getParameter("temaseleccionado");
    int t = Integer.parseInt(tema);
    Tema nuevoTema = new Tema();
    nuevoTema.setTema("este es un tema auxiliar");
    nuevoTema.setIdtema(t);
    Temaprofesor nuevoTemaProfesor= new Temaprofesor();
    nuevoTemaProfesor.setProfesor(p);
    nuevoTemaProfesor.setTema(nuevoTema);
    temaprofesor_bd.guardar(nuevoTemaProfesor);
    
    
        return  "redirect:/profesor/mostrarhorario";
    }    

    @RequestMapping(value = "/profesor/guardarnivel")
    public String guardarNivel(HttpServletRequest request, ModelMap model, Principal principal){
    Usuario usuario = usuario_bd.getUsuario(principal.getName());
    Profesor p = profesor_bd.getProfesor(usuario);
    String nivel=request.getParameter("nivelseleccionado");
    int t = Integer.parseInt(nivel);
    Nivel nuevoNivel = new Nivel();
    nuevoNivel.setNivel("este es un nivel auxiliar");
    nuevoNivel.setIdnivel(t);
    Nivelprofesor nuevoNivelProfesor= new Nivelprofesor();
    nuevoNivelProfesor.setProfesor(p);
    nuevoNivelProfesor.setNivel(nuevoNivel);
    nievelprofesor_bd.guardar(nuevoNivelProfesor);
    
    
        return  "redirect:/profesor/mostrarhorario";
    }
}
