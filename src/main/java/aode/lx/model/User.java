package aode.lx.model;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

/**
 *
 * @类说明: 用户实体类
 * @author 黄柏樟
 * @date 2015年6月1日
 */
@Entity
@Table(name="user")
public class User implements java.io.Serializable{
    private static final long serialVersionUID = -1527992188149515014L;
    @Id
    @GeneratedValue
    private Long id;
    @Pattern(regexp = "^[0-9a-z_A-Z\\u4e00-\\u9fa5]+$")
    @Length(max = 50)
    @Column(length = 50)
    private String name; //姓名

    @Pattern(regexp = "^[0-9a-z_A-Z\\u4e00-\\u9fa5]+$")
    @Length(min = 2, max = 20)
    @Column(nullable = false, updatable = true, unique = true, length = 100)
    private String loginName; // 登录名

    @Pattern(regexp = "^[^\\s&\"<>]+$")
    @Length(min = 4, max = 200)
    @Column(nullable = false)
    private String password; // 密码

    private String gender; // 性别

    private String phoneNumber; // 电话号码
    @Email
    @Length(max = 200)
    @Column(length = 200)
    private String email; // 电子邮件

    private String description; // 说明

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

}