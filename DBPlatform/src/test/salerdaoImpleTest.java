package test;

import dao.IMPL.salerdaoImpl;
import dao.salerdao;
import domain.Saler;
import org.junit.Test;

import static org.junit.Assert.*;

public class salerdaoImpleTest {

    @Test
    public void queryBySalerID(){
        salerdao salerdao=new salerdaoImpl();
        System.out.println(salerdao.queryBySalerID("12345"));
    }

    @Test
    public void queryByUserIDandPassword(){
        salerdao salerdao=new salerdaoImpl();
        System.out.println(salerdao.queryBySalerIDandPassword("12345","12345"));
    }

    @Test
    public void saveCustomer(){
        salerdao salerdao=new salerdaoImpl();
        Saler s=new Saler("chm","123123","123123");
        System.out.println(salerdao.saveSaler(s));
    }
}
