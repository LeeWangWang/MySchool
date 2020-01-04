package domain;

import java.io.Serializable;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 22:14
 * @Description:
 */
public class SignUpUser implements Serializable {
    private String name;
    private String tele;
    private int age;
    private String sex;
    private String address;
    private String parentName;
    private String parentTele;
    private String coursesName;

    public SignUpUser(){

    }

    public SignUpUser(String name, String tele, int age, String sex, String address, String parentName, String parentTele, String coursesName) {
        this.name = name;
        this.tele = tele;
        this.age = age;
        this.sex = sex;
        this.address = address;
        this.parentName = parentName;
        this.parentTele = parentTele;
        this.coursesName = coursesName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getParentTele() {
        return parentTele;
    }

    public void setParentTele(String parentTele) {
        this.parentTele = parentTele;
    }

    public String getCoursesName() {
        return coursesName;
    }

    public void setCoursesName(String coursesName) {
        this.coursesName = coursesName;
    }

    @Override
    public String toString() {
        return "SignUpUser{" +
                "name='" + name + '\'' +
                ", tele='" + tele + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", parentName='" + parentName + '\'' +
                ", parentTele='" + parentTele + '\'' +
                ", coursesName='" + coursesName + '\'' +
                '}';
    }
}
