/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.InteresAcademico;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.InteresAcademicoDAO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    @Autowired
    private InteresAcademicoDAO interes_bd;

    @RequestMapping(value = "/registra", method = RequestMethod.POST)
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
            System.out.println(hashedPassword);
            String contrasenaConf = request.getParameter("confirm");
            //InputStream foto = new FileInputStream(request.getParameter("foto"));
            //convertir la foto a bytes y agregarlo al usuario
            usuario.setSexo(request.getParameter("sexo"));
            usuario_bd.guardar(usuario);
            //hasta aqui se crea el usuario
            //agregar a la ase
            Alumno al = new Alumno();
            al.getFk_id_usuario();
            al.setUltimo_nivel_educativo(request.getParameter("nivel"));
            //agregar a la base
            alumno_bd.guardar(al);

            int id = Integer.parseInt(request.getParameter("fk_id_alumno"));
            System.out.println(id);
            Alumno us = alumno_bd.getAlumno(id);
            String matematicas = request.getParameter("matematicas");
            String espanol = request.getParameter("espanol");
            String geografia = request.getParameter("geografia");
            String historia = request.getParameter("historia");

            if (matematicas != null && matematicas.equals("on")) {
                InteresAcademico g = new InteresAcademico();
                g.setInteres("Matematicas");
                g.setFk_id_alumno(id);
                interes_bd.guardar(g);
            }

            if (espanol != null && espanol.equals("on")) {
                InteresAcademico g = new InteresAcademico();
                g.setInteres("Español");
                g.setFk_id_alumno(id);
                interes_bd.guardar(g);
            }

            if (geografia != null && geografia.equals("on")) {
                InteresAcademico g = new InteresAcademico();
                g.setInteres("Geografía");
                g.setFk_id_alumno(id);
                interes_bd.guardar(g);
            }
            if (historia != null && historia.equals("on")) {
                InteresAcademico g = new InteresAcademico();
                g.setInteres("Historia");
                g.setFk_id_alumno(id);
                interes_bd.guardar(g);
            }
                         
        } catch (Exception e) {

        }
        return new ModelAndView("index", model);

    }
}
