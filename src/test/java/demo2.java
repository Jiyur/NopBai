import model.Food;
import model.Orders;
import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;
import util.HibernateUtil2;

import java.util.List;

public class demo2 {
    public static void main(String[] args) {
        try{
            Session session
                    = HibernateUtil2
                    .getSessionFactory()
                    .openSession();

//            int cateId = 1;
//            Query<Food> query=session.createQuery("FROM Food where catalog = " + "'" + cateId + "'");
//            List<Food> list=query.list();
//            list.forEach(c->System.out.println(c.getF_name()));

//            String cateId = "1";
//            EntityManager em = HibernateUtil.getSessionFactory().createEntityManager();
//            String qString = "FROM Food f WHERE f.catalog = :cateId";
//            List<Food> q = em.createQuery(qString, Food.class).getResultList();
////            q.se.setParameter("cateId", cateId);
//            q.forEach(c->System.out.println(c.getF_name()));


            List<Food> listFood;
            listFood =  HibernateUtil.getSessionFactory().openSession().createQuery("From Food").setFirstResult(16).setMaxResults(8).getResultList();
            listFood.forEach(c->System.out.println(c.getF_name() + c.getDesciprtion() + c.getPriceCurrencyFormat() + c.getGalleries().get(0).getImg_url()));

            session.close();
        }
        catch (HibernateException e){
            throw e;
        }
    }
}
