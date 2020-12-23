package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "swots")
@NamedQueries({
    @NamedQuery(
            name = "getAllSwots",
            query = "SELECT s FROM Swot AS s WHERE s.delete_flag = 0 AND s.show_flag = 0 ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "getSwotsCount",
            query = "SELECT COUNT(s) FROM Swot AS s WHERE s.delete_flag = 0 AND s.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllSwots",
            query = "SELECT s FROM Swot AS s WHERE s.user = :user AND s.title = :title"
            ),
    @NamedQuery(
            name = "getMySwotsCount",
            query = "SELECT COUNT(s) FROM Swot AS s WHERE s.user = :user "
            )
})
@Entity
public class Swot extends Framework{

    @Lob
    @Column(name = "strong", nullable = false)
    private String strong;

    @Lob
    @Column(name = "weak", nullable = false)
    private String weak;

    @Lob
    @Column(name = "opp", nullable = false)
    private String opp;

    @Lob
    @Column(name = "thre", nullable = false)
    private String thre;

    public String getStrong() {
        return strong;
    }

    public void setStrong(String strong) {
        this.strong = strong;
    }

    public String getWeak() {
        return weak;
    }

    public void setWeak(String weak) {
        this.weak = weak;
    }

    public String getOpp() {
        return opp;
    }

    public void setOpp(String opp) {
        this.opp = opp;
    }

    public String getThre() {
        return thre;
    }

    public void setThre(String thre) {
        this.thre = thre;
    }
}