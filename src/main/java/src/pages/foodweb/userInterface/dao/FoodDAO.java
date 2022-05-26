package src.pages.foodweb.userInterface.dao;

import model.Food;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class FoodDAO {

    public Food getFood(long id) {

        Transaction transaction = null;
        Food food = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            // start a transaction
            transaction = session.beginTransaction();

            // get an user object
            food = session.get(Food.class, id);

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return food;
    }


    public List<Food> listAllFood() {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("From Food").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Food> list8Food() {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("From Food").setMaxResults(8).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Food> getNext8Food(int amount) {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("From Food").setFirstResult(amount).setMaxResults(8).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Food> getListFoodByCate(int cateId) {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("FROM Food where catalog = " + "'" + cateId + "'").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Food> getList8FoodByCate(int cateId) {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("FROM Food where catalog = " + "'" + cateId + "'").setMaxResults(8).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Food> getNext8FoodByCate(int amount, int cateId) {
        try {
            return HibernateUtil.getSessionFactory().openSession().createQuery("FROM Food where catalog = " + "'" + cateId + "'").setFirstResult(amount).setMaxResults(8).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

