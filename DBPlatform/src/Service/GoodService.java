package Service;

import domain.Good;

import java.util.List;

public interface GoodService {
    public void addGood(Good good);
    public void deleteGoodByID(String id);
    public void updateGood(Good good);
    public Good queryGoodById(String id);
    public List<Good> queryGoods();
    public List<Good> queryGoodsBySomeInformation(String s);
    public List<Good> queryGoodsByKind(String s);
}
