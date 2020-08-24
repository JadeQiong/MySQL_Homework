package Service;

import domain.Saler;

public interface SalerService {
    public Saler login(String id,String pw);
    public void register(Saler saler);
}
