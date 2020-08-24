package domain;

public class  Administrator {
    private String a_name;
    private String a_ID;
    private String a_password;

    public Administrator(){}
    public Administrator(String a_name,String a_ID,String a_password){
        this.a_name=a_name;
        this.a_ID=a_ID;
        this.a_password=a_password;
    }

    public String getA_name(){return a_name;}

    public void setA_name(String a_name){this.a_name=a_name;}

    public String getA_ID(){return a_ID;}

    public void setA_ID(String a_ID){this.a_ID=a_ID;}

    public String getA_password(){return a_password;}

    public void setA_password(String a_ID){this.a_ID=a_ID;}

    @Override
    public String toString() {
        return "Administrator{" +
                "administrator_name='" + a_name + '\'' +
                ", administrator_ID='" + a_ID + '\'' +
                ", administrator_password='" + a_password + '\'' +
                '}';
    }
}
