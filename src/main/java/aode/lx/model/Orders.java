package aode.lx.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
*@author: 黄柏樟
*@date: 2015/6/29
*@explain:
*/
@Entity
@Table(name = "orders")
public class Orders {

    @Id
    @GeneratedValue
    private Long id;
    private String name;
    /*地址*/
    private String address;
    /*金额*/
    private String money;
    /*备注*/
    private String mark;
    /*下单时间*/
    private Date date;
    /*产品*/
    @OneToMany(mappedBy = "orders",cascade = { CascadeType.ALL },fetch = FetchType.EAGER)
    private List<MemberProductOrders> memberProductOrders = new ArrayList<MemberProductOrders>();
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public List<MemberProductOrders> getMemberProductOrders() {
        return memberProductOrders;
    }

    public void setMemberProductOrders(List<MemberProductOrders> memberProductOrders) {
        this.memberProductOrders = memberProductOrders;
    }
}
