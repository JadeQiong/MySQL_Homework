package Service.IMPL;

import Service.DealService;
import dao.dealdao;
import dao.itemdao;
import dao.shoppingdao ;
import dao.customerdao;
import dao.gooddao;
import dao.IMPL.dealdaoImpl;
import dao.IMPL.itemdaoImpl ;
import dao.IMPL.shoppingdaoImpl ;
import dao.IMPL.customerdaoImpl ;
import dao.IMPL.gooddaoImpl;
import domain.Shopping;
import domain.Item;
import domain.Deal;
import domain.Customer;
import domain.Good;
import domain.IDUtils;
import domain.CulDouble;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DealServiceImpl implements DealService{
    private dealdao dd=new dealdaoImpl();
    private itemdao it=new itemdaoImpl();
    private shoppingdao sd=new shoppingdaoImpl();
    private customerdao cd=new customerdaoImpl();
    private gooddao gd=new gooddaoImpl();
    private IDUtils idUtils;
    private CulDouble cul;
    @Override
    public void addFromShopping(String customer_ID) {

        Shopping shopping=sd.printUsershopping(customer_ID);
        if(shopping.getGood_ID().size()==0){
            System.out.println("购物车为空");
            return;
        }
        else {
            String deal_ID = idUtils.createID();
            Item i = new Item(deal_ID, shopping.getGood_ID(), shopping.getNumber(), shopping.getPrice());
            String area = cd.queryByUserID(customer_ID).getArea();
            //更新wallet
            Customer customer = cd.queryByUserID(customer_ID);
            if (customer.getWallet() < i.amountPrice())
                System.out.println("账户余额不足");
            else {
                Double wallet = cul.sub(customer.getWallet(),i.amountPrice());
                //钱包余额
                System.out.println("账户余额为："+wallet);
                cd.culwallet(customer_ID, wallet);
                //更新商品信息
                int size = i.getGood_ID().size();
                String gID;
                int number = 0;
                Good good;
                for (int m = 0; m < size; m++) {
                    gID = i.getGood_ID().get(m);
                    good = gd.QueryByOne(gID);
                    number = good.getNumber() - i.getNumber().get(m);
                    gd.culgood(gID, number);
                }
                //添加deal数据库
                dd.addDeal(deal_ID, customer_ID, i.amountPrice(), new Date(), area);
                //输出订单总价
                System.out.println("订单总价："+i.amountPrice());
                //添加item数据库
                it.addShoppingItem(deal_ID, shopping);
                //删除购物车
                sd.deleteall(customer_ID);
            }
        }
    }

    @Override
    public void addSomeFromShopping(String customer_ID, List<String> good_id) {

        Shopping shopping = sd.printUsershopping(customer_ID);
        if (shopping.getGood_ID().size()==0) {
            System.out.println("购物车为空");
            return;
        } else if (good_id.size()==0) {
            System.out.println("请选择需要购买的商品");
            return;
        } else {
            String deal_ID = idUtils.createID();
            List<String> good_ID = shopping.getGood_ID();
            List<Integer> number = new ArrayList<Integer>();
            List<Double> price = new ArrayList<Double>();
            for (int i = 0; i < good_id.size(); i++) {
                number.add(shopping.getNumber().get(good_ID.indexOf(good_id.get(i))));
                price.add(shopping.getPrice().get(good_ID.indexOf(good_id.get(i))));
            }
            Item i = new Item(deal_ID, good_id, number, price);
            String area = cd.queryByUserID(customer_ID).getArea();
            //更新wallet
            Customer customer = cd.queryByUserID(customer_ID);
            if (customer.getWallet() < i.amountPrice())
                System.out.println("账户余额不足");
            else {
                Double wallet = cul.sub(customer.getWallet(),i.amountPrice());
                //用户余额
                System.out.println("账户余额为："+wallet);
                cd.culwallet(customer_ID, wallet);
                //更新商品
                int size = i.getGood_ID().size();
                String gID;
                int num = 0;
                Good good;
                for (int m = 0; m < size; m++) {
                    gID = i.getGood_ID().get(m);
                    good = gd.QueryByOne(gID);
                    num = good.getNumber() - i.getNumber().get(m);
                    gd.culgood(gID, num);
                }
                //添加订单数据库
                dd.addDeal(deal_ID, customer_ID, i.amountPrice(), new Date(), area);
                //输出订单总价
                System.out.println(i.amountPrice());
                //添加item数据库
                it.addItem(deal_ID, good_id, number, price);
                //删除购物车
                for (int n = 0; n < good_id.size(); n++) {
                    sd.deleteshopping(customer_ID, good_id.get(n));
                }
            }
        }

    }

    @Override
    public void cancelDeal(String deal_ID) {
        Deal d=dd.queryByDealID(deal_ID);
        Item i=it.printItem(deal_ID);
        //还原customer的wallet
        Customer customer=cd.queryByUserID(d.getCustomer_ID());
        Double wallet = cul.sum(customer.getWallet(), i.amountPrice());
        //余额信息
        System.out.println("账户余额为："+wallet);
        cd.culwallet(d.getCustomer_ID(), wallet);
        //更新商品信息
        int size = i.getGood_ID().size();
        String gID;
        int number = 0;
        Good good;
        for (int m = 0; m < size; m++) {
            gID = i.getGood_ID().get(m);
            good = gd.QueryByOne(gID);
            number = good.getNumber() + i.getNumber().get(m);
            gd.culgood(gID, number);
        }
        //删除item数据库
        it.deleteall(deal_ID);
        //删除deal数据库
        dd.deleteDeal(deal_ID);
    }

    @Override
    public void queryDealByDealID(String deal_ID) {
        Deal d=dd.queryByDealID(deal_ID);
        System.out.println(d.toString());
    }

    @Override
    public void queryDealByCustomerID(String customer_ID) {
        Deal d=dd.queryByCustomerID(customer_ID);
        System.out.println(d.toString());
    }

    @Override
    public void printDetail(String deal_ID) {
        Item i=it.printItem(deal_ID);
        System.out.println(i.toString());
    }

}
