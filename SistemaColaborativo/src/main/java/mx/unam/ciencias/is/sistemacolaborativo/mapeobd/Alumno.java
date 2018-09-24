/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.mapeobd;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author hectorsama
 */
@Entity
@Table (name="Alumno")
public class Alumno implements java.io.Serializable{
@Id
@OneToOne
@JoinColumn(name="fk_id_usuario")
private Usuario usuario;
@Column(name="pk_id_alumno")
 private int pk_id_alumno;
 @Column (name="ultimo_nivel_educativo")
 private String ultimo_nivel_educativo;

    public Usuario getUsuario(){
        return this.usuario;
    }
    public void setUsuario(Usuario user){
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
    
}
