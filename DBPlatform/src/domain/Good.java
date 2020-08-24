package domain;

import java.util.Date;

public class Good {
    private String good_ID;
    private String saler_ID;
    private Integer number;
    private Double price;
    private Date time_slot;
    private String area;
    private String imgpath;
    private String goodName;
    private String kind;

    public Good(){}
//
//    public Good(String good_ID, String saler_ID, Integer number, Double price, Date time_slot, String area, String imgpath,String goodName) {
//        this.good_ID = good_ID;
//        this.saler_ID = saler_ID;
//        this.number = number;
//        this.price = price;
//        this.time_slot = time_slot;
//        this.area = area;
//        if(imgpath!=null&&!"".equals(imgpath)) {
//            this.imgpath = imgpath;
//        }
//        this.goodName=goodName;
//    }

    public Good(String good_ID, String saler_ID, Integer number, Double price, Date time_slot, String area, String imgpath,String goodName,String kind) {
        this.good_ID = good_ID;
        this.saler_ID = saler_ID;
        this.number = number;
        this.price = price;
        this.time_slot = time_slot;
        this.area = area;
        if(imgpath!=null&&!"".equals(imgpath)) {
            this.imgpath = imgpath;
        }
        this.kind=kind;
        this.goodName=goodName;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        if(imgpath!=null&&!"".equals(imgpath)) {
            this.imgpath = imgpath;
        }
    }

    public String getGood_ID() {
        return good_ID;
    }

    public void setGood_ID(String good_ID) {
        this.good_ID = good_ID;
    }

    public String getSaler_ID() {
        return saler_ID;
    }

    public void setSaler_ID(String saler_ID) {
        this.saler_ID = saler_ID;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getTime_slot() {
        return time_slot;
    }

    public void setTime_slot(Date time_slot) {
        this.time_slot = time_slot;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public void setKind(String kind){this.kind =kind;}

    public String getKind(){ return kind;}
    @Override
    public String toString() {
        return "Good{" +
                "good_ID='" + good_ID + '\'' +
                ", saler_ID='" + saler_ID + '\'' +
                ", number=" + number +
                ", price=" + price +
                ", time_slot=" + time_slot +
                ", area='" + area + '\'' +
                ", imgpath='" + imgpath + '\'' +
                ", goodName='" + goodName + '\'' +
                '}';
    }
}
