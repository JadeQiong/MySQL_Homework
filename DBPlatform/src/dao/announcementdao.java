package dao;

import domain.Announcement;
import java.util.Date;

public interface announcementdao {
    public Announcement queryByAnnounceID(String AnnounceID);
    public int addAnnouncement(String AnnounceID,String title,String content,Date time);
    public int updateAnnouncement(String AnnounceID,String title,String content,Date time);
    public int deleteAnnouncement(String AnnounceID);
}
