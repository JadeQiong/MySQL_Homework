package domain;

import java.util.Date;

public class Announcement {
    private String announce_ID;
    private String title;
    private String content;
    private Date time;

    public Announcement(){}

    public Announcement(String announce_ID,String title,String content,Date time){
        this.announce_ID=announce_ID;
        this.title=title;
        this.content=content;
        this.time=time;
    }

    public String getAnnounce_ID(){return announce_ID;}
    public void setAnnounce_ID(String announce_ID){this.announce_ID=announce_ID;}

    public String getTitle(){return title;}
    public void setTitle(String title){this.title=title;}

    public String getContent(){return content;}
    public void setContent(String content){this.content=content;}

    public Date getTime() {
        return time;
    }
    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "announcement_ID='" + announce_ID + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                '}';
    }
}
