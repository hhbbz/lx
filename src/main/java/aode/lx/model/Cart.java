package aode.lx.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 黄柏樟 on 2015/7/15.
 * @Explain:
 */
@Entity
@Table(name="cart")
public class Cart {
    @Id
    @GeneratedValue
    private Long id;
    /*用户*/
    @Column(unique = true)
    private String loginName;
    /*产品*/
    @OneToMany(mappedBy = "cart",cascade = { CascadeType.ALL },fetch=FetchType.EAGER)
    private List<MemberProduct> memberProduct = new ArrayList<MemberProduct>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }


    public List<MemberProduct> getMemberProduct() {
        return memberProduct;
    }

    public void setMemberProduct(List<MemberProduct> memberProduct) {
        this.memberProduct = memberProduct;
    }
}
