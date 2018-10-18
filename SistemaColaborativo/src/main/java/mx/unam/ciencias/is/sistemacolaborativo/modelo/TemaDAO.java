/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.modelo;

import java.util.List;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Tema;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class TemaDAO {
    
    /*Sesion para conectarnos a la base de datos*/
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void guardar(Tema tema) {
        //se inicia la sesion
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //guardamos el Tema
            session.persist(tema);
           
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
     * Elimina el Tema de la base de datos
     * @param tema el Tema a eliminar
     */
    public void eliminar(Tema tema) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //eliminamos el Tema
            session.delete(tema);
           
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
     * Actualiza el Tema en la base de datos
     * @param tema con los nuevos valores 
     */
    public void actualizar(Tema tema) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //actualizar el Tema
            session.update(tema);
           
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
     * Regresa la lista de todos los Temas en la base de datos
     * @return la lista que contiene a todos los Temas de la base de datos
     */
    public List<Tema> getTemas(){
        List<Tema> result= null;
        Session session = sessionFactory.openSession();
        Transaction tx=null;
        try{
            tx=session.beginTransaction();
            String hql= "FROM Tema";
            Query query =session.createQuery(hql);
            result=(List<Tema>)query.list();
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
    
    
       public Tema getTema(int idTema) {
        Tema result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try{
            tx = s.beginTransaction();
            String hql = "FROM Tema WHERE idTema = :idTema";                  
            Query query = s.createQuery(hql);
            query.setParameter("idTema",idTema);
            result = (Tema)query.uniqueResult();
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
