package domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 20:35
 * @Description:
 */
public class Courses implements Serializable {
    private String coursesName;
    private String coursesIntroduce;
    private int teacherId;
    private String coursesStage;
    private Date coursesTime;

    public Courses(){

    }

    public Courses(String coursesName, String coursesIntroduce, int teacherId, String coursesStage, Date coursesTime) {
        this.coursesName = coursesName;
        this.coursesIntroduce = coursesIntroduce;
        this.teacherId = teacherId;
        this.coursesStage = coursesStage;
        this.coursesTime = coursesTime;
    }

    public String getCoursesName() {
        return coursesName;
    }

    public void setCoursesName(String coursesName) {
        this.coursesName = coursesName;
    }

    public String getCoursesIntroduce() {
        return coursesIntroduce;
    }

    public void setCoursesIntroduce(String coursesIntroduce) {
        this.coursesIntroduce = coursesIntroduce;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getCoursesStage() {
        return coursesStage;
    }

    public void setCoursesStage(String coursesStage) {
        this.coursesStage = coursesStage;
    }

    public Date getCoursesTime() {
        return coursesTime;
    }

    public void setCoursesTime(Date coursesTime) {
        this.coursesTime = coursesTime;
    }

    @Override
    public String toString() {
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        return "courses{" +
                "coursesName='" + coursesName + '\'' +
                ", coursesIntroduce='" + coursesIntroduce + '\'' +
                ", teacherId=" + teacherId +
                ", coursesStage='" + coursesStage + '\'' +
                ", coursesTime=" + ft.format(coursesTime) +
                '}';
    }
}
