package aode.lx.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;

/**
 *@author: 黄柏樟
 *@date: 2015/6/19
 *@Explain:购物车商品
 */
@Entity
@Table(name="member_product")
public class MemberProduct {


    private String id;
    /*名称*/
    private String name;
    /*数量*/
    private String number;
    /*单价*/
    private String money;
    /*时间*/
    private Date date;
    /*单个产品总价*/
    private String total ;
/*    *//*订单*//*
    private Orders orders = new Orders();*/
    /*购物车*/
    private Cart cart = new Cart();

    @Id
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMoney() {
        return money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}

