package dao;

import domain.Saler;

public interface salerdao {
    public Saler queryBySalerID(String SalerID);
    public Saler queryBySalerIDandPassword(String SalerID,String SalerPassword);
    public int saveSaler(Saler saler);
}
