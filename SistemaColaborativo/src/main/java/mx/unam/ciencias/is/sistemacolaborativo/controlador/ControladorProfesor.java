/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.io.InputStream;
import java.math.BigInteger;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Experiencia;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
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
@MultipartConfig
public class ControladorProfesor {

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
            String ca = obtenerCadenaAleatoria();
            usuario.setCodigo_activacion(ca);
            //InputStream foto = new FileInputStream(request.getParameter("foto"));
            //convertir la foto a bytes y agregarlo al usuario
            usuario.setSexo(request.getParameter("sexo"));
            usuario.setRol("ROLE_PROFESOR");
            usuario_bd.guardar(usuario);
            Profesor p = new Profesor();
            p.setUsuario(usuario);
            profesor_bd.guardar(p);
            CorreoActivacion caa = new CorreoActivacion();
            caa.CorreoActivacion(request, usuario);
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("index", model);
    }


    /**
     * Genera una cadena aleatoria para usarse como código de activación.
     *
     * @return una cadena aleatoria de 30 caracteres
     */
    private String obtenerCadenaAleatoria() {
        /* La base que se usa para convertir un número a cadena. */
        final int base = 32;
        /*
         * Tamaño de la cadena aleatoria. Usa 30 caracteres, y cada carácter
         * corresponde a 5 bits.
         */
        final int tam = 30 * 5;

        Random rnd = new Random();
        return new BigInteger(tam, rnd).toString(base);
    }

    @RequestMapping(value = "/profesor/curriculum", method = RequestMethod.GET)
    public ModelAndView curriculum(HttpServletRequest request, ModelMap model, Principal principal) {
        return new ModelAndView("vistaprofesor/curriculum", model);
    }
    
    @RequestMapping(value = "/profesor/vermiperfilprofesor", method = RequestMethod.GET)
    public String verMiPerfilProfesor(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Profesor p = profesor_bd.getProfesor(usuario);        
        model.addAttribute("usuario", usuario);
        model.addAttribute("profesor", p);
        return "vistaprofesor/miPerfilProfesor";
    }

    @RequestMapping(value = "/activar-cuenta", method = RequestMethod.GET)
    public ModelAndView activacion(HttpServletRequest request, ModelMap model, Principal principal) {
        int pk_id_usuario = Integer.parseInt(request.getParameter("id"));
        String clave = request.getParameter("codigo");
        Usuario user = usuario_bd.getUsuario(pk_id_usuario);
        if (user.getCodigo_activacion().equals(clave)) {
            user.setActivado(true);
        }
        usuario_bd.actualizar(user);
        return new ModelAndView("activar-cuenta", model);
    }

    @RequestMapping(value = "/profesor/guardacv", method = RequestMethod.POST)
    public ModelAndView guardaCV(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Profesor p = profesor_bd.getProfesor(usuario);
        p.setCosto_x_hora(request.getParameter("costo"));
        p.setUsuario(usuario);
        //varios niveles
        p.setEstaActivo(true);

        try {
            Part file = request.getPart("file");
            InputStream is = file.getInputStream();
            byte[] ident = new byte[is.available()];
            is.read(ident);
            p.setIdentificacion(ident);
        } catch (Exception e) {

        }
        //agregar a la base
        profesor_bd.actualizar(p);
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
        es.setEstudio(estudio);
        try {
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_inicio);
            Date finalDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_fin);
            es.setFecha_inicio(startDate);
            es.setFecha_fin(finalDate);
        } catch (Exception e) {

        }
        es.setUniversidad(request.getParameter("universidad"));
        estudios_bd.guardar(es);

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
        experiencia_bd.guardar(exp);

        return new ModelAndView("inicioProfesor", model);
    }

}
