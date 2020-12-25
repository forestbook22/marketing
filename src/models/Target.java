package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "targets")
@NamedQueries({
    @NamedQuery(
            name = "getAllTargets",
            query = "SELECT tar FROM Target AS tar WHERE tar.show_flag = 0 ORDER BY tar.id DESC"
            ),
    @NamedQuery(
            name = "getTargetsCount",
            query = "SELECT COUNT(tar) FROM Target AS tar WHERE tar.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllTargets",
            query = "SELECT tar FROM Target AS tar WHERE tar.user = :user AND tar.title = :title"
            ),
    @NamedQuery(
            name = "getMyTargetsCount",
            query = "SELECT COUNT(tar) FROM Target AS tar WHERE tar.user = :user "
            )
})
@Entity
public class Target extends Framework{

    @Column(name = "real", nullable = false)
    private Integer real;

    @Column(name = "rate", nullable = false)
    private Integer rate;

    @Column(name = "rank", nullable = false)
    private Integer rank;

    @Column(name = "reach", nullable = false)
    private Integer reach;

    @Column(name = "rival", nullable = false)
    private Integer rival;

    @Column(name = "response", nullable = false)
    private Integer response;

    public Integer getReal() {
        return real;
    }

    public void setReal(Integer real) {
        this.real = real;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getReach() {
        return reach;
    }

    public void setReach(Integer reach) {
        this.reach = reach;
    }

    public Integer getRival() {
        return rival;
    }

    public void setRival(Integer rival) {
        this.rival = rival;
    }

    public Integer getResponse() {
        return response;
    }

    public void setResponse(Integer response) {
        this.response = response;
    }
}
