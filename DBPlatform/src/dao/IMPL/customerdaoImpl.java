package dao.IMPL;

import dao.baseDao;
import dao.customerdao;
import domain.Customer;

public class customerdaoImpl extends baseDao implements customerdao {
    @Override
    public Customer queryByUserID(String CustomerID) {
        String sql="select `customer_name`,`customer_ID`,`customer_password`,`area`,`phone_number`,`wallet` from customer where customer_ID=?";
        return QueryForOne(Customer.class,sql,CustomerID);
    }

    @Override
    public Customer queryByUserIDandPassword(String CustomerID, String CustomerPassword) {
        String sql="select * from customer where customer_ID=? and customer_password=?";
        return QueryForOne(Customer.class,sql,CustomerID,CustomerPassword);
    }

    @Override
    public int saveCustomer(Customer customer) {
        String sql="insert into customer(`customer_name`,`customer_ID`,`customer_password`,`area`,`phone_number`,`wallet`) " +
                "values(?,?,?,?,?,?)";
        return update(sql,customer.getCustomer_name(),customer.getCustomer_ID(),customer.getCustomer_password(),customer.getArea(),customer.getPhone_number(),customer.getWallet());
    }
    @Override
    public int updateCustomer(Customer customer) {
        String sql="update customer set `customer_name`=?,`customer_password`=?,`area`=?,`phone_number`=?,`wallet`=? where `customer_ID`=?";

        return update(sql,customer.getCustomer_name(),customer.getCustomer_password(),customer.getArea(),customer.getPhone_number(),customer.getWallet(),customer.getCustomer_ID());
    }

    @Override
    public int culwallet(String CustomID, Double wallet) {
        String sql="update customer set `wallet`=? where `customer_ID`=?";
        return update(sql,wallet,CustomID);
    }

}
