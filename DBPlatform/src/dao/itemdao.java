package dao;

import domain.Item;
import domain.Shopping;

import java.util.List;

public interface itemdao {
    public int addItem(String deal_ID,List<String> good_ID, List<Integer> number, List<Double> price);
    public int addShoppingItem(String deal_ID,Shopping item);
    public int deleteall(String deal_ID);
    public Item printItem(String deal_ID);
}
