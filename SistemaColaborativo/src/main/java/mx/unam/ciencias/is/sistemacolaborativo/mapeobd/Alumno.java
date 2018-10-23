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

@Entity
@Table(name = "Alumno")
public class Alumno implements java.io.Serializable {

    @Id
    @OneToOne
    @JoinColumn(name = "fk_id_usuario")
    private Usuario usuario;
    @Column(name = "pk_id_alumno")
    private int pk_id_alumno;
    @Column(name = "ultimo_nivel_educativo")
    private String ultimo_nivel_educativo;
    @OneToMany(mappedBy = "alumno")
    private List<InteresAcademico> intereses;
    @OneToMany(mappedBy = "fk_id_alumno", fetch = FetchType.EAGER )    
    private List<Asesorar> asesorar =  new ArrayList<>();

    public List<InteresAcademico> getIntereses() {
        return intereses;
    }

    public void setIntereses(List<InteresAcademico> intereses) {
        this.intereses = intereses;
    }

    public Usuario getUsuario() {
        return this.usuario;
    }

    public void setUsuario(Usuario user) {
        this.usuario = user;
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
    
    public List<Asesorar> getAsesorar() {
        return this.asesorar;
    }
    
    public void setAsesorar(List<Asesorar> asesorar) {
        this.asesorar = asesorar;
    }     

}
