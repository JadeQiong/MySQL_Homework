package test;

import Util.Jdbcutil;
import org.junit.Test;

public class jdbcUtilTest {

    @Test
    public void testjdbcUtil()
    {
        System.out.println(Jdbcutil.getConnection());
    }
}
