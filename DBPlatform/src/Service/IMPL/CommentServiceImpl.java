package Service.IMPL;/*
 * @Description:
 * @Author: 14118
 * @Date: 2020/6/18.
 */

import Service.CommentService;
import dao.IMPL.commentdaoImpl;
import dao.commentdao;
import domain.Comment;

import java.util.Date;
import java.util.List;

public class CommentServiceImpl implements CommentService {
    private commentdao c=new commentdaoImpl();

    @Override
    public void addComment(String customerID, String goodID, String comment, Date time)
    {
        Comment temp=new Comment(customerID,goodID,comment,time);
        c.saveComment(temp);
    }

    @Override
    public void deleteComment(String customerID, String goodID) {
        c.deleteComment(customerID,goodID);
    }

    @Override
    public List<Comment> queryBycustomerID(String customerID) {
        return c.queryByCustomerID(customerID);
    }

    @Override
    public List<Comment> queryBygoodID(String goodID) {
        return c.queryByGoodID(goodID);
    }

    @Override
    public List<Comment> queryBycustomerIDandgoodID(String customerID, String goodID) {
        return c.queryByUserIDandGoodID(customerID, goodID);
    }


}
