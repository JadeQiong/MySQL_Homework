package dao.IMPL;/*
 * @Description:
 * @Author: 14118
 * @Date: 2020/6/18.
 */

import dao.commentdao;
import domain.Comment;
import dao.baseDao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class commentdaoImpl extends baseDao implements commentdao {

    @Override
    public List<Comment> queryByUserIDandGoodID(String CustomerID, String GoodID)
    {
        String sql="select Comment from comment where customer_ID=? and goods_ID=?";
        return QueryForList(Comment.class,sql);
    }

    @Override
    public List<Comment> queryByCustomerID(String customerID) {
        String sql="select * from comment where customer_ID=?";
        return QueryForList(Comment.class,sql,customerID);
    }

    @Override
    public List<Comment> queryByGoodID(String good_ID) {
        String sql1 = "select * from comment where goods_ID=?";
        return QueryForList(Comment.class,sql1,good_ID);
    }



    @Override
    public int deleteComment(String customer_ID, String good_ID) {
        String sql="delete from comment where customer_ID=? and  goods_ID=? ";
        return update(sql,customer_ID,good_ID);
    }

    @Override
    public int saveComment(Comment comment) {
        String sql="insert into comment (`customer_ID`,`goods_ID`,`Comment`,`time`) " +
                "values(?,?,?,?)";
        return update(sql,comment.getCustomer_ID(),comment.getGoods_ID(),comment.getComment(),comment.getTime());
    }

    @Override
    public int updateComment(Comment comment) {
        String sql="update comment set comment=? where customer_ID=?";
        return update(sql,comment.getComment(),comment.getCustomer_ID());
    }


    @Override
    public List<Comment> queryOrderByTime() {
        String sql="select comment from comment order by time";
        return QueryForList(Comment.class,sql);
    }

    @Override
    public List<Comment> queryByCustomerIDOrderByTime(String customer_ID) {
        String sql="select comment from comment where customer_ID=? order by time";
        return QueryForList(Comment.class,sql,customer_ID);
    }

    @Override
    public List<Comment> queryByGoodIDOrderByTime(String good_ID) {
        String sql="select comment from comment where goods_ID=? order by time";
        return QueryForList(Comment.class,sql,good_ID);
    }


}
