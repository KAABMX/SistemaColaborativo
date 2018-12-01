/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.math.BigInteger;
import java.security.Principal;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hectorsama
 */
@Controller
public class ControladorAlumno {

    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private AlumnoDAO alumno_bd;
 
    //Identificador del usuario que inicio sesión.
    private int idUsuario = 8;

    @RequestMapping(value = "/registra", method = RequestMethod.POST)
    public ModelAndView peticion(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file) {
        try {
            Usuario usuario = new Usuario();
            usuario.setCorreo(request.getParameter("correo"));//previamente se revisa
            if (usuario_bd.getUsuario(usuario.getCorreo()) != null) {
                model.addAttribute("error", "Correo ya registrado!");
                return new ModelAndView("registerAlumno", model);
            }
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido_p(request.getParameter("paterno"));
            usuario.setApellido_m(request.getParameter("materno"));
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            usuario.setContrasenia(passwordEncoder.encode(request.getParameter("contrasenya")));
            String contrasenaConf = request.getParameter("confirm");
            usuario.setRol("ROLE_ESTUDIANTE");
            String ca = obtenerCadenaAleatoria();
            usuario.setCodigo_activacion(ca);
            if (!file.isEmpty()) {
                usuario.setFoto(file.getBytes());
            }
            
            usuario_bd.guardar(usuario);
            Usuario us= usuario_bd.getUsuario(usuario.getCorreo());
            String ruta="/Users/francisco/Documents/fciencias/noveno/inge2/frankprueba/SistemaColaborativo/SistemaColaborativo/src/main/webapp/imagenes";            
            BufferedImage img = ImageIO.read(new ByteArrayInputStream(us.getFoto()));
            String nombrear=Integer.toString(usuario.getPk_id_usuario());
            ImageIO.write(img,"png",new File(ruta+"/"+nombrear+".jpg"));            
            Alumno al = new Alumno();
            al.setUsuario(usuario);
            al.setUltimo_nivel_educativo(request.getParameter("nivel"));
            al.setIntereses(request.getParameter("intereses"));
            alumno_bd.guardar(al);
            CorreoActivacion caa = new CorreoActivacion();
            caa.CorreoActivacion(request, usuario);
        } catch (Exception e) {

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

    

}
