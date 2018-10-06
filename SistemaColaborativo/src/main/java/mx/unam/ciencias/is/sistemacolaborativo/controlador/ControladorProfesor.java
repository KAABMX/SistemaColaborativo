/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Complementarios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Experiencia;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ComplementariosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ExperienciaDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hectorsama, luis
 */
@Controller
public class ControladorProfesor {

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

    @RequestMapping(value = "/registraProfesor", method = RequestMethod.POST)
    public ModelAndView peticion(HttpServletRequest request, ModelMap model) {
        try {
            Usuario usuario = new Usuario();
            usuario.setCorreo(request.getParameter("correo"));//previamente se revisa
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido_p(request.getParameter("paterno"));
            usuario.setApellido_m(request.getParameter("materno"));
            usuario.setTelefono(request.getParameter("telefono"));
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String contrasenya = request.getParameter("contrasenya");
            String hashedPassword = passwordEncoder.encode(contrasenya);
            usuario.setContrasenia(hashedPassword);
            //InputStream foto = new FileInputStream(request.getParameter("foto"));
            //convertir la foto a bytes y agregarlo al usuario
            usuario.setSexo(request.getParameter("sexo"));
            usuario.setRol("ROLE_PROFESOR");
            usuario_bd.guardar(usuario);
            Profesor p = new Profesor();
            //agregar costo
            p.setCosto_x_hora(request.getParameter("costo"));
            p.setUsuario(usuario);
            p.setHabilidades(request.getParameter("habilidades"));
            //varios niveles

            String prim = request.getParameter("primaria");
            String sec = request.getParameter("secundaria");
            String bach = request.getParameter("bachillerato");
            String uni = request.getParameter("universidad");
            String hab = "";
            if (prim != null && prim.equals("on")) {
                hab += "primaria,";
            }
            if (sec != null && sec.equals("on")) {
                hab += "secundaria,";
            }
            if (bach != null && bach.equals("on")) {
                hab += "bachillerato,";
            }
            if (uni != null && uni.equals("on")) {
                hab += "universidad,";
            }
            if (hab.length() != 0) {
                hab = hab.substring(0, hab.length() - 1);
            }
            p.setNiveles_educativos(hab);
            //agregar a la base
            profesor_bd.guardar(p);
            //borrar y ver como se guardan las fechas
            Curriculum cv = new Curriculum();
            cv.setProfesor(p);
            cv.setLugar_de_nacimiento(request.getParameter("lugar"));
            cv_bd.guardar(cv);
            //agregar a la base
            Estudios es = new Estudios();
            String fecha_inicio = request.getParameter("fecha_inicio");
            String fecha_fin = request.getParameter("fecha_fin");
            String estudio = request.getParameter("estudios");
            es.setCurriculum(cv);
            //Si no "dd/MM/yyyy"
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio);
            Date finalDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin);
            es.setFecha_inicio(startDate);
            es.setFecha_fin(finalDate);
            es.setUniversidad(request.getParameter("universidad"));
            estudios_bd.guardar(es);

            Experiencia exp = new Experiencia();
            exp.setEmpresa(request.getParameter("empresa"));
            String fecha_inicio_experiencia = request.getParameter("fecha_inicio");
            String fecha_fin_experiencia = request.getParameter("fecha_fin");
            Date startDateexp = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio_experiencia);
            Date finalDateexp = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin_experiencia);
            exp.setFecha_inicio(startDateexp);
            exp.setFecha_fin(finalDateexp);
            exp.setCurriculum(cv);
            exp.setFuncion_trabajo(request.getParameter("funcion_trabajo"));
            exp.setTarea_trabajo(request.getParameter("tarea_trabajo"));
            experiencia_bd.guardar(exp);

            /*
            //agregar a la base/
            Complementarios com = new Complementarios();
            com.setCentro(request.getParameter("centro"));
            com.setEstudio(request.getParameter("estudiob"));
            //com.setFechaFin(fechaFin);
            //com.setFechaInicio(fechaInicio);
            com.setCurriculum(cv);
            com.setLugar(request.getParameter("lugar"));
            complementarios_bd.guardar(com); //agregar a la base*/
        } catch (Exception e) {

        }
        return new ModelAndView("index", model);
    }

}
