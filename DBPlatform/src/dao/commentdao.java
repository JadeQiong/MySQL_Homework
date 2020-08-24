package dao;/*
 * @Description:
 * @Author: 14118
 * @Date: 2020/6/18.
 */

import domain.Comment;

import java.util.List;


public interface commentdao {
    public List<Comment> queryByUserIDandGoodID(String customer_ID, String good_ID);
    public List<Comment> queryByCustomerID(String customerID);
    public List<Comment> queryByGoodID(String good_ID);
    public int deleteComment(String customer_ID, String good_ID);
    public int saveComment(Comment comment);
    public int updateComment(Comment comment);
    public List<Comment> queryOrderByTime();
    public List<Comment> queryByCustomerIDOrderByTime(String customer_ID);
    public List<Comment> queryByGoodIDOrderByTime(String good_ID);
}
