package dao.IMPL;

import dao.baseDao;
import dao.dealdao;
import dao.itemdao;
import domain.Customer;
import domain.Item;
import domain.Deal;
import domain.Shopping;

import java.util.Date;

public class dealdaoImpl extends baseDao implements dealdao{
    @Override
    public int addDeal(String deal_ID, String customer_ID, double price, Date time, String area) {
        String sql="insert into deal values(?,?,?,?,?)";
        return update(sql,deal_ID,customer_ID,price,time,area);
    }

    @Override
    public int deleteDeal(String deal_ID) {
        String sql="delete from deal where deal_ID=?";
        return update(sql,deal_ID);
    }

    @Override
    public Deal queryByDealID(String deal_ID) {
        String sql="select * from deal where deal_ID=? ";
        return QueryForOne(Deal.class,sql,deal_ID);
    }

    @Override
    public Deal queryByCustomerID(String customer_ID) {
        String sql="select * from deal where customer_ID=? ";
        return QueryForOne(Deal.class,sql,customer_ID);
    }
}
