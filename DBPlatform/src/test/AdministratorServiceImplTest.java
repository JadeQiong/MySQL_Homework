package test;

import Service.IMPL.AdministratorServiceImpl;
import Service.AdministratorService;
import dao.IMPL.administratordaoImpl;
import dao.IMPL.announcementdaoImpl;
import dao.administratordao;
import dao.announcementdao;
import domain.Administrator;
import domain.Announcement;
import java.util.Date;
import org.junit.Test;

import static org.junit.Assert.*;

public class AdministratorServiceImplTest {
    AdministratorService ad=new AdministratorServiceImpl();

    @Test
    public void login(){System.out.println(ad.login("12345","12345"));}

    @Test
    public void register(){
        Administrator administrator=new Administrator("hhhh","12346","12346");
        ad.register(administrator);
    }

    @Test
    public void postNewAnnouncement(){
        String AnnounceID="12345";
        String title="123";
        String content="123";
        Date time=new Date();
        ad.postNewAnnouncement(AnnounceID,title,content,time);
    }

    @Test
    public void deletedAnnouncement(){
        String AnnounceID="12345";
        ad.deletedAnnouncement(AnnounceID);
    }

    @Test
    public void modifiedAnnouncement(){
        String AnnouceID="12345";
        String title="124";
        String content="124";
        Date time=new Date();
        ad.modifiedAnnouncement(AnnouceID,title,content,time);
    }

    @Test
    public void queryOneAnnouncement(){
          String AnnounceID="12345";
          ad.queryOneAnnouncement(AnnounceID);
    }
}
