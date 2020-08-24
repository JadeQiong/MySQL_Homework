package dao.IMPL;

import dao.baseDao;
import dao.administratordao;
import domain.Administrator;

public class administratordaoImpl extends baseDao implements administratordao{
    @Override
    public Administrator queryByAID(String AID) {
        String sql="select * from administrator where a_ID=?";
        return QueryForOne(Administrator.class,sql,AID);
    }

    @Override
    public Administrator queryByAIDandPassword(String AID, String APassword) {
        String sql="select * from administrator where a_ID=? and a_password=?";
        return QueryForOne(Administrator.class,sql,AID,APassword);
    }

    @Override
    public int saveA(Administrator administrator) {
        String sql="insert into administrator(a_name,a_ID,a_password) values(?,?,?)";
        return update(sql,administrator.getA_name(),administrator.getA_ID(),administrator.getA_password());
    }
}
