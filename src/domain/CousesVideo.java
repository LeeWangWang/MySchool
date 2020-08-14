package domain;

public class CousesVideo {
    private int id;
    private String cousesVideoName;
    private String videoPath;
    private String imgPath;
    private String teacherName;
    private String videoIntroduce;

    public CousesVideo() {
    }

    public CousesVideo(String cousesVideoName, String videoPath, String imgPath, String teacherName, String videoIntroduce) {
        this.cousesVideoName = cousesVideoName;
        this.videoPath = videoPath;
        this.imgPath = imgPath;
        this.teacherName = teacherName;
        this.videoIntroduce = videoIntroduce;
    }

    public CousesVideo(int id, String cousesVideoName, String videoPath, String imgPath, String teacherName, String videoIntroduce) {
        this.id = id;
        this.cousesVideoName = cousesVideoName;
        this.videoPath = videoPath;
        this.imgPath = imgPath;
        this.teacherName = teacherName;
        this.videoIntroduce = videoIntroduce;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCousesVideoName() {
        return cousesVideoName;
    }

    public void setCousesVideoName(String cousesVideoName) {
        this.cousesVideoName = cousesVideoName;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getVideoIntroduce() {
        return videoIntroduce;
    }

    public void setVideoIntroduce(String videoIntroduce) {
        this.videoIntroduce = videoIntroduce;
    }

    @Override
    public String toString() {
        return "CousesVideo{" +
                "id=" + id +
                ", cousesVideoName='" + cousesVideoName + '\'' +
                ", videoPath='" + videoPath + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", videoIntroduce='" + videoIntroduce + '\'' +
                '}';
    }
}
