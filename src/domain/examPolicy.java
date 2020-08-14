package domain;

import java.util.Date;

public class examPolicy {
    private Date time;
    private String title;
    private String content;
    private int id;

    public examPolicy(){

    }

    public examPolicy(Date time, String title, String content, int id) {
        this.time = time;
        this.title = title;
        this.content = content;
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getId() {
        return id;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setId(int id) {
        this.id = id;
    }
}
