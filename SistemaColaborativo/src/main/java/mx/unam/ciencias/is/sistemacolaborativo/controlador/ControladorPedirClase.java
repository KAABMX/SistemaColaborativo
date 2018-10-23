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
    private HorarioDAO horario_bd;
    @Autowired
    private TemaprofesorDAO temaprofesor_bd;
    @Autowired
    private TemaDAO tema_bd;
    @Autowired
    private NivelprofesorDAO nievelprofesor_bd;
    @Autowired
    private NivelDAO nivel_bd;

    
        @RequestMapping(value = "/alumno/pedirclase")
    public String pedirClase(HttpServletRequest request, ModelMap model, Principal principal){
        String idProfesor=request.getParameter("idprofesor");
            System.out.println(idProfesor);
        int id=Integer.valueOf(idProfesor);
        Profesor p=profesor_bd.getProfesor(id);
        //temas
        List<Temaprofesor> temap=p.getTemaprofesor();
        List<Tema> temas = new ArrayList<>();
        for (Temaprofesor tema : temap) {
            temas.add(tema.getTema());
        }
        model.addAttribute("temas", temas);
        
        return  "vistaalumno/pedirclase";
    }
    
    @RequestMapping(value = "/alumno/prueba")
    public String prueba(HttpServletRequest request, ModelMap model, Principal principal){
        String t=request.getParameter("valor");

        model.addAttribute("t", t);
        
        return  "vistaalumno/pedirclase";
    }
}
