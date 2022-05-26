package model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "catalogs")
public class Catalog implements Serializable {
    @Id
    @Column(name = "cata_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    public long getId() {
        return id;
    }
    public Catalog(){


    }
    public Catalog(long id, String cate_name, String cate_image, Date created_at, Date updated_at) {
        this.id = id;
        this.cate_name = cate_name;
        this.cate_image = cate_image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getCate_image() {
        return cate_image;
    }

    public void setCate_image(String cate_image) {
        this.cate_image = cate_image;
    }

    @Type(type="text")
    private String cate_name;
    @Type(type="text")
    private String cate_image;

    private Date created_at;
    private Date updated_at;

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "catalog")
    private Set<Food> listFood=new HashSet<>();

}
