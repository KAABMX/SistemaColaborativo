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
@Table (name="Profesor")
public class Profesor {
@Id@OneToOne
@JoinColumn(name="fk_id_usuario")
private Usuario usuario;
 private int fk_id_usuario;
@Column(name="pk_id_profesor")
 private int pk_id_profesor;
@Column(name="costo_x_hora")
 private String costo_x_hora;
@Column(name="niveles_educativos")
 private String niveles_educativos;
@Column(name="habilidades")
 private String habilidades;

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public int getFk_id_usuario() {
        return fk_id_usuario;
    }

    public void setFk_id_usuario(int fk_id_usuario) {
        this.fk_id_usuario = fk_id_usuario;
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

    public String getNiveles_educativos() {
        return niveles_educativos;
    }

    public void setNiveles_educativos(String niveles_educativos) {
        this.niveles_educativos = niveles_educativos;
    }

    public String getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(String habilidades) {
        this.habilidades = habilidades;
    }


    
}
