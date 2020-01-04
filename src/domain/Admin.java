package domain;

import java.io.Serializable;

/**
 * @Author: 李旺旺
 * @Date: 2019/12/30 15:04
 * @Description: 管理员信息类
 */
public class Admin implements Serializable {

    private String account;
    private String password;

    public Admin(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public Admin() {
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "account='" + account + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
