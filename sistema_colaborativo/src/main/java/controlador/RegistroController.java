/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import modelo.Usuario;
import modeloDAO.UsuarioDAO;
import java.sql.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dani3
 */
@Controller

public class RegistroController {
    
    @RequestMapping(value = "/")
    public ModelAndView irRegistro(){
        
        return new ModelAndView("inicio");
    }
    
    @RequestMapping(value = "registrar", method = RequestMethod.GET)
    public ModelAndView registrar(){
        
       return new ModelAndView("registrar", "command", new Usuario());
    }
    
    @RequestMapping(value = "registrar", method = RequestMethod.POST)
    public String registrar(Usuario usuario){
    Date nacimiento=new Date(1996,8, 01);
    usuario.setFechaNacimiento(nacimiento);
    usuario.setNumero(123);
    UsuarioDAO usr=new UsuarioDAO();
    usr.guardar(usuario);
            
        
    
    

    return "exito";
    
    }
    
}
