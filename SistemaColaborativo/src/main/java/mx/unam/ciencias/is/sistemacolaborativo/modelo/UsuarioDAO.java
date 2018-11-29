/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.sistemacolaborativo.modelo;

import java.util.List;
import mx.unam.ciencias.is.sistemacolaborativo.mapeobd.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author hectorsama
 */
public class UsuarioDAO {

    /*Sesion para conectarnos a la base de datos*/
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void guardar(Usuario usuario) {
        //se inicia la sesion
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //guardamos el usuario
            session.persist(usuario);

            tx.commit();
        } catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            //cerramos simpre la sesion
            session.close();
        }
    }

    /**
     * Elimina el usuario de la base de datos
     *
     * @param usuario el usuario a eliminar
     */
    public void eliminar(Usuario usuario) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //eliminamos el usuario
            session.delete(usuario);

            tx.commit();
        } catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            //cerramos siempre la sesion
            session.close();
        }
    }

    /**
     * Actualiza el usuario en la base de datos
     *
     * @param usuario con los nuevos valores
     */
    public void actualizar(Usuario usuario) {
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //actualizar el usuario
            session.update(usuario);

            tx.commit();
        } catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            //cerramos siempre la sesion
            session.close();
        }
    }

    /**
     * Regresa la lista de todos los usuarios en la base de datos
     *
     * @return la lista que contiene a todos los usuarios de la base de datos
     */
    public List<Usuario> getUsuarios() {
        List<Usuario> result = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Usuario";
            Query query = session.createQuery(hql);
            result = (List<Usuario>) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    public Usuario getUsuario(String correo) {
        Usuario result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            String hql = "FROM Usuario WHERE correo = :correo";
            Query query = s.createQuery(hql);
            query.setParameter("correo", correo);
            result = (Usuario) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            s.close();
        }
        return result;
    }

    public Usuario getUsuario(int pk_id_usuario) {
        Usuario result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            String hql = "FROM Usuario WHERE pk_id_usuario = :pk_id_usuario";
            Query query = s.createQuery(hql);
            query.setParameter("pk_id_usuario", pk_id_usuario);
            result = (Usuario) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            s.close();
        }
        return result;
    }
    
    public Usuario getUsuario(String nombre, String paterno, String materno){
        Usuario result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            String hql = "FROM Usuario WHERE nombre = :nombre AND apellido_p = :apellido_p AND apellido_m = :apellido_m";
            Query query = s.createQuery(hql);
            query.setParameter("nombre",nombre);
            query.setParameter("apellido_p",paterno);
            query.setParameter("apellido_m",materno);
            result = (Usuario) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            s.close();
        }
        return result;        
    }
    
    public List<Usuario> getUsuarios(String nombre, String apellido){
        List<Usuario> result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            String hql = "FROM Usuario WHERE nombre = :nombre AND apellido_p = "
                    + ":apellido OR apellido_m = :apellido";
            Query query = s.createQuery(hql);
            query.setParameter("nombre",nombre);
            query.setParameter("apellido",apellido);
            result = (List<Usuario>) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            s.close();
        }
        return result;        
    }
    public List<Usuario> getUsuarios(String apellido){
        List<Usuario> result = null;
        Session s = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            String hql = "FROM Usuario WHERE apellido_p = :apellido OR apellido_m = :apellido";
            Query query = s.createQuery(hql);
            query.setParameter("apellido",apellido);
            result = (List<Usuario>) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            s.close();
        }
        return result;        
    }
}
