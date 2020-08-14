package domain;
//名师类
public class Teacher {
    private int id;
    private String name;
    private String introduce;
    private String photo;

    public Teacher() {
    }

    public Teacher(int id, String name, String introduce, String photo) {
        this.id = id;
        this.name = name;
        this.introduce = introduce;
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduce='" + introduce + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
