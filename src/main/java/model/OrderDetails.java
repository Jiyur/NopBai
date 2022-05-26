package model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "order_details")
public class OrderDetails implements Serializable {
    @Id
    @Column(name="order_detail_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "f_id")
    private Food food;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Orders order;


    private int qty;
    private float subtotal;
    private boolean status;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public OrderDetails()
    {

    }

    public OrderDetails(Food food, Orders order, int qty, float subtotal) {
        this.food = food;
        this.order = order;
        this.qty = qty;
        this.subtotal = subtotal;
    }
    public OrderDetails(Food food,int qty,float subtotal){
        this.food=food;
        this.qty=qty;
        this.subtotal=subtotal;
    }
}
