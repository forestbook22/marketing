package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "threecs")
@NamedQueries({
    @NamedQuery(
            name = "getAllThreecs",
            query = "SELECT t FROM Threec AS t WHERE t.delete_flag = 0 AND t.show_flag = 0 ORDER BY t.id DESC"
            ),
    @NamedQuery(
            name = "getThreecsCount",
            query = "SELECT COUNT(t) FROM Threec AS t WHERE t.delete_flag = 0 AND t.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllThreecs",
            query = "SELECT t FROM Threec AS t WHERE t.user = :user AND t.title = :title"
            ),
    @NamedQuery(
            name = "getMyThreecsCount",
            query = "SELECT COUNT(t) FROM Threec AS t WHERE t.user = :user AND t.title = :title"
            )
})
@Entity
public class Threec extends Framework {

    @Lob
    @Column(name = "cus", nullable = false)
    private String cus;

    @Lob
    @Column(name = "own", nullable = false)
    private String own;

    @Lob
    @Column(name = "compe", nullable = false)
    private String compe;

    public String getCus() {
        return cus;
    }

    public void setCus(String cus) {
        this.cus = cus;
    }

    public String getOwn() {
        return own;
    }

    public void setOwn(String own) {
        this.own = own;
    }

    public String getCompe() {
        return compe;
    }

    public void setCompe(String compe) {
        this.compe = compe;
    }
}