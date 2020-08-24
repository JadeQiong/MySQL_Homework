package test;

import Service.CustomerService;
import Service.IMPL.CustomerServiceImpl;
import dao.IMPL.customerdaoImpl;
import dao.customerdao;
import domain.Customer;
import org.junit.Test;

import static org.junit.Assert.*;

public class CustomerServiceImplTest {

    CustomerService c=new CustomerServiceImpl();

    @Test
    public void login() {
        System.out.println(c.login("12345","12345"));
    }

    @Test
    public void register() {
        Customer cu=new Customer("hhh","123999","123123","gz","222222",1000.0);
        c.register(cu);
    }
}