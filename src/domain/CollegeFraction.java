package domain;

public class CollegeFraction {
    private int collegeId;
    private int year;
    private int collegeWen;
    private int collegeLi;
    private int wen;
    private int li;

    public CollegeFraction() {
    }

    public CollegeFraction(int collegeId, int year, int collegeWen, int collegeLi, int wen, int li) {
        this.collegeId = collegeId;
        this.year = year;
        this.collegeWen = collegeWen;
        this.collegeLi = collegeLi;
        this.wen = wen;
        this.li = li;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCollegeWen() {
        return collegeWen;
    }

    public void setCollegeWen(int collegeWen) {
        this.collegeWen = collegeWen;
    }

    public int getCollegeLi() {
        return collegeLi;
    }

    public void setCollegeLi(int collegeLi) {
        this.collegeLi = collegeLi;
    }

    public int getWen() {
        return wen;
    }

    public void setWen(int wen) {
        this.wen = wen;
    }

    public int getLi() {
        return li;
    }

    public void setLi(int li) {
        this.li = li;
    }

    @Override
    public String toString() {
        return "CollegeFraction{" +
                "collegeId=" + collegeId +
                ", year=" + year +
                ", collegeWen=" + collegeWen +
                ", collegeLi=" + collegeLi +
                ", wen=" + wen +
                ", li=" + li +
                '}';
    }
}
