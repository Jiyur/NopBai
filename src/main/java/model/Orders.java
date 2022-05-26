package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;


@Entity
@Table(name = "oders")
public class Orders implements Serializable {
    @Id
    @Column(name = "order_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "customer_id")
    private UUID customer_id;



    private Date created_at;
    private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Orders(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UUID getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(UUID customer_id) {
        this.customer_id = customer_id;
    }


    public Set<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(Set<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL)
    private Set<OrderDetails> orderDetails=new HashSet<>();

    public void addOrderDetail(OrderDetails orderDetails){
        this.orderDetails.add(orderDetails);

    }

    public Orders(UUID customer_id) {
        this.customer_id = customer_id;
    }

    public Orders(UUID customer_id, Date created_at) {
        this.customer_id = customer_id;
        this.created_at = created_at;
    }
    public Orders(UUID customer_id, Date created_at,int total) {
        this.customer_id = customer_id;
        this.created_at = created_at;
        this.total=total;
    }
}
