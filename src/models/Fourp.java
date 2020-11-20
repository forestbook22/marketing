package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "fourps")
@NamedQueries({
    @NamedQuery(
            name = "getAllFourps",
            query = "SELECT f FROM Fourp AS f ORDER BY f.id DESC"
            ),
    @NamedQuery(
            name = "getFourpsCount",
            query = "SELECT COUNT(f) FROM Fourp AS f"
            ),
    @NamedQuery(
            name = "getMyAllFourps",
            query = "SELECT f FROM Fourp AS f WHERE f.user = :user ORDER BY f.id DESC"
            ),
    @NamedQuery(
            name = "getMyForpsCount",
            query = "SELECT COUNT(f) FROM Fourp AS f WHERE f.user = :user"
            )
})
@Entity
public class Fourp {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private User user;

    @Column(name = "fourp_date", nullable = false)
    private Date fourp_date;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "product", nullable = false)
    private String product;

    @Lob
    @Column(name = "price", nullable = false)
    private String price;

    @Lob
    @Column(name = "place", nullable = false)
    private String place;

    @Lob
    @Column(name = "promotion", nullable = false)
    private String promotion;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getFourp_date() {
        return fourp_date;
    }

    public void setFourp_date(Date fourp_date) {
        this.fourp_date = fourp_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}