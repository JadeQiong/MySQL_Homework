package Service.IMPL;

import Service.AdministratorService;
import dao.IMPL.administratordaoImpl;
import dao.IMPL.announcementdaoImpl;
import dao.administratordao;
import dao.announcementdao;
import domain.Administrator;
import domain.Announcement;

import java.util.Date;

public class AdministratorServiceImpl implements AdministratorService{
    private administratordao a=new administratordaoImpl();
    private announcementdao an=new announcementdaoImpl();

    @Override
    public Administrator login(String id, String pw) {
        return a.queryByAIDandPassword(id,pw);
    }

    @Override
    public void register(Administrator administrator) {
        a.saveA(administrator);
    }

    @Override
    public void postNewAnnouncement(String AnnounceID, String title, String content, Date time) {
        an.addAnnouncement(AnnounceID,title,content,time);
    }

    @Override
    public void deletedAnnouncement(String AnnounceID) {
        an.deleteAnnouncement(AnnounceID);
    }

    @Override
    public void modifiedAnnouncement(String AnnounceID, String title, String content, Date time) {
        an.updateAnnouncement(AnnounceID,title,content,time);
    }

    @Override
    public void queryOneAnnouncement(String AnnounceID) {
        Announcement a=an.queryByAnnounceID(AnnounceID);
        System.out.println(a);
    }
}
