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

    @Column(name = "real1", nullable = false)
    private Integer real1;

    @Column(name = "rate1", nullable = false)
    private Integer rate1;

    @Column(name = "rank1", nullable = false)
    private Integer rank1;

    @Column(name = "reach1", nullable = false)
    private Integer reach1;

    @Column(name = "rival1", nullable = false)
    private Integer rival1;

    @Column(name = "response1", nullable = false)
    private Integer response1;

    @Column(name = "real2", nullable = false)
    private Integer real2;

    @Column(name = "rate2", nullable = false)
    private Integer rate2;

    @Column(name = "rank2", nullable = false)
    private Integer rank2;

    @Column(name = "reach2", nullable = false)
    private Integer reach2;

    @Column(name = "rival2", nullable = false)
    private Integer rival2;

    @Column(name = "response2", nullable = false)
    private Integer response2;

    @Column(name = "real3", nullable = false)
    private Integer real3;

    @Column(name = "rate3", nullable = false)
    private Integer rate3;

    @Column(name = "rank3", nullable = false)
    private Integer rank3;

    @Column(name = "reach3", nullable = false)
    private Integer reach3;

    @Column(name = "rival3", nullable = false)
    private Integer rival3;

    @Column(name = "response3", nullable = false)
    private Integer response3;

    @Column(name = "real4", nullable = false)
    private Integer real4;

    @Column(name = "rate4", nullable = false)
    private Integer rate4;

    @Column(name = "rank4", nullable = false)
    private Integer rank4;

    @Column(name = "reach4", nullable = false)
    private Integer reach4;

    @Column(name = "rival4", nullable = false)
    private Integer rival4;

    @Column(name = "response4", nullable = false)
    private Integer response4;

    @Column(name = "choice", nullable = false)
    private Integer choice;

    public Integer getReal1() {
        return real1;
    }

    public void setReal1(Integer real1) {
        this.real1 = real1;
    }

    public Integer getRate1() {
        return rate1;
    }

    public void setRate1(Integer rate1) {
        this.rate1 = rate1;
    }

    public Integer getRank1() {
        return rank1;
    }

    public void setRank1(Integer rank1) {
        this.rank1 = rank1;
    }

    public Integer getReach1() {
        return reach1;
    }

    public void setReach1(Integer reach1) {
        this.reach1 = reach1;
    }

    public Integer getRival1() {
        return rival1;
    }

    public void setRival1(Integer rival1) {
        this.rival1 = rival1;
    }

    public Integer getResponse1() {
        return response1;
    }

    public void setResponse1(Integer response1) {
        this.response1 = response1;
    }

    public Integer getReal2() {
        return real2;
    }

    public void setReal2(Integer real2) {
        this.real2 = real2;
    }

    public Integer getRate2() {
        return rate2;
    }

    public void setRate2(Integer rate2) {
        this.rate2 = rate2;
    }

    public Integer getRank2() {
        return rank2;
    }

    public void setRank2(Integer rank2) {
        this.rank2 = rank2;
    }

    public Integer getReach2() {
        return reach2;
    }

    public void setReach2(Integer reach2) {
        this.reach2 = reach2;
    }

    public Integer getRival2() {
        return rival2;
    }

    public void setRival2(Integer rival2) {
        this.rival2 = rival2;
    }

    public Integer getResponse2() {
        return response2;
    }

    public void setResponse2(Integer response2) {
        this.response2 = response2;
    }

    public Integer getReal3() {
        return real3;
    }

    public void setReal3(Integer real3) {
        this.real3 = real3;
    }

    public Integer getRate3() {
        return rate3;
    }

    public void setRate3(Integer rate3) {
        this.rate3 = rate3;
    }

    public Integer getRank3() {
        return rank3;
    }

    public void setRank3(Integer rank3) {
        this.rank3 = rank3;
    }

    public Integer getReach3() {
        return reach3;
    }

    public void setReach3(Integer reach3) {
        this.reach3 = reach3;
    }

    public Integer getRival3() {
        return rival3;
    }

    public void setRival3(Integer rival3) {
        this.rival3 = rival3;
    }

    public Integer getResponse3() {
        return response3;
    }

    public void setResponse3(Integer response3) {
        this.response3 = response3;
    }

    public Integer getReal4() {
        return real4;
    }

    public void setReal4(Integer real4) {
        this.real4 = real4;
    }

    public Integer getRate4() {
        return rate4;
    }

    public void setRate4(Integer rate4) {
        this.rate4 = rate4;
    }

    public Integer getRank4() {
        return rank4;
    }

    public void setRank4(Integer rank4) {
        this.rank4 = rank4;
    }

    public Integer getReach4() {
        return reach4;
    }

    public void setReach4(Integer reach4) {
        this.reach4 = reach4;
    }

    public Integer getRival4() {
        return rival4;
    }

    public void setRival4(Integer rival4) {
        this.rival4 = rival4;
    }

    public Integer getResponse4() {
        return response4;
    }

    public void setResponse4(Integer response4) {
        this.response4 = response4;
    }

    public Integer getChoice() {
        return choice;
    }

    public void setChoice(Integer choice) {
        this.choice = choice;
    }


}
