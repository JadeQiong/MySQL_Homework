package com.panli.operation;
import java.sql.*;
import com.panli.dbutil.*;
import com.panli.model.Users;


public class UsersOperation {
    private  static Dbutil dbutil = new Dbutil();
    //add
    public static  int insertData(Users users) throws Exception{
        Connection conn = Dbutil.getCon();
        String sql = "insert into users values(?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,users.getUser_ID());
        pstmt.setString(2,users.getUsername());
        pstmt.setString(3,users.getUser_email());
        pstmt.setString(4,users.getUser_pwd());
        pstmt.setInt(5,users.getUser_role());

        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return  res;
    }
    /*
    -- create table users(
-- 	user_ID varchar(20),
--     username varchar(20),
--     user_email varchar(60),
--     user_pwd varchar(20),
--     user_role int
-- );
    * */

    //update
    public static int updateDate(Users users)throws Exception{
        Connection conn = Dbutil.getCon();
        String sql = "update users set user_ID=?, username=?,user_email=?,user_pwd=?,user_role=? where user_ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1,users.getUser_ID());
        pstmt.setString(2,users.getUsername());
        pstmt.setString(3,users.getUser_email());
        pstmt.setString(4,users.getUser_pwd());
        pstmt.setInt(5,users.getUser_role());

      //  pstmt.setInt(6,users.getUser_role());

        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return res;

    }

    //delete
    public  static  int deleteData(Users users)throws Exception{
        Connection conn = dbutil.getCon();
        String sql = "delete from users where user_ID=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, users.getUser_ID());

        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return res;
    }

    //checkAccount
    /*
    * 类方法可在不实例化对象的前提下【直接调用】。
    * 一般类的静态方法和静态变量都是通过static关键字修饰的。而且静态方法体里不能应用任何实例变量和实例方法。
    * */
    public static boolean checkUser(Users users) throws Exception{
        Connection conn = Dbutil.getCon();
        String sql = "select * from users where user_ID =? and user_pwd=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,users.getUser_ID());
        pstmt.setString(2,users.getUser_pwd());

        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            return true;
        }
        return false;
    }

}
