package com.panli.operation;
import java.sql.*;
import com.panli.dbutil.*;
import com.panli.model.Vegetables;

public class VegetablesOperation {
    private  static Dbutil dbutil = new Dbutil();
    //add
    public static  int insertData(Vegetables vegatables) throws Exception{
        Connection conn = Dbutil.getCon();
        String sql = "insert into test_vegetables values(?,?,?,?,?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,vegatables.getProductID());
        pstmt.setString(2,vegatables.getProductName());
        pstmt.setString(3,vegatables.getSalerName());
        pstmt.setInt(4,vegatables.getPrice());
        pstmt.setInt(5,vegatables.getQuantity());

        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return  res;
    }

    //update to-be-completed
    public static int updateDate(Vegetables vegatables)throws Exception{
        Connection conn = Dbutil.getCon();
        String sql = "update test_vegetables set productID=?, productName=?,salerName=?,days=?,quantity=? where productID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1,vegatables.getProductID());
        pstmt.setString(2,vegatables.getProductName());
        pstmt.setString(3,vegatables.getSalerName());
        pstmt.setInt(4,vegatables.getPrice());
        pstmt.setInt(5,vegatables.getQuantity());

        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return res;

    }

    //dedlete
    public  static  int deleteData(Vegetables vegatables)throws Exception{
        Connection conn = dbutil.getCon();
        String sql = "delete from test_vegetables where productID=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, vegatables.getProductID());
        int res = pstmt.executeUpdate();
        dbutil.close(pstmt,conn);
        return res;
    }
}
