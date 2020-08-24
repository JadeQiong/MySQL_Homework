package com.panli.model;

public class Vegetables {
    private String prouctID,productName,salerName;
    private  int Price,Quantity;

    public Vegetables(String productid, String productname, String salername,int price, int quantity)
    {
        super();
        this.prouctID=productid;
        this.productName = productname;
        this.salerName = salername;
        this.Price = price;
        this.Quantity =quantity;
    }
    public Vegetables(){
        super();
    }
    public String getProductID(){
        return prouctID;
    }

    public String getProductName() {
        return productName;
    }

    public String getSalerName() {
        return salerName;
    }

    public int getPrice() {
        return Price;
    }
    public int getQuantity(){
        return Quantity;
    }
}
