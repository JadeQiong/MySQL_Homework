package dao;

import domain.Good;

import java.util.List;

public interface gooddao {
    public int addgood(Good good);
    public int culgood(String good_ID,Integer number);
    public int updategood(Good good);
    public int deletegood(String good_ID);
    public Good QueryByOne(String good_ID);

    public List<Good> querygoods();
    public List<Good> querygoodsByKind(String kind);
    public List<Good> queryGoodsBySomeInformation(String s);
    public List<Good> queryByKind(String s);
    public List<Good> queryBySalerID(String s);
}
