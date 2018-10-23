/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.controlador;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;

/**
 *
 * @author Moctezuma19
 */
public class CorreoActivacion {
    public static void CorreoActivacion(HttpServletRequest request, Usuario usuario) throws IOException, MessagingException {
        /* La cuenta que se usa para autenticarse en el servidor de correo. */

        Session sesionEmail;
        final String usuarioCorreo = "ayaserverfc";
        final String contrasena = "haskellcurry";
        String nombre = "Equipo A&A";
        String direccion = usuarioCorreo;
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.user", usuarioCorreo);
        prop.put("mail.password", contrasena);
        Authenticator autenticador = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                PasswordAuthentication pa
                        = new PasswordAuthentication(usuarioCorreo, contrasena);
                return pa;
            }
        };
        sesionEmail = Session.getInstance(prop, autenticador);

        MimeMessage mensaje = new MimeMessage(sesionEmail);

        String remitente = String.format("%s <%s>", nombre, direccion);
        String recipiente = String.format("%s <%s>",
                usuario.getNombre(),
                usuario.getCorreo());

        mensaje.setFrom(remitente);
        mensaje.addRecipients(Message.RecipientType.TO, recipiente);
        mensaje.setSubject("A&A - Confirma tu cuenta");
        String urlSolicitud = request.getRequestURL().toString();
        int longitudDominio
                = urlSolicitud.length() - request.getRequestURI().length();
        String dominio = urlSolicitud.substring(0, longitudDominio);
        String urlBase = dominio + request.getContextPath();

        String textoMensaje = String.format(
                "Para confirmar tu cuenta ve a "
                + "%s/activar-cuenta?id=%d&codigo=%s",
                urlBase,
                usuario.getPk_id_usuario(),
                usuario.getCodigo_activacion());
        mensaje.setText(textoMensaje);

        Transport.send(mensaje);
    }   
}
