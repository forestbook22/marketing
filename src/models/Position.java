package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "positions")
@NamedQueries({
    @NamedQuery(
            name = "getAllPositions",
            query = "SELECT po FROM Position AS po WHERE po.show_flag = 0 ORDER BY po.id DESC "
            ),
    @NamedQuery(
            name = "getPositionsCount",
            query = "SELECT COUNT(po) FROM Position AS po WHERE po.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllPositions",
            query = "SELECT po FROM Position AS po WHERE po.user = :user AND po.title = :title"
            ),
    @NamedQuery(
            name = "getMyPositionsCount",
            query = "SELECT COUNT(po) FROM Position AS po WHERE po.user = :user AND po.title = :title"
            )
})
@Entity
public class Position extends Framework {

    @Lob
    @Column(name = "attri", nullable = false)
    private String attri;

    @Lob
    @Column(name = "distance", nullable = false)
    private String distance;

    @Lob
    @Column(name = "benefit", nullable = false)
    private String benefit;

    @Lob
    @Column(name = "opp", nullable = false)
    private String opp;

    @Lob
    @Column(name = "relation", nullable = false)
    private String relation;

    @Lob
    @Column(name = "kind", nullable = false)
    private String kind;

    @Lob
    @Column(name = "x", nullable = false)
    private String x;

    @Lob
    @Column(name = "y", nullable = false)
    private String y;

    @Lob
    @Column(name = "x1", nullable = false)
    private String x1;

    @Lob
    @Column(name = "x2", nullable = false)
    private String x2;

    @Lob
    @Column(name = "y1", nullable = false)
    private String y1;

    @Lob
    @Column(name = "y2", nullable = false)
    private String y2;

    public String getAttri() {
        return attri;
    }

    public void setAttri(String attri) {
        this.attri = attri;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getBenefit() {
        return benefit;
    }

    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }

    public String getOpp() {
        return opp;
    }

    public void setOpp(String opp) {
        this.opp = opp;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    public String getX1() {
        return x1;
    }

    public void setX1(String x1) {
        this.x1 = x1;
    }

    public String getX2() {
        return x2;
    }

    public void setX2(String x2) {
        this.x2 = x2;
    }

    public String getY1() {
        return y1;
    }

    public void setY1(String y1) {
        this.y1 = y1;
    }

    public String getY2() {
        return y2;
    }

    public void setY2(String y2) {
        this.y2 = y2;
    }
}