package dao.IMPL;

import dao.baseDao;
import dao.salerdao;
import domain.Saler;

public class salerdaoImpl extends baseDao implements salerdao {
    @Override
    public Saler queryBySalerID(String SalerID) {
        String sql="select * from saler where saler_ID=?";
        return QueryForOne(Saler.class,sql,SalerID);
    }

    @Override
    public Saler queryBySalerIDandPassword(String SalerID, String SalerPassword) {
        String sql="select * from saler where saler_ID=? and password=?";
        return QueryForOne(Saler.class,sql,SalerID,SalerPassword);
    }

    @Override
    public int saveSaler(Saler saler) {
        String sql="insert into saler(saler_name,saler_ID,password)"+
                "values(?,?,?)";
        return update(sql,saler.getSaler_name(),saler.getSaler_ID(),saler.getPassword());
    }
}
