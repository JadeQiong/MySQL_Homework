package domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IDUtils {

    public static String createID() {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");//设置日期格式
        String timeStamp = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳

        String code = (timeStamp+"").substring(6,16);
        return  code;
    }

}
