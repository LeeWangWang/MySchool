package domain;

import java.awt.*;

public class College {
    int collegeId;
    String collegeName;
//    Image collegePic;
    String collegeLocation;
    String collegeWebsite;
    String collegeIsDoubleTop;
    String collegeIs985;
    String collegeIs211;
    String collegeMainType;
    String collegeStudyType;
    String collegeIntroduction;

    public College() {

    }

    public College(int collegeId, String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop,
                   String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) {
        this.collegeId = collegeId;
        this.collegeName = collegeName;
        this.collegeLocation = collegeLocation;
        this.collegeWebsite = collegeWebsite;
        this.collegeIsDoubleTop = collegeIsDoubleTop;
        this.collegeIs985 = collegeIs985;
        this.collegeIs211 = collegeIs211;
        this.collegeMainType = collegeMainType;
        this.collegeStudyType = collegeStudyType;
        this.collegeIntroduction = collegeIntroduction;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getCollegeLocation() {
        return collegeLocation;
    }

    public void setCollegeLocation(String collegeLocation) {
        this.collegeLocation = collegeLocation;
    }

    public String getCollegeWebsite() {
        return collegeWebsite;
    }

    public void setCollegeWebsite(String collegeWebsite) {
        this.collegeWebsite = collegeWebsite;
    }

    public String getCollegeIsDoubleTop() {
        return collegeIsDoubleTop;
    }

    public void setCollegeIsDoubleTop(String collegeIsDoubleTop) {
        this.collegeIsDoubleTop = collegeIsDoubleTop;
    }

    public String getCollegeIs985() {
        return collegeIs985;
    }

    public void setCollegeIs985(String collegeIs985) {
        this.collegeIs985 = collegeIs985;
    }

    public String getCollegeIs211() {
        return collegeIs211;
    }

    public void setCollegeIs211(String collegeIs211) {
        this.collegeIs211 = collegeIs211;
    }

    public String getCollegeMainType() {
        return collegeMainType;
    }

    public void setCollegeMainType(String collegeMainType) {
        this.collegeMainType = collegeMainType;
    }

    public String getCollegeStudyType() {
        return collegeStudyType;
    }

    public void setCollegeStudyType(String collegeStudyType) {
        this.collegeStudyType = collegeStudyType;
    }

    public String getCollegeIntroduction() {
        return collegeIntroduction;
    }

    public void setCollegeIntroduction(String collegeIntroduction) {
        this.collegeIntroduction = collegeIntroduction;
    }

    @Override
    public String toString() {
        return "College{" +
                "collegeId=" + collegeId +
                ", collegeName='" + collegeName + '\'' +
                ", collegeLocation='" + collegeLocation + '\'' +
                ", collegeWebsite='" + collegeWebsite + '\'' +
                ", collegeIsDoubleTop='" + collegeIsDoubleTop + '\'' +
                ", collegeIs985='" + collegeIs985 + '\'' +
                ", collegeIs211='" + collegeIs211 + '\'' +
                ", collegeMainType='" + collegeMainType + '\'' +
                ", collegeStudyType='" + collegeStudyType + '\'' +
                ", collegeIntroduction='" + collegeIntroduction + '\'' +
                '}';
    }
}
