package src.pages.foodweb.userInterface.dao.admin;

import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;
import java.util.UUID;

public class UserDao {
    private final static SessionFactory factory = HibernateUtil.getSessionFactory();
    public static List<User> getAllUser() {

        Transaction transaction = null;
        List<User> listUser = null;
        try (Session session = factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an cate object

            listUser = session.createQuery("FROM User ").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listUser;
    }
    public static void delete(UUID id){
        try(Session session=factory.openSession()){
            session.beginTransaction();
            User user=session.get(User.class,id);
            if(user!=null){
                session.delete(user);
                System.out.println("user deleted");
            }
            session.getTransaction().commit();
            session.close();
        }
        catch (Exception e) {

            e.printStackTrace();
        }
    }
    public static void insert(User user){
        try{
            Session session=factory.openSession();
            session.getTransaction().begin();
            if(user!=null){
                session.persist(user);
                System.out.println("User inserted");
            }
            session.getTransaction().commit();
            session.close();
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
    }
    public static void update(UUID uuid,String email,String name,String phone,String address){
        try(Session session=factory.openSession()){
            session.beginTransaction();
            User user=session.get(User.class,uuid);
            if(user!=null){
                user.setPhone(phone);
                user.setName(name);
                user.setAddress(address);
                user.setEmail(email);
                if(user.getRole()==null){
                    user.setRole("member");
                }
                System.out.println("User updated");
            }
            session.getTransaction().commit();
            session.close();
        }
        catch (Exception e) {

            e.printStackTrace();
        }


    }
}
