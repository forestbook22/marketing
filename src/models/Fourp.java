package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "fourps")
@NamedQueries({
    @NamedQuery(
            name = "getAllFourps",
            query = "SELECT f FROM Fourp AS f WHERE f.show_flag = 0 ORDER BY f.id DESC "
            ),
    @NamedQuery(
            name = "getFourpsCount",
            query = "SELECT COUNT(f) FROM Fourp AS f WHERE f.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllFourps",
            query = "SELECT f FROM Fourp AS f WHERE f.user = :user AND f.title = :title"
            ),
    @NamedQuery(
            name = "getMyFourpsCount",
            query = "SELECT COUNT(f) FROM Fourp AS f WHERE f.user = :user AND f.title = :title"
            )
})
@Entity
public class Fourp extends Framework {

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
}