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
public class ControladorUsuario {

    @Autowired
    private UsuarioDAO usuario_bd;
    @Autowired
    private AlumnoDAO alumno_bd;
    @Autowired
    private InteresAcademicoDAO interes_bd;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";

    }
    
    @RequestMapping(value = "/opcion", method = RequestMethod.GET)
    public String opcion() {
        return "opcion";

    }

    @RequestMapping(value = "/registrarAlumno", method = RequestMethod.GET)
    public String alumno() {
        return "registerAlumno";
    }

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
            /*int opt = Integer.parseInt(request.getParameter("opt"));
            if (opt == 0) {
                Profesor p = new Profesor();
                p.setCostoXHora(request.getParameter("costo"));
                p.setFkIdUsuario(usuario);
                /*
                InputStream ident = new FileInputStream(request.getParameter("foto"));
                String costo = reques.getParameter("foto");
                p.set...
             */
 /*p.setHabilidades(request.getParameter("habilidades"));
                p.setNivelesEducativos(request.getParameter("niveles"));
                //agregar a la base
                Curriculum cv = new Curriculum();
                cv.setFkIdProfesor(p);
                cv.setLugarDeNacimiento(request.getParameter("nacimiento"));
                //agregar a la base
                Experiencia exp = new Experiencia();
                exp.setEmpresa(request.getParameter("empresa"));
                //exp.setFechaFin(fechaFin);
                //exp.setFechaInicio(fechaInicio);
                exp.setFkIdCv(cv);
                exp.setFuncionTrabajo(request.getParameter("trabajo"));
                exp.setTareaTrabajo(request.getParameter("tarea"));
                //agregar a la base
                Estudio es = new Estudio();
                es.setEstudio(request.getParameter("estudio"));
                //es.getFechaFin(fin);
                //es.getFechaInicio(inicio);
                es.setFkIdCv(cv);
                es.setUniversidad(request.getParameter("universidad"));
                //agregar a la base
                Complementario com = new Complementario();
                com.setCentro(request.getParameter("centro"));
                com.setEstudio(request.getParameter("estudiob"));
                //com.setFechaFin(fechaFin);
                //com.setFechaInicio(fechaInicio);
                com.setFkIdCv(cv);
                com.setLugar(request.getParameter("lugar"));
                //agregar a la base
            } else {*/
            Alumno al = new Alumno();
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
