package com.panli.dbutil;
import java.sql.*;
public class Dbutil {
    private static String jdbcName ="com.mysql.cj.jdbc.Driver";
    private static String dbUrl = "jdbc:mysql://localhost:3306/product?serverTimezone=UTC";
    private static String dbUser = "root";
    private static String dbPassword = "";
    // get connection
    public static  Connection getCon() throws Exception{
        Class.forName(jdbcName);
        Connection conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
        return conn;
    }
    //close connection
    public  static void close(Statement stmt, Connection conn) throws Exception{
        if(stmt!=null){
            stmt.close();
            if(conn!=null){
                conn.close();
            }
        }
    }

    public  static void close(CallableStatement cstmt, Connection conn) throws Exception{
        if(cstmt!=null){
            cstmt.close();
            if(conn!=null){
                conn.close();
            }
        }
    }

    public  static void close(PreparedStatement pstmt, Connection conn) throws SQLException{
        if(pstmt!=null){
            pstmt.close();
            if(conn!=null){
                conn.close();
            }
        }
    }

    public  void close(ResultSet rs, PreparedStatement pstmt,Connection conn) throws Exception{
        if(rs!=null){
            rs.close();
            if(pstmt != null){
                pstmt.close();
                if(conn!=null){
                    conn.close();
                }}
        }
    }


}
