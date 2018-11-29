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
@Table(name = "Alumno")
public class Alumno implements java.io.Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pk_id_alumno")
    private int pk_id_alumno;
    @OneToOne
    @JoinColumn(name = "fk_id_usuario")
    private Usuario fk_id_usuario;
    @Column(name = "ultimo_nivel_educativo")
    private String ultimo_nivel_educativo;
    @OneToMany(mappedBy = "alumno")
    private List<InteresAcademico> intereses;
    @OneToMany(mappedBy = "fk_id_alumno")    
    @LazyCollection(LazyCollectionOption.FALSE)    
    private List<Asesorar> asesorar =  new ArrayList<>();

    public Usuario getUsuario() {
        return fk_id_usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.fk_id_usuario = usuario;
    }

    public int getPk_id_alumno() {
        return pk_id_alumno;
    }

    public void setPk_id_alumno(int pk_id_alumno) {
        this.pk_id_alumno = pk_id_alumno;
    }

    public String getUltimo_nivel_educativo() {
        return ultimo_nivel_educativo;
    }

    public void setUltimo_nivel_educativo(String ultimo_nivel_educativo) {
        this.ultimo_nivel_educativo = ultimo_nivel_educativo;
    }

    public List<InteresAcademico> getIntereses() {
        return intereses;
    }

    public void setIntereses(List<InteresAcademico> intereses) {
        this.intereses = intereses;
    }

    public List<Asesorar> getAsesorar() {
        return asesorar;
    }

    public void setAsesorar(List<Asesorar> asesorar) {
        this.asesorar = asesorar;
    }

    
}
