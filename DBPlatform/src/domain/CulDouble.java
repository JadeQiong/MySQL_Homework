package domain;

import java.math.BigDecimal;

public class CulDouble {
    //double相加
    public static  double sum(double d1,double d2){
        BigDecimal bd1=new BigDecimal(Double.toString(d1));
        BigDecimal bd2=new BigDecimal(Double.toString(d2));
        return bd1.add(bd2).doubleValue();
    }
    //double相减
    public static  double sub(double d1,double d2){
        BigDecimal bd1 =new BigDecimal(Double.toString(d1));
        BigDecimal bd2 =new BigDecimal(Double.toString(d2));
        return bd1.subtract(bd2).doubleValue();
    }
    //double乘法
    public static double mul(double d1,double d2){
        BigDecimal bd1=new BigDecimal(Double.toString(d1));
        BigDecimal bd2=new BigDecimal(Double.toString(d2));
        return  bd1.multiply(bd2).doubleValue();
    }
    //double除法
    //scale为小数点位数
    public static double div(double d1,double d2,int scale){
        //未判断除数是否为0
        BigDecimal bd1 =new BigDecimal(Double.toString(d1));
        BigDecimal bd2 =new BigDecimal(Double.toString(d2));
        return bd1.divide(bd2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    //double转string去掉后面的0
    public static String getString(double i){
        String s=String.valueOf(i);
        if(s.indexOf(".")>0){
            //正则表达式
            s=s.replaceAll("0+?$","");//去掉后面无用的0
            s=s.replaceAll("[.]$","");//如果小数点后全是0则去掉小数点
        }
        return s;
    }
}
