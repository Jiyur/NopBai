package src.pages.foodweb.userInterface.dao;

import model.OrderDetails;
import model.Orders;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import util.HibernateUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

public class OrderDAO  {
    private final static SessionFactory factory= HibernateUtil.getSessionFactory();
    public static void insert(Orders order){
        try{
            Session session=factory.openSession();
            session.beginTransaction();
            session.persist(order);
            session.getTransaction().commit();
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Orders> getInvoiceList(UUID id){
        try{
            Session session=factory.openSession();
            session.getTransaction();
            ArrayList<Orders> invoiceList=null;
            invoiceList= (ArrayList<Orders>) session.createQuery("FROM Orders WHERE customer_id="+"'"+id+"'").getResultList();
            return invoiceList;
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
        return null;
    }
    public static Set<OrderDetails> getInvoiceDetail(int id)
    {
        try{
            Session session=factory.openSession();
            session.getTransaction().begin();
            Orders orders=session.get(Orders.class,id);
            Set<OrderDetails> orderDetails=orders.getOrderDetails();
            session.getTransaction().commit();
            return orderDetails;
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
        return null;
    }
    public static int getTotal(int id){
        try{
            Session session=factory.openSession();
            session.beginTransaction();
            Orders order=session.get(Orders.class,id);
            int total=order.getTotal();
            return total;
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
        return 0;
    }
    public static Orders getOrder(int id){
        try{
            Session session=factory.openSession();
            session.beginTransaction();
            Orders order=session.get(Orders.class,id);
            return order;
        }
        catch (HibernateException e){
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        Set<OrderDetails> orderDetails=getInvoiceDetail(5);
        for (OrderDetails o:orderDetails
             ) {
            System.out.println(o.getFood().getF_name());
        }
    }
}
