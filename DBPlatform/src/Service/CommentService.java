package Service;/*
 * @Description:
 * @Author: 14118
 * @Date: 2020/6/18.
 */

import domain.Comment;

import java.util.Date;
import java.util.List;

public interface CommentService {

    public void addComment(String customerID, String goodID, String comment, Date time);
    public void deleteComment(String customerID,String goodID);
    public List<Comment> queryBycustomerID(String customerID);
    public List<Comment> queryBygoodID(String goodID);
    public List<Comment> queryBycustomerIDandgoodID(String customerID,String goodID);
}
