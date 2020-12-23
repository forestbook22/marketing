package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "segs")
@NamedQueries({
    @NamedQuery(
            name = "getAllSegs",
            query = "SELECT se FROM Seg AS se WHERE se.delete_flag = 0 AND se.show_flag = 0 ORDER BY se.id DESC"
            ),
    @NamedQuery(
            name = "getSegsCount",
            query = "SELECT COUNT(se) FROM Seg AS se WHERE se.delete_flag = 0 AND se.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllSegs",
            query = "SELECT se FROM Seg AS se WHERE se.user = :user AND se.title = :title"
            ),
    @NamedQuery(
            name = "getMySegsCount",
            query = "SELECT COUNT(se) FROM Seg AS se WHERE se.user = :user "
            )
})
@Entity
public class Seg extends Framework{

    @Column(name = "y", nullable = false)
    private Integer y;

    @Column(name = "x", nullable = false)
    private Integer x;

    @Lob
    @Column(name = "one", nullable = false)
    private String one;

    @Lob
    @Column(name = "two", nullable = false)
    private String two;

    @Lob
    @Column(name = "three", nullable = false)
    private String three;

    @Lob
    @Column(name = "four", nullable = false)
    private String four;

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public String getOne() {
        return one;
    }

    public void setOne(String one) {
        this.one = one;
    }

    public String getTwo() {
        return two;
    }

    public void setTwo(String two) {
        this.two = two;
    }

    public String getThree() {
        return three;
    }

    public void setThree(String three) {
        this.three = three;
    }

    public String getFour() {
        return four;
    }

    public void setFour(String four) {
        this.four = four;
    }

}