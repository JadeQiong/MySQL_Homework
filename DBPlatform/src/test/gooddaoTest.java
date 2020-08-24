package test;

import dao.IMPL.gooddaoImpl;
import dao.gooddao;
import domain.Good;
import org.junit.Test;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class gooddaoTest {
    private gooddao gooddao=new gooddaoImpl();

    @Test
    public void addgood() {
        Good good=new Good("123457","111111",10,50.0,new Date(),"xian","bbb","ttt","vegetable");
        gooddao.addgood(good);
    }

    @Test
    public void updategood() {
        Good good=new Good("123457","111111",10,50.0,new Date(),"xian","bbb","bbb","vegetable");
        gooddao.updategood(good);
    }

    @Test
    public void deletegood() {

    }

    @Test
    public void queryByOne() {
        Good g=gooddao.QueryByOne("12345");
        System.out.println(g);
    }

    @Test
    public void querygoods() {
       for(Good g:gooddao.querygoods())
        {
            System.out.println(g);
        }
    }
}