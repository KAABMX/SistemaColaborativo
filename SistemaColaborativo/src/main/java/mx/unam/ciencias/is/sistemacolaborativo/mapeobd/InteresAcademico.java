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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author hectorsama
 */
@Entity
@Table (name="Interes_academico")
public class InteresAcademico {
@Id@GeneratedValue(strategy =GenerationType.IDENTITY )
@Column(name="pk_id_interes")
 private int pk_id_interes;
@ManyToOne
@JoinColumn(name="fk_id_alumno")
 private Alumno alumno;
@Column(name="interes")
 private String interes;

    public int getPk_id_interes() {
        return pk_id_interes;
    }

    public void setPk_id_interes(int pk_id_interes) {
        this.pk_id_interes = pk_id_interes;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }


    public String getInteres() {
        return interes;
    }

    public void setInteres(String interes) {
        this.interes = interes;
    }


    
}
