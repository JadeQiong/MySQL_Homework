package Service.IMPL;

import Service.SalerService;
import dao.IMPL.salerdaoImpl;
import dao.salerdao;
import domain.Saler;

public class SalerServiceImpl implements SalerService{
    private salerdao s=new salerdaoImpl();

    @Override
    public Saler login(String id, String pw) {
        return s.queryBySalerIDandPassword(id,pw);
    }

    @Override
    public void register(Saler saler) {
        s.saveSaler(saler);
    }
}
