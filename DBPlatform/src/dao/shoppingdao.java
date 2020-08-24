package dao;

import domain.Shopping;
import domain.Good;

import java.util.List;

public interface shoppingdao {
    public int addshopping(String customer_ID,String good_ID,Integer number,double price,String kind);
    public int addshopping(String customer_ID,String good_ID,Integer number,double price);
    public int deleteshopping(String customer_ID,String good_ID);

    public int deleteall(String customer_ID);
    public Shopping printUsershopping(String customer_ID);
    public Good jumpgoodpage(String good_ID);
    public int updateShoppingnum(String s,String c,Integer i);
}
