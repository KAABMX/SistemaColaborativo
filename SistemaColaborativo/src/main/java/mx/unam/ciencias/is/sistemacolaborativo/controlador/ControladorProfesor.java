/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.io.IOException;
import java.math.BigInteger;
import java.security.Principal;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Curriculum;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Estudios;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.CurriculumDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.EstudiosDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
    private EstudiosDAO estudios_bd;
    //Identificador del usuario que inicio sesión.
    private int idUsuario = 9;

    @RequestMapping(value = "/registraProfesor", method = RequestMethod.POST)
    public ModelAndView peticion(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file) {
        try {
            Usuario usuario = new Usuario();
            usuario.setCorreo(request.getParameter("correo"));//previamente se revisa
            if (usuario_bd.getUsuario(usuario.getCorreo()) != null) {
                model.addAttribute("error", "Correo ya registrado!");
                return new ModelAndView("registerProfesor", model);
            }
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido_p(request.getParameter("paterno"));
            usuario.setApellido_m(request.getParameter("materno"));
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String contrasenya = request.getParameter("contrasenya");
            String hashedPassword = passwordEncoder.encode(contrasenya);
            usuario.setContrasenia(hashedPassword);
            String ca = obtenerCadenaAleatoria();
            usuario.setCodigo_activacion(ca);
            if (!file.isEmpty()) {
                usuario.setFoto(file.getBytes());
            }
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
    public ModelAndView guardaCV(HttpServletRequest request, ModelMap model, Principal principal, @RequestParam("file") MultipartFile file) throws IOException {
        Usuario usuario = usuario_bd.getUsuario(principal.getName());
        Profesor p = profesor_bd.getProfesor(usuario);
        p.setCosto_x_hora(request.getParameter("costo"));
        p.setUsuario(usuario);
        //varios niveles
        p.setEstaActivo(true);

        if (!file.isEmpty()) {
            p.setIdentificacion(file.getBytes());
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
        String estudio = request.getParameter("estudios");
        es.setCurriculum(cv);
        es.setEstudio(estudio);
        es.setUniversidad(request.getParameter("universidad"));
        estudios_bd.guardar(es);
        model.addAttribute("nombre", usuario.getNombre());
        model.addAttribute("apellidoP", usuario.getApellido_p());
        model.addAttribute("apellidoM", usuario.getApellido_m());
        model.addAttribute("correo", usuario.getCorreo());
        return new ModelAndView("inicioProfesor", model);
    }

}
