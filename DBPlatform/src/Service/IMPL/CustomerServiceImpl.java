package Service.IMPL;

import Service.CustomerService;
import dao.IMPL.customerdaoImpl;
import dao.customerdao;
import domain.Customer;

public class CustomerServiceImpl implements CustomerService {
    private customerdao c=new customerdaoImpl();
    @Override
    public Customer login(String id, String pw) {
        return c.queryByUserIDandPassword(id,pw);
    }

    @Override
    public void register(Customer customer) {
       c.saveCustomer(customer);
    }


}
