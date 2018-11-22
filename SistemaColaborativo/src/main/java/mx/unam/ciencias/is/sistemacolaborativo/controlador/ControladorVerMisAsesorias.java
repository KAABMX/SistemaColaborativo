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
public class ControladorVerMisAsesorias {
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

    

    @RequestMapping(value = "/alumno/vermisasesorias")
    public String guardarAsesoria(HttpServletRequest request, ModelMap model, Principal principal){        
        Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Alumno a = alumno_bd.getAlumno(usuario);
        List<Asesorar> asesorias= a.getAsesorar();
        model.addAttribute("asesorias", asesorias);
    
    
        return  "vistaalumno/vermisasesorias";
    }


  
}
