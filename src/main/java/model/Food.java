package model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.text.NumberFormat;
import java.util.*;

@Entity
@Table(name = "foods")
public class Food implements Serializable {

    @Id
    @Column(name = "fid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long fid;

    private String desciprtion;

    private String f_name;

    private float price;

    public Food(){
        super();
        f_name = "";
        desciprtion = "";
        price = 0;
    }

    public Food(String f_name, String desciprtion, float price) {
        super();
        this.f_name = f_name;
        this.desciprtion = desciprtion;
        this.price = price;
    }

    public Food(long fid, String f_name, String desciprtion, float price) {
        super();
        this.fid = fid;
        this.f_name = f_name;
        this.desciprtion = desciprtion;
        this.price = price;
    }

    public long getFid() {
        return fid;
    }

    public void setFid(long fid) {
        this.fid = fid;
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    public String getDesciprtion() {
        return desciprtion;
    }

    public void setDesciprtion(String description) {
        this.desciprtion = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Catalog getCatalog() {
        return catalog;
    }

    public void setCatalog(Catalog catalog) {
        this.catalog = catalog;
    }

    public Set<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(Set<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

//    public Set<Gallerie> getGalleries() {
//        return galleries;
//    }
//
//    public void setGalleries(Set<Gallerie> galleries) {
//        this.galleries = galleries;
//    }
    public List<Gallerie> getGalleries() {
        return galleries;
    }

    public void setGalleries(List<Gallerie> galleries) {
        this.galleries = galleries;
    }

    @ManyToOne
    @JoinColumn(name = "cate_id", nullable = true)
    private Catalog catalog;

    @OneToMany(mappedBy = "food")
    private Set<OrderDetails> orderDetails=new HashSet<>();

//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "food")
//    private Set<Gallerie> galleries=new HashSet<>();

    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "food")
    private List<Gallerie> galleries = new ArrayList<>();

    public String getPriceCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);
        return currency.format(price);
    }
}
