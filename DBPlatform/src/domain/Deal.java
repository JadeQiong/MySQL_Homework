package domain;

import java.util.Date;
import java.util.List;

public class Deal {
    private String deal_ID;
    private String customer_ID;
    //与购物车同理。这里的area指的是客户地址，不要弄乱，客户地址和商品地址都是area
    private List<String> good_ID;
    private Double price;
    private Date time;
    private String area;
    private List<Integer> number;

    public Deal(String deal_ID, String customer_ID, List<String> good_ID, Double price, Date time, String area, List<Integer> number) {
        this.deal_ID = deal_ID;
        this.customer_ID = customer_ID;
        this.good_ID = good_ID;
        this.price = price;
        this.time = time;
        this.area = area;
        this.number = number;
    }

    public String getDeal_ID() {
        return deal_ID;
    }

    public void setDeal_ID(String deal_ID) {
        this.deal_ID = deal_ID;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public List<Integer> getNumber() {
        return number;
    }

    public void setNumber(List<Integer> number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Deal{" +
                "deal_ID='" + deal_ID + '\'' +
                ", customer_ID='" + customer_ID + '\'' +
                ", good_ID=" + good_ID +
                ", price=" + price +
                ", time=" + time +
                ", area='" + area + '\'' +
                ", number=" + number +
                '}';
    }
}
