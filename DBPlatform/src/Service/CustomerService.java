package Service;

import domain.Customer;

public interface CustomerService {
    public Customer login(String id,String pw);
    public void register(Customer customer);
}
