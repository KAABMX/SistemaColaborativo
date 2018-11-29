/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Alumno;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Asesorar;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Profesor;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Denuncia;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AlumnoDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.AsesorarDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.ProfesorDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.UsuarioDAO;
import mx.unam.ciencias.is.sistemacolaborativo.modelo.DenunciaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author jrivera
 */
@Controller
public class ControladorDenuncia {

    @Autowired
    ProfesorDAO profesor_db;
    @Autowired
    UsuarioDAO Usuario_db;
    @Autowired
    AsesorarDAO asesorar_db;
    @Autowired
    AlumnoDAO alumno_db;
    @Autowired
    DenunciaDAO denuncia_db;

    @RequestMapping(value = "/profesor/denunciarP", method = RequestMethod.GET)
    public ModelAndView verAlumnosD(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario u = Usuario_db.getUsuario(principal.getName());
        Profesor p = profesor_db.getProfesor(u);
        List<Usuario> alumno = new LinkedList<>();
        for (Asesorar a : p.getAsesorar()) {
            alumno.add(a.getAlumno().getUsuario());
        }
        model.addAttribute("alumnoLista", alumno);
        return new ModelAndView("vistaprofesor/denunciarAlumno", model);
    }

    @RequestMapping(value = "/profesor/denunciarPP", method = RequestMethod.GET)
    public ModelAndView explicaDenunciaP(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario d = Usuario_db.getUsuario(Integer.parseInt(request.getParameter("id")));
        String nombreC = d.getNombreC();
        model.addAttribute("nombreDenunciado", nombreC);
        model.addAttribute("idDenunciado", d.getPk_id_usuario());
        model.addAttribute("opt", request.getParameter("opt"));
        return new ModelAndView("vistaprofesor/denunciaAlumno", model);
    }

    @RequestMapping(value = "/profesor/realizaDenunciaP", method = RequestMethod.POST)
    public ModelAndView realizaDenunciaP(HttpServletRequest request, ModelMap model, Principal principal) {
        String id = request.getParameter("ida");
        String exp = request.getParameter("exp");
        Usuario u = Usuario_db.getUsuario(Integer.parseInt(id));
        Alumno al = alumno_db.getAlumno(u);
        Usuario u2 = Usuario_db.getUsuario(principal.getName());
        Denuncia d = new Denuncia();
        d.setMotivo(exp);
        d.setUsuario(u);
        if (request.getParameter("opt") != "false") {
            denuncia_db.guardar(d);
            return new ModelAndView("vistaalumno/indexusuario", model);
        }
        Profesor p = profesor_db.getProfesor(u2);
        Asesorar as = asesorar_db.getAsesorar(p, al);
        if (as != null) {
            asesorar_db.eliminar(as);
        }
        denuncia_db.guardar(d);
        return new ModelAndView("vistaprofesor/inicioProfesor", model);
    }

    @RequestMapping(value = "/alumno/denunciarA", method = RequestMethod.GET)
    public ModelAndView verProfesoresD(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario u = Usuario_db.getUsuario(principal.getName());
        Alumno p = alumno_db.getAlumno(u);
        List<Usuario> profesor = new LinkedList<>();
        for (Asesorar a : p.getAsesorar()) {
            profesor.add(a.getProfesor().getUsuario());
        }
        model.addAttribute("profesorLista", profesor);
        return new ModelAndView("vistaalumno/denunciarProfesor", model);
    }

    @RequestMapping(value = "/alumno/denunciarAA", method = RequestMethod.GET)
    public ModelAndView explicaDenunciaA(HttpServletRequest request, ModelMap model, Principal principal) {
        Usuario d = Usuario_db.getUsuario(Integer.parseInt(request.getParameter("id")));
        String nombreC = d.getNombreC();
        model.addAttribute("nombreDenunciado", nombreC);
        model.addAttribute("idDenunciado", d.getPk_id_usuario());
        model.addAttribute("opt", request.getParameter("opt"));
        return new ModelAndView("vistaalumno/denunciaProfesor", model);
    }

    @RequestMapping(value = "/alumno/realizaDenunciaA", method = RequestMethod.POST)
    public ModelAndView realizaDenunciaA(HttpServletRequest request, ModelMap model, Principal principal) {

        Usuario u2 = Usuario_db.getUsuario(principal.getName());
        Alumno al = alumno_db.getAlumno(u2);
        String exp = request.getParameter("exp");
        Denuncia d = new Denuncia();
        d.setMotivo(exp);
        Usuario u = Usuario_db.getUsuario(Integer.parseInt(request.getParameter("ida")));
        d.setUsuario(u);
        if (request.getParameter("opt") != "false") {
            denuncia_db.guardar(d);
            return new ModelAndView("vistaalumno/indexusuario", model);
        }
        Profesor p = profesor_db.getProfesor(u);
        Asesorar as = asesorar_db.getAsesorar(p, al);
        if (as != null) {
            asesorar_db.eliminar(as);
        }
        denuncia_db.guardar(d);
        return new ModelAndView("vistaalumno/indexusuario", model);
    }

    @RequestMapping(value = "/alumno/nombreD", method = RequestMethod.POST)
    public ModelAndView denunciaEspecificaA(HttpServletRequest request, ModelMap model, Principal principal) {
        String nombrec = request.getParameter("nombre");
        if (nombrec == null || nombrec.length() == 0) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaalumno/denunciarProfesor", model);
        }
        String[] nombres = nombrec.split(" ");
        if (nombres.length < 3 || nombres.length > 4) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaalumno/denunciarProfesor", model);
        }
        Usuario denunciado = Usuario_db.getUsuario(nombres[0], nombres[1], nombres[2]);
        if (denunciado == null) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaalumno/denunciarProfesor", model);
        }
        model.addAttribute("id_buscado", denunciado.getPk_id_usuario());
        model.addAttribute("nombre_c", denunciado.getNombreC());
        model.addAttribute("opt", "true");
        return new ModelAndView("vistaalumno/denunciaProfesor", model);
    }

    @RequestMapping(value = "/profesor/nombreD", method = RequestMethod.POST)
    public ModelAndView denunciaEspecificaP(HttpServletRequest request, ModelMap model, Principal principal) {
        String nombrec = request.getParameter("nombre");
        if (nombrec == null || nombrec.length() == 0) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaalumno/denunciarProfesor", model);
        }
        String[] nombres = nombrec.split(" ");
        if (nombres.length < 3 || nombres.length > 4) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaalumno/denunciarProfesor", model);
        }
        Usuario denunciado = Usuario_db.getUsuario(nombres[0], nombres[1], nombres[2]);
        if (denunciado == null) {
            model.addAttribute("error", "Nombre no encontrado");
            return new ModelAndView("vistaprofesor/denunciarAlumno", model);
        }
        model.addAttribute("id_buscado", denunciado.getPk_id_usuario());
        model.addAttribute("nombre_c", denunciado.getNombreC());
        model.addAttribute("opt", "true");
        return new ModelAndView("vistaprofesor/denunciaAlumno", model);
    }
}
