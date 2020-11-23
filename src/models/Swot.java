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

@Table(name = "swots")
@NamedQueries({
    @NamedQuery(
            name = "getAllSwots",
            query = "SELECT s FROM Swot AS s ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "getSwotsCount",
            query = "SELECT COUNT(s) FROM Swot AS s"
            ),
    @NamedQuery(
            name = "getMyAllSwots",
            query = "SELECT s FROM Swot AS s WHERE s.user = :user ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "getMySwotsCount",
            query = "SELECT COUNT(s) FROM Swot AS s WHERE s.user = :user"
            )
})
@Entity
public class Swot {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "swot_date", nullable = false)
    private Date swot_date;

    @Column(name = "frame", nullable = false)
    private String frame;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

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

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column(name = "delete_flag", nullable = false)
    private Integer delete_flag;

    @Column(name = "show_flag", nullable = false)
    private Integer show_flag;

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

    public Date getSwot_date() {
        return swot_date;
    }

    public void setSwot_date(Date swot_date) {
        this.swot_date = swot_date;
    }

    public String getFrame() {
        return frame;
    }

    public void setFrame(String frame) {
        this.frame = frame;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

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

    public Integer getDelete_flag() {
        return delete_flag;
    }

    public void setDelete_flag(Integer delete_flag) {
        this.delete_flag = delete_flag;
    }

    public Integer getShow_flag() {
        return show_flag;
    }

    public void setShow_flag(Integer show_flag) {
        this.show_flag = show_flag;
    }
}