package domain;

import java.util.List;
import domain.CulDouble;

public class Item {
    private String deal_ID;
    private CulDouble CD;

    private List<String> good_ID;
    private List<Integer> number;
    private List<Double> price;

    public Item(){};
    public Item(String deal_ID,List<String>good_ID,List<Integer>number,List<Double>price){
        this.deal_ID=deal_ID;
        this.good_ID=good_ID;
        this.number=number;
        this.price=price;
    }

    public String getDeal_ID(){return deal_ID;}

    public void setDeal_ID(String deal_ID){this.deal_ID=deal_ID;}

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

    public void setPrice(List<Double> price) {
        this.price = price;
    }

    public double amountPrice(){
        double iPrice=0.00;
        for(int i=0;i<price.size();i++){
            iPrice=CD.sum(iPrice,price.get(i));
        }
        return iPrice;
    }

    @Override
    public String toString() {
        String s="Item{\ndeal_ID="+deal_ID+"\n";
        for(int i=0;i<good_ID.size();i++){
            s=s+"good_ID="+good_ID.get(i)+",number="+number.get(i)+",price="+price.get(i)+"\n";
        }
        s=s+"}";
        return s;
    }

}
