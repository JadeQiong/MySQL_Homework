package domain;

public class Saler {
    private String saler_name;
    private String saler_ID;
    private String password;

    public Saler(){}

    public Saler(String saler_name, String saler_ID, String password) {
        this.saler_name = saler_name;
        this.saler_ID = saler_ID;
        this.password = password;
    }

    public String getSaler_name() {
        return saler_name;
    }

    public void setSaler_name(String saler_name) {
        this.saler_name = saler_name;
    }

    public String getSaler_ID() {
        return saler_ID;
    }

    public void setSaler_ID(String saler_ID) {
        this.saler_ID = saler_ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Saler{" +
                "saler_name='" + saler_name + '\'' +
                ", saler_ID='" + saler_ID + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
