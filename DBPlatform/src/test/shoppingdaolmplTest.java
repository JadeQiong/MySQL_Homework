package test;

import dao.IMPL.shoppingdaoImpl;
import dao.shoppingdao;
import domain.Shopping;
import domain.Good;
import org.junit.Test;

import static org.junit.Assert.*;
import java.util.List;
import java.util.ArrayList;

public class shoppingdaolmplTest {
    private shoppingdao shoppingdao=new shoppingdaoImpl();

    @Test
    public void addshopping(){
        String customer_ID="12345";
        String good_ID="12347";
        Integer number=5;
        double price=3.3;
        shoppingdao.addshopping(customer_ID,good_ID,number,price);
    }

    @Test
    public void deleteshopping(){
        shoppingdao.deleteshopping("12345","12347");
    }

    @Test
    public void deleall(){shoppingdao.deleteall("12345");}

    @Test
    public void printUsershopping(){
        Shopping s=shoppingdao.printUsershopping("12345");
        System.out.println(s.toString());
        System.out.println(s.amountPrice());
    }

    @Test
    public void jumpgoodpage(){
        Good g=shoppingdao.jumpgoodpage("12347");
        System.out.println(g);
    }

}


