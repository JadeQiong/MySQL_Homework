package Util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.util.JdbcUtils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class Jdbcutil {
    private static DruidDataSource dataSource;

    static{

        try
        {
            FileInputStream fis = new FileInputStream("C:/Users/87179/Desktop/DBPlatform/web/resources/jdbc.properties");
            Properties pro = new Properties();
            pro.load(fis);
            Properties properties=new Properties();

          //  InputStream inputStream= JdbcUtils.class.getClassLoader().getResourceAsStream("resources/jdbc.properties");
          //  properties.load(fis); fis.close();
           // properties.load(inputStream);

            System.out.println(pro.getProperty("username"));
            System.out.println(pro.getProperty("url"));
            System.out.println(pro.getProperty("password"));
            System.out.println(pro.getProperty("driverClassName"));

            dataSource=(DruidDataSource) DruidDataSourceFactory.createDataSource(pro);
        }
        catch (Exception e)
        {
//            System.out.println("GG");
          e.printStackTrace();
        }
    }

    public static Connection getConnection()
    {
        Connection conn=null;

        try {
            conn=dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void close(Connection conn)
    {
        if(conn!=null)
        {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
