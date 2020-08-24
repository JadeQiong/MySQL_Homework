package dao.IMPL;

import dao.baseDao;
import dao.gooddao;
import domain.Good;

import java.util.List;

public class gooddaoImpl extends baseDao implements gooddao {
    @Override
    //在good表中添加了kind
    public int addgood(Good good) {
        String sql="insert into good (`good_ID`,`saler_ID`,`number`,`price`,`time_slot`,`area`,`imgpath`,`goodName`,`kind`) values(?,?,?,?,?,?,?,?,?)";
        return update(sql,good.getGood_ID(),good.getSaler_ID(),good.getNumber(),good.getPrice(),good.getTime_slot(),good.getArea(),good.getImgpath(),good.getGoodName(),good.getKind());
    }

    @Override
    public int updategood(Good good) {
        String sql="update good set `saler_ID`=?,`number`=?,`price`=?,`time_slot`=?,`area`=?,`imgpath`=?,`goodName`=? where `good_ID`=?";
        return update(sql,good.getSaler_ID(),good.getNumber(),good.getPrice(),good.getTime_slot(),good.getArea(),good.getImgpath(),good.getGoodName(),good.getGood_ID());
    }

    @Override
    public int culgood(String good_ID,Integer number) {
        String sql="update good set `number`=? where `good_ID`=?";
        return update(sql,number,good_ID);
    }
    @Override
    public int deletegood(String good_ID) {
        String sql="delete from good where good_ID=?";

        return update(sql,good_ID);
    }

    @Override
    public Good QueryByOne(String good_ID) {
        String sql="select * from good where good_ID=?";
        return QueryForOne(Good.class,sql,good_ID);
    }

    @Override
    public List<Good> querygoods() {
        String sql="select * from good";
        return QueryForList(Good.class,sql);
    }

    @Override
    public List<Good> querygoodsByKind(String kind) {
        String sql="select * from good where `kind`=?";
        return QueryForList(Good.class,sql,kind);
    }

    @Override
    public List<Good> queryGoodsBySomeInformation(String s) {
        String sql="select * from good where goodName like '%"+s+"%'";
        return QueryForList(Good.class,sql);
    }

    @Override
    public List<Good> queryByKind(String s) {
        String sql="select * from good where `kind`=?";
        return QueryForList(Good.class,sql,s);
    }
    @Override
    public List<Good> queryBySalerID(String s) {
        String sql="select * from good where `saler_ID`=?";
        return QueryForList(Good.class,sql,s);
    }
}
