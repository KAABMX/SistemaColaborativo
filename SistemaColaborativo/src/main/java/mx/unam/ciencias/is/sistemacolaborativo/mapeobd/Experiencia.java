/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.mapeobd;

import java.util.Date;
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
 * @author Moctezuma19, luis
 */
@Entity
@Table(name = "Experiencia")
public class Experiencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pk_id_experiencia")
    private int pk_id_cv;
    @OneToOne
    @JoinColumn(name = "fk_id_cv")
    private Curriculum curriculum;
    @Column(name = "fecha_inicio")
    private Date fecha_inicio;
    @Column(name = "fecha_fin")
    private Date fecha_fin;
    @Column(name = "empresa")
    private String empresa;
    @Column(name = "funcion_trabajo")
    private String funcion_trabajo;
    @Column(name = "tarea_trabajo")
    private String tarea_trabajo;

    public int getPk_id_cv() {
        return pk_id_cv;
    }

    public void setPk_id_cv(int pk_id_cv) {
        this.pk_id_cv = pk_id_cv;
    }

    public Curriculum getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(Curriculum curriculum) {
        this.curriculum = curriculum;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getFuncion_trabajo() {
        return funcion_trabajo;
    }

    public void setFuncion_trabajo(String funcion_trabajo) {
        this.funcion_trabajo = funcion_trabajo;
    }

    public String getTarea_trabajo() {
        return tarea_trabajo;
    }

    public void setTarea_trabajo(String tarea_trabajo) {
        this.tarea_trabajo = tarea_trabajo;
    }
    
    
}
