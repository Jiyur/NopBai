package src.pages.foodweb.userInterface.dao.admin;

import model.Catalog;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

import org.hibernate.Transaction;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class CateDao {
    private final static SessionFactory factory = HibernateUtil.getSessionFactory();

    /**
     * Get all Cate
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Catalog> getAllCate() {

        Transaction transaction = null;
        List<Catalog> listCate = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an cate object

            listCate = session.createQuery("FROM Catalog").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listCate;
    }

    /**
     * Save User
     *
     * @param cate
     */
    public static void saveCate(Catalog cate) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the food object
            session.save(cate);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    /**
     * Update User
     *
     * @param id
     */
    public static void updateCate(long id, String url, String name, Date updatedAt) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            Catalog cate = session.get(Catalog.class,id);
            if(cate != null) {
              if(!Objects.equals(url, "")) {
                  cate.setCate_image(url);
              }
              if(!Objects.equals(name, "")) {
                    cate.setCate_name(name);
              }
              cate.setUpdated_at(updatedAt);
            }
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    /**
     * Delete User
     *
     * @param id
     */
    public static void deleteCate(long id) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            session.getTransaction().begin();
            // Delete a user object
            Catalog cate = session.get(Catalog.class, id);
            if (cate != null) {
                session.delete(cate);
                System.out.println("Cate is deleted");
            }

            // commit transaction
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
