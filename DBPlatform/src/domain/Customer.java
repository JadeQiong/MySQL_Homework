package domain;

public class Customer {
    private String customer_name;
    private String customer_ID;
    private String customer_password;
    private String area;
    private String phone_number;
    private Double wallet;

    public Customer()
    {}
    public Customer(String customer_name, String customer_ID, String customer_password, String area, String phone_number, Double wallet) {
        this.customer_name = customer_name;
        this.customer_ID = customer_ID;
        this.customer_password = customer_password;
        this.area = area;
        this.phone_number = phone_number;
        this.wallet = wallet;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(String customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public void setCustomer_password(String customer_password) {
        this.customer_password = customer_password;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public Double getWallet() {
        return wallet;
    }

    public void setWallet(Double wallet) {
        this.wallet = wallet;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customer_name='" + customer_name + '\'' +
                ", customer_ID='" + customer_ID + '\'' +
                ", customer_password='" + customer_password + '\'' +
                ", area='" + area + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", wallet=" + wallet +
                '}';
    }
}
