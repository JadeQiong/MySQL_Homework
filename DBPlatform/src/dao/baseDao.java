package dao;

import Util.Jdbcutil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class baseDao {
    private QueryRunner queryRunner=new QueryRunner();

    public int update(String sql,Object...args){
        Connection connection= Jdbcutil.getConnection();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return -1;
    }

    public <T> T QueryForOne(Class<T> type,String sql,Object...args)  {
        Connection connection=Jdbcutil.getConnection();
        try {
            return queryRunner.query(connection,sql,new BeanHandler<T>(type),args);
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        finally
        {
            Jdbcutil.close(connection);
        }
        return null;
    }

    public <T>List<T> QueryForList(Class<T> type, String sql, Object...args)  {
        Connection connection=Jdbcutil.getConnection();
        try {
            return (List<T>) queryRunner.query(connection,sql,new BeanListHandler<T>(type),args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally
        {
            Jdbcutil.close(connection);
        }
        return null;
    }

    public Object queryForSingleValue(String sql,Object...args)
    {
        Connection connection=Jdbcutil.getConnection();
        try {
            queryRunner.query(connection,sql,new ScalarHandler(),args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public <T>List<T> queryAsList(Class<T> type,String sql, Object...args){
        Connection connection=Jdbcutil.getConnection();
        try {
            return (List<T>) queryRunner.query(connection,sql,new ColumnListHandler(),args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally
        {
            Jdbcutil.close(connection);
        }
        return null;
    }
}
