package test;

import Service.SalerService;
import Service.IMPL.SalerServiceImpl;
import dao.IMPL.salerdaoImpl;
import dao.salerdao;
import domain.Saler;
import org.junit.Test;

import static org.junit.Assert.*;

public class SalerServiceImplTest {
    SalerService s=new SalerServiceImpl();

    @Test
    public void login(){
        System.out.println(s.login("12345","12345"));
    }

    @Test
    public void register(){
        Saler sn =new Saler("hhh","123999","123123");
        s.register(sn);
    }
}
