package dao;

import domain.Customer;

public interface customerdao {
    public Customer queryByUserID(String CustomerID);
    public Customer queryByUserIDandPassword(String CustomerID,String CustomerPassword);
    public int saveCustomer(Customer customer);
    public int updateCustomer(Customer customer);
    public int culwallet(String CustomerID,Double wallet);
}
