import model.Food;
import model.OrderDetails;
import model.Orders;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class demo {
    public static void main(String[] args) {
        //Không chạy demo này !!!
//        StandardServiceRegistry registry
//                =new StandardServiceRegistryBuilder()
//                .configure()
//                .build();
//        SessionFactory factory
//                =new MetadataSources(registry)
//                .buildMetadata()
//                .buildSessionFactory();
//
//        Session session=factory.openSession();
//        session.getTransaction().begin();
//        Food food1=new Food("Banh trang","Gion tan",5000);
//        session.save(food1);
//        User user1=new User("khanh");
//        session.save(user1);
//        Orders orders=new Orders(user1.getId());
//        OrderDetails orderDetails1=new OrderDetails(food1,orders,10,5000);
//        orders.addOrderDetail(orderDetails1);
//        session.save(orders);
//        session.getTransaction().commit();
//        session.close();
//        factory.close();
    }
}
