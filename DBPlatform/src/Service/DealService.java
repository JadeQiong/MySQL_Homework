package Service;

import domain.Deal;
import domain.Item;
import domain.Shopping;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public interface DealService {
    public void addFromShopping(String customer_ID);
    public void addSomeFromShopping(String customer_ID,List<String>good_id);
    public void cancelDeal(String deal_ID);
    public void queryDealByDealID(String deal_ID);
    public void queryDealByCustomerID(String customer_ID);
    public void printDetail(String deal_ID);


}
