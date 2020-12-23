package models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "pests")
@NamedQueries({
    @NamedQuery(
            name = "getAllPests",
            query = "SELECT p FROM Pest AS p WHERE p.delete_flag = 0 AND p.show_flag = 0 ORDER BY p.id DESC"
            ),
    @NamedQuery(
            name = "getPestsCount",
            query = "SELECT COUNT(p) FROM Pest AS p WHERE p.delete_flag = 0 AND p.show_flag = 0"
            ),
    @NamedQuery(
            name = "getMyAllPests",
            query = "SELECT p FROM Pest AS p WHERE p.user = :user AND p.title = :title"
            ),
    @NamedQuery(
            name = "getMyPestsCount",
            query = "SELECT COUNT(p) FROM Pest AS p WHERE p.user = :user "
            )
})
@Entity
public class Pest extends Framework {
    @Lob
    @Column(name = "poli", nullable = false)
    private String poli;

    @Lob
    @Column(name = "eco", nullable = false)
    private String eco;

    @Lob
    @Column(name = "soci", nullable = false)
    private String soci;

    @Lob
    @Column(name = "tech", nullable = false)
    private String tech;

    public String getPoli() {
        return poli;
    }

    public void setPoli(String poli) {
        this.poli = poli;
    }

    public String getEco() {
        return eco;
    }

    public void setEco(String eco) {
        this.eco = eco;
    }

    public String getSoci() {
        return soci;
    }

    public void setSoci(String soci) {
        this.soci = soci;
    }

    public String getTech() {
        return tech;
    }

    public void setTech(String tech) {
        this.tech = tech;
    }
}
