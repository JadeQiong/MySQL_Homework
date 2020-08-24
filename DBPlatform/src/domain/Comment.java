package domain;

import java.util.Date;
import java.util.List;

public class Comment {
    private String customer_ID;
    private String goods_ID;
    private String comment;
    private Date time;

    public Comment()
    {}
    public Comment(String customer_ID, String goods_ID, String comment, Date time) {
        this.customer_ID = customer_ID;
        this.goods_ID = goods_ID;
        this.comment = comment;
        this.time = time;
    }

    public Comment(List<String> customer_id, String good_id, List<String> comment, List<Date> dates) {
    }

    public String getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(String customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getGoods_ID() {
        return goods_ID;
    }

    public void setGoods_ID(String goods_ID) {
        this.goods_ID = goods_ID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "customer_ID='" + customer_ID + '\'' +
                ", goods_ID='" + goods_ID + '\'' +
                ", comment='" + comment + '\'' +
                ", time=" + time +
                '}';
    }
}
