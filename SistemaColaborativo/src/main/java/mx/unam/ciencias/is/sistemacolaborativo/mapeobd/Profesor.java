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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name = "Profesor")
public class Profesor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pk_id_profesor")
    private int pk_id_profesor;
    @OneToOne
    @JoinColumn(name = "fk_id_usuario")
    private Usuario usuario;
    @Column(name = "identificacion")
    private byte[] identificacion;
    @Column(name = "costo_x_hora")
    private String costo_x_hora;
    @Column(name = "estaActivo")
    private boolean estaActivo;
    @OneToMany(mappedBy = "fk_id_profesor")    
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Dia> dia =  new ArrayList<>();
    @OneToMany(mappedBy = "fk_id_profesor")  
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Temaprofesor> temaprofesor =  new ArrayList<>();
    @OneToMany(mappedBy = "fk_id_profesor")  
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Nivelprofesor> nivelprofesor =  new ArrayList<>();
    @OneToMany(mappedBy = "fk_id_profesor")    
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Asesorar> asesorar =  new ArrayList<>();


    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public int getPk_id_profesor() {
        return pk_id_profesor;
    }

    public void setPk_id_profesor(int pk_id_profesor) {
        this.pk_id_profesor = pk_id_profesor;
    }

    public String getCosto_x_hora() {
        return costo_x_hora;
    }

    public void setCosto_x_hora(String costo_x_hora) {
        this.costo_x_hora = costo_x_hora;
    }

    public byte[] getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(byte[] identificacion) {
        this.identificacion = identificacion;
    }

    public boolean getEstaActivo() {
        return estaActivo;
    }

    public void setEstaActivo(boolean estaActivo) {
        this.estaActivo = estaActivo;
    }

    public List<Dia> getDia() {
        return dia;
    }

    public void setDia(List<Dia> dia) {
        this.dia = dia;
    }
    

    public List<Temaprofesor> getTemaprofesor() {
        return this.temaprofesor;
    }
    
    public void setTemaprofesor(List<Temaprofesor> temaprofesor) {
        this.temaprofesor = temaprofesor;
    } 

    public List<Asesorar> getAsesorar() {
        return this.asesorar;
    }
    
    public void setAsesorar(List<Asesorar> asesorar) {
        this.asesorar = asesorar;
    } 

    public List<Nivelprofesor> getNivelprofesor() {
        return nivelprofesor;
    }

    public void setNivelprofesor(List<Nivelprofesor> nivelprofesor) {
        this.nivelprofesor = nivelprofesor;
    }

}
