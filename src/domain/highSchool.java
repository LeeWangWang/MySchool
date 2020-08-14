package domain;

public class highSchool {
    private String schoolName;
    private String website;
    private String intro;
    private String address;
    private String area;
    private String phone;

    public highSchool(){

    }
    public highSchool(String schoolName,String area){
        this.schoolName = schoolName;
        this.area = area;
    }
    public highSchool(String schoolName, String website, String intro, String address,String area) {
        this.schoolName = schoolName;
        this.website = website;
        this.intro = intro;
        this.address = address;
        this.area = area;
    }

    public highSchool(String schoolName, String website, String intro, String address, String area, String phone) {
        this.schoolName = schoolName;
        this.website = website;
        this.intro = intro;
        this.address = address;
        this.area = area;
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }
    public String getArea() {
        return area;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public String getWebsite() {
        return website;
    }

    public String getIntro() {
        return intro;
    }

    public String getAddress() {
        return address;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
}
