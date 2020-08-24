package Service;

import domain.Shopping;
import domain.Good;

public interface ShoppingService {
    public void addItem(String customer_ID, String good_ID,Integer number,double price, String kind);
    public void addItem(String customer_ID,String good_ID,Integer number,double price);
    public void deleteItem(String customer_ID,String good_ID);
    public void removeAll(String customer_ID);
    public void printMyCart(String customer_ID);
    public void jumpToGood(String good_ID);
}
