package dao.IMPL;

import dao.baseDao;
import dao.shoppingdao;
import domain.Shopping;
import domain.Good;

import java.util.ArrayList;
import java.util.List;

public class shoppingdaoImpl extends  baseDao implements shoppingdao {
    @Override
    public int addshopping(String customer_ID,String good_ID,Integer number,double price){
        double p=number*price;
        String sql="insert into shopping values(?,?,?,?)";
        return update(sql,customer_ID,good_ID,number,p);
    }

    @Override
    public int addshopping(String customer_ID,String good_ID,Integer number,double price, String kind){
        String sql="insert into shopping values(?,?,?,?,?)";
        return update(sql,customer_ID,good_ID,number,price,kind);
    }
    @Override
    public int deleteshopping(String customer_ID,String good_ID){
        String sql="delete from shopping where customer_ID=? and good_ID=?";

        return update(sql,customer_ID,good_ID);
    }

    @Override
    public int deleteall(String customer_ID) {
        String sql="delete from shopping where customer_ID=?";
        return update(sql,customer_ID);
    }

    @Override
    public Shopping printUsershopping(String customer_ID){
        List<String> good_ID=new ArrayList<String>();
        List<Integer> number=new ArrayList<Integer>();
        List<Double> price=new ArrayList<Double>();
        Shopping s=new Shopping(customer_ID,good_ID,number,price);
        String sql_2="select good_ID from shopping where customer_ID=?";
        String sql_3="select number from shopping where customer_ID=?";
        String sql_4="select price from shopping where customer_ID=?";
        s.setCustomer_ID(customer_ID);
        s.setGood_ID(queryAsList(String.class,sql_2,customer_ID));
        s.setNumber(queryAsList(Integer.class,sql_3,customer_ID));
        s.setPrice(queryAsList(Double.class,sql_4,customer_ID));
        return s;
    };

    @Override
    public Good jumpgoodpage(String good_ID){
        String sql="select * from good where good_ID=?";
        return QueryForOne(Good.class,sql,good_ID);
    }
    @Override
    public int updateShoppingnum(String s,String c,Integer i) {
        String sql="update shopping set number=? where customer_ID=? and good_ID=?";
        return update(sql,i,s,c);
    }
}
