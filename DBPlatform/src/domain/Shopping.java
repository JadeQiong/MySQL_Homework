package domain;

import java.util.Date;
import java.util.List;

public class Shopping {
    private String customer_ID;

   /* 这里的商品ID和数量都使用了集合，表示一个购物车内有不同的商品，每种商品的数量不同。数据库该表中每一行保存的是购物车内一种商品的购买量，
    写SQL语句时，以customer_ID为条件，需要从该表中读取所有搜寻到的商品，添加到集合中.要注意的是，到时读取的时候一个重点是，在这个集合属性上，
    不能直接构造或者使用getter，setter方法，而是需要先使用getter方法，然后使用list本身带有的add方法进行加入，在使用setter方法*/
    private List<String> good_ID;
    private List<Integer> number;
    private List<Double> price;
    private List<String> kind;

    public Shopping(String customer_ID, List<String> good_ID, List<Integer> number, List<Double> price) {
        this.customer_ID = customer_ID;
        this.good_ID = good_ID;
        this.number = number;
        this.price = price;
    }

    public Shopping(String customer_ID, List<String> good_ID, List<Integer> number, List<Double> price,List<String> kind) {
        this.customer_ID = customer_ID;
        this.good_ID = good_ID;
        this.number = number;
        this.price = price;
        this.kind =kind;
    }

    public String getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(String customer_ID) {
        this.customer_ID = customer_ID;
    }

    public List<String> getGood_ID() {
        return good_ID;
    }

    public void setGood_ID(List<String> good_ID) {
        this.good_ID = good_ID;
    }

    public List<Integer> getNumber() {
        return number;
    }

    public void setNumber(List<Integer> number) {
        this.number = number;
    }

    public List<Double> getPrice() {
        return price;
    }

    public void setKind(List<String> kind){this.kind = kind;}

    public List<String> getKind(){return  kind;}

    public void setPrice(List<Double> price) {
        this.price = price;
    }

    public String amountPrice(){
        double aPrice=0.0;
        String p="amountPrice=";
        for(int i=0;i<price.size();i++){
            aPrice+=price.get(i);
        }
        p=p+aPrice;
        return p;
    }

    @Override
    public String toString() {
        String s="Shopping{\ncustomer_ID="+customer_ID+"\n";
        for(int i=0;i<good_ID.size();i++){
            s=s+"good_ID="+good_ID.get(i)+",number="+number.get(i)+",price="+price.get(i)+"\n";
        }
        s=s+"}";
        return s;
    }
}
