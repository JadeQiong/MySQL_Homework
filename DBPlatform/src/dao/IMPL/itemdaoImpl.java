package dao.IMPL;

import dao.baseDao;
import dao.itemdao;
import domain.Item;
import domain.Shopping;

import java.util.ArrayList;
import java.util.List;

public class itemdaoImpl extends baseDao implements itemdao{
    @Override
    public int addItem(String deal_ID,List<String> good_ID, List<Integer> number, List<Double> price) {
        int size=good_ID.size();
        String sql="insert into item values(?,?,?,?)";
        for(int s=0;s<size;s++){
            update(sql,deal_ID,good_ID.get(s),number.get(s),price.get(s));
        }
        return size;
    }

    @Override
    public int addShoppingItem(String deal_ID,Shopping item) {
        int size=item.getGood_ID().size();
        System.out.println(size);
        String sql="insert into item values(?,?,?,?)";
        for(int s=0;s<size;s++){
            update(sql,deal_ID,item.getGood_ID().get(s),item.getNumber().get(s),item.getPrice().get(s));
        }

        return size;
    }

    @Override
    public int deleteall(String deal_ID) {
        String sql="delete from item where deal_ID=?";
        return update(sql,deal_ID);
    }

    @Override
    public Item printItem(String deal_ID) {
        List<String> good_ID=new ArrayList<String>();
        List<Integer> number=new ArrayList<Integer>();
        List<Double> price=new ArrayList<Double>();
        Item i=new Item(deal_ID,good_ID,number,price);
        String sql_2="select good_ID from item where deal_ID=?";
        String sql_3="select number from item where deal_ID=?";
        String sql_4="select price from item where deal_ID=?";
        i.setDeal_ID(deal_ID);

        i.setGood_ID(queryAsList(String.class,sql_2,deal_ID));
        i.setNumber(queryAsList(Integer.class,sql_3,deal_ID));
        i.setPrice(queryAsList(Double.class,sql_4,deal_ID));

        return i;
    }
}
