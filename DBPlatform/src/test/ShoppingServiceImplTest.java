package test;

import Service.IMPL.ShoppingServiceImpl;
import Service.ShoppingService;
import Service.IMPL.SalerServiceImpl;
import dao.IMPL.shoppingdaoImpl;
import dao.shoppingdao;
import domain.Shopping;
import domain.Good;
import org.junit.Test;

import static org.junit.Assert.*;

public class ShoppingServiceImplTest {
    ShoppingService ss=new ShoppingServiceImpl();

    @Test
    public void addItem(){
        String customer_ID="12345";
        String good_ID="12347";
        Integer number=5;
        double price=3.3;
        ss.addItem(customer_ID,good_ID,number,price);
    }

    @Test
    public void deleteItem(){
        String custom_ID="12345";
        String good_ID="12347";
        ss.deleteItem(custom_ID,good_ID);
    }

    @Test
    public void removeall(){
        String customer_ID="12345";
        ss.removeAll(customer_ID);
    }

    @Test
    public void printMyCart(){
        String customer_ID="12345";
        ss.printMyCart(customer_ID);
    }

    @Test
    public void jumpToGood(){
        String good_ID="12347";
        ss.jumpToGood(good_ID);
    }


}
