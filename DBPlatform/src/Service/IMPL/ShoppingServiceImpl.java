package Service.IMPL;

import Service.ShoppingService;
import dao.IMPL.shoppingdaoImpl;
import dao.shoppingdao;
import domain.Good;
import domain.Shopping;

public class ShoppingServiceImpl implements ShoppingService{
    private shoppingdao s=new shoppingdaoImpl();

    @Override
    public void addItem(String customer_ID, String good_ID,Integer number,double price) {
        s.addshopping(customer_ID,good_ID,number,price);
    }
    @Override
    public void addItem(String customer_ID, String good_ID,Integer number,double price,String kind) {
        s.addshopping(customer_ID,good_ID,number,price,kind);
    }

    @Override
    public void deleteItem(String customer_ID, String good_ID) {
        s.deleteshopping(customer_ID,good_ID);
    }

    @Override
    public void removeAll(String customer_ID) {
        s.deleteall(customer_ID );
    }

    @Override
    public void printMyCart(String customer_ID) {
        Shopping ss=s.printUsershopping(customer_ID );
        System.out.println(ss.toString());
        System.out.println(ss.amountPrice());
    }

    @Override
    public void jumpToGood(String good_ID) {
        Good g=s.jumpgoodpage(good_ID);
        System.out.println(g);
    }
}
