package Service;

import domain.Administrator;
import domain.Announcement;

import java.util.Date;

public interface AdministratorService {
    public Administrator login(String id,String pw);
    public void register(Administrator administrator);
    public void postNewAnnouncement(String AnnounceID, String title, String content, Date time);
    public void queryOneAnnouncement(String AnnounceID);
    public void modifiedAnnouncement(String AnnounceID, String title, String content, Date time);
    public void deletedAnnouncement(String AnnounceID);
}
