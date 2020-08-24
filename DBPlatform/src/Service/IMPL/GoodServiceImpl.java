package Service.IMPL;

import Service.GoodService;
import dao.IMPL.gooddaoImpl;
import dao.gooddao;
import domain.Good;

import java.util.List;

public class GoodServiceImpl implements GoodService {

    private gooddao gooddao=new gooddaoImpl();
    @Override
    public void addGood(Good good) {
        if(gooddao.QueryByOne(good.getGood_ID())==null)
        gooddao.addgood(good);

        else System.out.println("不行");
    }

    @Override
    public void deleteGoodByID(String id) {
       gooddao.deletegood(id);
    }

    @Override
    public void updateGood(Good good) {
       gooddao.updategood(good);
    }

    @Override
    public Good queryGoodById(String id) {
        return gooddao.QueryByOne(id);
    }

    @Override
    public List<Good> queryGoods() {
        return gooddao.querygoods();
    }

    @Override
    public List<Good> queryGoodsBySomeInformation(String s) {
        return gooddao.queryGoodsBySomeInformation(s);
    }

    @Override
    public List<Good> queryGoodsByKind(String s) {
        return gooddao.queryByKind(s);
    }

}
