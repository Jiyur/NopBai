package src.pages.foodweb.userInterface.dao.admin;

import model.Catalog;
import model.Food;
import model.Gallerie;
import model.User;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class FoodDAO {
    private final static SessionFactory factory = HibernateUtil.getSessionFactory();

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


    public static List<Food> listAllFood() {
        Transaction transaction = null;
        List<Food> listFood = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an cate object

            listFood = session.createQuery("FROM Food").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listFood;
    }

    public static void delete(long fid){
        try{
            Session session=factory.openSession();
            session.getTransaction().begin();
            Food food=session.get(Food.class,fid);
            if (food!=null){
                session.delete(food);
                System.out.println("Food deleted");
            } else  {
                System.out.println("Error deleted");
            }
            session.getTransaction().commit();
            session.close();
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public static void saveFood(Food food, Gallerie gallerie) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            session.getTransaction().begin();
            // save the food object
            session.save(food);
            session.persist(gallerie);

            // commit transaction
            session.getTransaction().commit();
            session.close();
        }  catch (HibernateException e){
            e.printStackTrace();
        }
    }

    public static void updateFood(long id, String desciprtion, String name, float price) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            Food food = session.get(Food.class,id);
            if(food != null) {
                if(!Objects.equals(desciprtion, "")) {
                    food.setDesciprtion(desciprtion);
                }
                if(!Objects.equals(name, "")) {
                    food.setF_name(name);
                }
                if(price != 0) {
                    food.setPrice(price);
                }
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

    public static void updateImg(long id, String url) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            Gallerie gallerie = session.get(Gallerie.class, id);
            if(gallerie != null) {
                if(!Objects.equals(url, "")) {
                    gallerie.setImg_url(url);
                }

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
    public static void addImg(Gallerie gallerie) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            session.getTransaction().begin();
            // save the food object
            session.save(gallerie);

            // commit transaction
            session.getTransaction().commit();
            session.close();

        } catch (HibernateException e){
            e.printStackTrace();
        }
    }
}

