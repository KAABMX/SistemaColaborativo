/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.mapeobd;

/**
 *
 * @author hectorsama
 */
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Curriculum")
public class Curriculum {
@Id@GeneratedValue(strategy =GenerationType.IDENTITY)
@Column(name="pk_id_cv")
 private int pk_id_cv;
@Column(name="fk_id_profesor")
 private int fk_id_profesor;
@Column(name="lugar_de_nacimiento")
 private String lugar_de_nacimiento;

    public int getPk_id_cv() {
        return pk_id_cv;
    }

    public void setPk_id_cv(int pk_id_cv) {
        this.pk_id_cv = pk_id_cv;
    }

    public int getFk_id_profesor() {
        return fk_id_profesor;
    }

    public void setFk_id_profesor(int fk_id_profesor) {
        this.fk_id_profesor = fk_id_profesor;
    }

    public String getLugar_de_nacimiento() {
        return lugar_de_nacimiento;
    }

    public void setLugar_de_nacimiento(String lugar_de_nacimiento) {
        this.lugar_de_nacimiento = lugar_de_nacimiento;
    }


    
}
