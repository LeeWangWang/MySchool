package domain;

public class entranceExaminationGrade {
    private String schoolName;
    private int year;
    private float grade;
    private String area;

    public entranceExaminationGrade(){

    }
    public entranceExaminationGrade(String schoolName, int year, float grade, String area) {
        this.schoolName = schoolName;
        this.year = year;
        this.grade = grade;
        this.area = area;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public int getYear() {
        return year;
    }

    public float getGrade() {
        return grade;
    }

    public String getArea() {
        return area;
    }
}
