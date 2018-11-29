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
@Table(name = "Estudios")
public class Estudios {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pk_id_estudios")
    private int pk_id_estudios;
    @OneToOne
    @JoinColumn(name = "fk_id_cv")
    private Curriculum curriculum;
    @Column(name = "estudio")
    private String estudio;
    @Column(name = "universidad")
    private String universidad;

    public int getPk_id_estudios() {
        return pk_id_estudios;
    }

    public void setPk_id_estudios(int pk_id_estudios) {
        this.pk_id_estudios = pk_id_estudios;
    }

    public Curriculum getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(Curriculum curriculum) {
        this.curriculum = curriculum;
    }

    public String getEstudio() {
        return estudio;
    }

    public void setEstudio(String estudio) {
        this.estudio = estudio;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }
    
    

}
