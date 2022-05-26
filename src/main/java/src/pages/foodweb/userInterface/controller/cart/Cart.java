package src.pages.foodweb.userInterface.controller.cart;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

public class Cart implements Serializable {

    private ArrayList<LineItem> items;
    private int countItem;
    private float totalPrice;

    public Cart() {
        items = new ArrayList<LineItem>();
        countItem = 0;
        totalPrice = 0;
    }

//    public Cart() {
//        items = new ArrayList<LineItem>();
//    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCountItem(){
        return countItem;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotalPrice());
    }

    public void addItem(LineItem item) {

        long id = item.getFood().getFid();
        int quantity = item.getQuantity();

        //Tính tổng giỏ hàng
        totalPrice = 0;
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).getFood().getFid() != id){
                totalPrice += items.get(i).getTotal();
                System.out.println(totalPrice);
            }
        }

        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getFood().getFid() == id) {
                lineItem.setQuantity(quantity);
                totalPrice += lineItem.getTotal();
                return;
            }
        }

        items.add(item);
        countItem = items.size();
        totalPrice += (float) item.getTotal();

    }

    public void removeItem(LineItem item) {
        long id = item.getFood().getFid();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getFood().getFid() == id) {
                totalPrice -= lineItem.getTotal();
                items.remove(i);
                countItem -=1;
                return;
            }
        }
    }
}