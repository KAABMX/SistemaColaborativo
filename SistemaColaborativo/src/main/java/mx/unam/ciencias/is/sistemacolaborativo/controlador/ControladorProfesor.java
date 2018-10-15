/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.io.InputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
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
    //Identificador del usuario que inicio sesión.
    private int idUsuario = 9;

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
            usuario.setSexo(request.getParameter("sexo"));
            usuario_bd.guardar(usuario);
            Profesor p = new Profesor();
            p.setUsuario(usuario);
            profesor_bd.guardar(p);
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("index", model);
    }

    /**
     * Actualiza los campos de un profesor.
     *
     * @param request
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping(value = "/actualizaProfesor", method = RequestMethod.POST)
    public ModelAndView actualizarProfesor(HttpServletRequest request, ModelMap model, Principal principal) {
        //idUsuario = Integer.parseInt(request.getParameter("id"));
        Usuario usuarioActualizado = usuario_bd.getUsuario(idUsuario);
        String nombre = request.getParameter("nombre");
        if (!request.getParameter("correo").equals("")) {
            usuarioActualizado.setCorreo(request.getParameter("correo"));
        }
        if (!request.getParameter("nombre").equals("")) {            
            usuarioActualizado.setNombre(request.getParameter("nombre"));
        }
        if (!request.getParameter("paterno").equals("")) {
            usuarioActualizado.setApellido_p(request.getParameter("paterno"));
        }
        if (!request.getParameter("materno").equals("")) {
            usuarioActualizado.setApellido_m(request.getParameter("materno"));
        }
        if (!request.getParameter("telefono").equals("")) {
            usuarioActualizado.setTelefono(request.getParameter("telefono"));
        }
        if (!request.getParameter("contrasenya").equals("")) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            usuarioActualizado.setContrasenia(passwordEncoder.encode(request.getParameter("contrasenya")));
            String contrasenaConf = request.getParameter("confirm");
        }
        if (!request.getParameter("sexo").equals("")) {
            usuarioActualizado.setSexo(request.getParameter("sexo"));
        }        
        usuario_bd.actualizar(usuarioActualizado);
        Profesor profesorActualizado = profesor_bd.getProfesor(usuarioActualizado);
        profesorActualizado.setCosto_x_hora(request.getParameter("costo"));
        profesorActualizado.setUsuario(usuarioActualizado);
        profesorActualizado.setHabilidades(request.getParameter("habilidades"));
        //varios niveles
        //profesorActualizado.setEstaActivo(true);
        String prim = request.getParameter("primaria");
        String sec = request.getParameter("secundaria");
        String bach = request.getParameter("bachillerato");
        String uni = request.getParameter("licenciatura");
        String pos = request.getParameter("posgrado");
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
            hab += "licenciatura,";
        }
        if (pos != null && pos.equals("on")) {
            hab += "posgrado,";
        }
        if (hab.length() != 0) {
            hab = hab.substring(0, hab.length() - 1);
        }
        profesorActualizado.setNiveles_educativos(hab);

        try {
            Part file = request.getPart("file");
            InputStream is = file.getInputStream();
            byte[] ident = new byte[is.available()];
            is.read(ident);
            //profesorActualizado.setIdentificacion(ident);
        } catch (Exception e) {

        }
        //agregar a la base
        profesor_bd.actualizar(profesorActualizado);
        //borrar y ver como se guardan las fechas
        Curriculum cv = new Curriculum();
        cv.setProfesor(profesorActualizado);
        cv.setLugar_de_nacimiento(request.getParameter("lugar"));
        cv_bd.actualizar(cv);//Revisar
        //agregar a la base
        Estudios es = new Estudios();
        String fecha_inicio = request.getParameter("fecha_inicio");
        String fecha_fin = request.getParameter("fecha_fin");
        String estudio = request.getParameter("estudios");
        es.setCurriculum(cv);
        try {
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio);
            Date finalDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin);
            es.setFecha_inicio(startDate);
            es.setFecha_fin(finalDate);
        } catch (Exception e) {

        }
        es.setUniversidad(request.getParameter("universidad"));
        estudios_bd.actualizar(es);//Revisar

        Experiencia exp = new Experiencia();
        exp.setEmpresa(request.getParameter("empresa"));
        String fecha_inicio_experiencia = request.getParameter("fecha_inicio_trabajo");
        String fecha_fin_experiencia = request.getParameter("fecha_fin_trabajo");
        try {
            Date startDateexp = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio_experiencia);
            Date finalDateexp = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin_experiencia);
            exp.setFecha_inicio(startDateexp);
            exp.setFecha_fin(finalDateexp);
        } catch (Exception e) {

        }
        exp.setCurriculum(cv);
        exp.setFuncion_trabajo(request.getParameter("funcion_trabajo"));
        exp.setTarea_trabajo(request.getParameter("tarea_trabajo"));
        experiencia_bd.actualizar(exp);

        return new ModelAndView("actualizarProfesor", model);
    }
}
