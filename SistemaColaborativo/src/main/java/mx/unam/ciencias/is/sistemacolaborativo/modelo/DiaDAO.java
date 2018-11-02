/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.modelo;

import java.util.List;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Dia;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class DiaDAO {
    
    /*Sesion para conectarnos a la base de datos*/
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void guardar(Dia dia) {
        //se inicia la sesion
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //guardamos el Dia
            session.persist(dia);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        } finally {
            //cerramos simpre la sesion
            session.close();
        }
    }
        
        
            /**
     * Elimina el Dia de la base de datos
     * @param dia el Dia a eliminar
     */
    public void eliminar(Dia dia) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //eliminamos el Dia
            session.delete(dia);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos siempre la sesion
            session.close();
        }
    }
    
    
    
    
    /**
     * Actualiza el Dia en la base de datos
     * @param dia con los nuevos valores 
     */
    public void actualizar(Dia dia) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //actualizar el Dia
            session.update(dia);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos siempre la sesion
            session.close();
        }
}
    
    
        /**
     * Regresa la lista de todos los Dias en la base de datos
     * @return la lista que contiene a todos los Dias de la base de datos
     */
    public List<Dia> getDias(){
        List<Dia> result= null;
        Session session = sessionFactory.openSession();
        Transaction tx=null;
        try{
            tx=session.beginTransaction();
            String hql= "FROM Dia";
            Query query =session.createQuery(hql);
            result=(List<Dia>)query.list();
            tx.commit();
        }catch (Exception e){
            if(tx != null)
                tx.rollback();
            e.printStackTrace();      
        }finally{
            session.close();
        }
        return result;
    }
    
    
       public Dia getDia(int idDia) {
        Dia result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try{
            tx = s.beginTransaction();
            String hql = "FROM Dia WHERE idDia = :idDia";                  
            Query query = s.createQuery(hql);
            query.setParameter("idDia",idDia);
            result = (Dia)query.uniqueResult();
            tx.commit();
        }catch(Exception e){
            if(tx != null)
                tx.rollback();
            e.printStackTrace();
        }finally{
            s.close();
        }
        return result;
    }
       
          
    
}
