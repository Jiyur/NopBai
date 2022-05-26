package src.pages.foodweb.userInterface.dao;

import model.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class GallerieDAO {

    public Gallerie getGallerie(long id) {

        Transaction transaction = null;
        Gallerie gallerie = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            // start a transaction
            transaction = session.beginTransaction();

            // get an user object
            gallerie = session.get(Gallerie.class, id);

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return gallerie;
    }


    public List<Gallerie> listAllFood() {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("From Gallerie ").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}