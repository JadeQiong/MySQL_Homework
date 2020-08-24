package dao;

import domain.Administrator;

public interface administratordao {
    public Administrator queryByAID(String AID);
    public Administrator queryByAIDandPassword(String AID,String APassword);
    public int saveA(Administrator administrator);
}
