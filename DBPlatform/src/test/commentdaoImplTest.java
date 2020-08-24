package test;/*
 * @Description:
 * @Author: 14118
 * @Date: 2020/6/18.
 */

import dao.IMPL.commentdaoImpl;
import dao.commentdao;
import domain.Comment;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class commentdaoImplTest {

    @Test
    public void addComment()
    {
        commentdao commentdao=new commentdaoImpl();
        List<String> goods_ID=new ArrayList<String>();
        List<String> customer_ID=new ArrayList<String>();
        goods_ID.add("12345");
        customer_ID.add("123456");
        Date date=new Date();
        Comment comment=new Comment("123456","123457","good",date);
        commentdao.saveComment(comment);
    }
    @Test
    public void searchComment()
    {
              commentdao commentdao=new commentdaoImpl();
              System.out.println(commentdao.queryByCustomerID("123456"));

    }
    @Test
    public void searchCommentWithGoodID()
    {
        commentdao commentdao=new commentdaoImpl();

        for(Comment c:commentdao.queryByGoodID("123456"))
        {
            System.out.println(c);
        }
//        System.out.println(commentdao.queryByCustomerID("123456"));

    }
    @Test
    public void deleteComment()
    {
        commentdao commentdao=new commentdaoImpl();
        commentdao.deleteComment("123456","123457");
    }
}
