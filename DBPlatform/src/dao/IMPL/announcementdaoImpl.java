package dao.IMPL;

import dao.baseDao;
import dao.announcementdao;
import domain.Announcement;

import java.util.Date;

public class announcementdaoImpl extends baseDao implements announcementdao{
    @Override
    public Announcement queryByAnnounceID(String AnnounceID) {
        String sql="select * from announcement where announce_ID=?";
        return QueryForOne(Announcement.class,sql,AnnounceID);
    }

    @Override
    public int addAnnouncement(String AnnounceID, String title, String content, Date time) {
        String sql="insert into announcement values(?,?,?,?)";
        return update(sql,AnnounceID,title,content,time);
    }

    @Override
    public int updateAnnouncement(String AnnounceID, String title, String content, Date time) {
        String sql="update announcement set title=?,content=?,time=? where announce_ID=?";
        return update(sql,title,content,time,AnnounceID);
    }

    @Override
    public int deleteAnnouncement(String AnnounceID) {
        String sql="delete from announcement where announce_ID=?";
        return update(sql,AnnounceID);
    }
}
