package dao;

import domain.Item;
import domain.Deal;
import java.util.Date;

public interface dealdao {
    public int addDeal(String deal_ID,String customer_ID,double price,Date time,String area);
    public int deleteDeal(String deal_ID);
    public Deal queryByDealID(String deal_ID);
    public Deal queryByCustomerID(String customer_ID);
}
