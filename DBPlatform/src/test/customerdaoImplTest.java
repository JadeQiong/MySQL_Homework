package test;

import dao.IMPL.customerdaoImpl;
import dao.customerdao;
import domain.Customer;
import org.junit.Test;

import static org.junit.Assert.*;

public class customerdaoImplTest {

    @Test
    public void queryByUserID() {
        customerdao customerdao=new customerdaoImpl();
        System.out.println(customerdao.queryByUserID("12345"));
    }

    @Test
    public void queryByUserIDandPassword() {
        customerdao customerdao=new customerdaoImpl();
        System.out.println(customerdao.queryByUserIDandPassword("123456","123456"));
    }

    @Test
    public void saveCustomer() {
        customerdao customerdao=new customerdaoImpl();
        Customer c=new Customer("chm","123123","123123","gz","222222",1000.0);
        System.out.println(customerdao.saveCustomer(c));
    }
}