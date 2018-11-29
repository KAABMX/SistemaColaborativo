/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.mapeobd;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author hectorsama
 */
@Entity
@Table(name = "Usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pk_id_usuario")
    private int pk_id_usuario;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "apellido_paterno")
    private String apellido_p;
    @Column(name = "apellido_materno")
    private String apellido_m;
    @Column(name = "correo")
    private String correo;
    @Column(name = "foto")
    private byte[] foto;
    @Column(name = "contrasenia")
    private String contrasenia;
    @Column(name = "rol")
    private String rol;
    @Column(name = "codigo_activacion")
    private String codigo_activacion;
    @Column(name = "activado")
    private boolean activado;

    @Column(name = "calificacion")
    private double calificacion;
    @Column(name = "problematico")
    private boolean problematico;
    @OneToMany(mappedBy = "fk_id_usuario")    
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Resena> resena =  new ArrayList<>();    
    @OneToMany(mappedBy = "fk_id_usuario")    
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Denuncia> denuncia =  new ArrayList<>();    
    public boolean getActivado() {
        return activado;
    }

    public void setActivado(boolean activado) {
        this.activado = activado;
    }
    
    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getContrasenia() {
        return contrasenia;
    }
    public String getNombreC(){
        return nombre+" "+apellido_p+" "+apellido_m;
    }
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int getPk_id_usuario() {
        return pk_id_usuario;
    }

    public void setPk_id_usuario(int pk_id_usuario) {
        this.pk_id_usuario = pk_id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_p() {
        return apellido_p;
    }

    public void setApellido_p(String apellido_p) {
        this.apellido_p = apellido_p;
    }

    public String getApellido_m() {
        return apellido_m;
    }

    public void setApellido_m(String apellido_m) {
        this.apellido_m = apellido_m;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getCodigo_activacion() {
        return codigo_activacion;
    }

    public void setCodigo_activacion(String codigo_activacion) {
        this.codigo_activacion = codigo_activacion;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }

    public boolean getProblematico() {
        return problematico;
    }

    public void setProblematico(boolean problematico) {
        this.problematico = problematico;
    }

    public List<Resena> getResena() {
        return resena;
    }

    public void setResena(List<Resena> resena) {
        this.resena = resena;
    }

    public List<Denuncia> getDenuncia() {
        return denuncia;
    }

    public void setDenuncia(List<Denuncia> denuncia) {
        this.denuncia = denuncia;
    }

}
