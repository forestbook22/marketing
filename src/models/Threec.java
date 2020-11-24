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

@Table(name = "threecs")
@NamedQueries({
    @NamedQuery(
            name = "getAllThreecs",
            query = "SELECT t FROM Threec AS t ORDER BY t.id DESC"
            ),
    @NamedQuery(
            name = "getThreecsCount",
            query = "SELECT COUNT(f) FROM Threec AS f"
            ),
    @NamedQuery(
            name = "getMyAllThreecs",
            query = "SELECT t FROM Threec AS t WHERE t.user = :user ORDER BY t.id DESC"
            ),
    @NamedQuery(
            name = "getMyThreecsCount",
            query = "SELECT COUNT(t) FROM Threec AS t WHERE t.user = :user"
            )
})
@Entity
public class Threec {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "threec_date", nullable = false)
    private Date threec_date;

    @Column(name = "frame", nullable = false)
    private String frame;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "cus", nullable = false)
    private String cus;

    @Lob
    @Column(name = "own", nullable = false)
    private String own;

    @Lob
    @Column(name = "compe", nullable = false)
    private String compe;

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


    public String getFrame() {
        return frame;
    }

    public void setFrame(String frame) {
        this.frame = frame;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getThreec_date() {
        return threec_date;
    }

    public void setThreec_date(Date threec_date) {
        this.threec_date = threec_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

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