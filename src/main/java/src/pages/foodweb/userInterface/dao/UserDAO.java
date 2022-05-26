package src.pages.foodweb.userInterface.dao;

import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.UUID;

public class UserDAO {
    public static boolean insertUser(User user){
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.getTransaction().begin();
            session.save(user);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static User checkEmail(String email) {
        User user = null;
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.getTransaction().begin();
            String hql = "from User where email= :e";
            Query query = session.createQuery(hql);
            query.setParameter("e", email);
            user = (User)  query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static User login(String email, String pass) {
        User user = null;
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.getTransaction().begin();
            String hql = "from User where email= :e and password = :p";
            Query query = session.createQuery(hql);
            query.setParameter("e", email);
            query.setParameter("p", pass);
            user = (User)  query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static void update(UUID uuid,String name,String phone,String address){
        try{
            Session session= HibernateUtil.getSessionFactory().openSession();
            session.getTransaction().begin();
            User user=session.get(User.class,uuid);
            user.setAddress(address);
            user.setPhone(phone);
            user.setName(name);
            session.save(user);
            session.getTransaction().commit();
        }
        catch (HibernateException ex){
            ex.printStackTrace();
        }
    }

    public static void reset(User user, String pass) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.getTransaction().begin();
            user.setPassword(pass);
            session.update(user);
            session.getTransaction().commit();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
