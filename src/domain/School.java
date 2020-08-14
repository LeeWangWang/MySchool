package domain;

public class School {
    private String name;
    private String location;
    private String introduce;

    public School(String name, String location, String introduce) {
        this.name = name;
        this.location = location;
        this.introduce = introduce;
    }

    public School() {
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Override
    public String toString() {
        return "school{" +
                "name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
