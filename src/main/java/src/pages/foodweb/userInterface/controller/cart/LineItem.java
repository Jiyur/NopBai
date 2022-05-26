package src.pages.foodweb.userInterface.controller.cart;

import model.Food;

import java.io.Serializable;
import java.text.NumberFormat;

public class LineItem implements Serializable {

    private Food food;
    private int quantity;

    public LineItem(){

    }
    public LineItem(Food food, int quantity) {
        super();
        this.food = food;
        this.quantity = quantity;
    }

    public void setFood(Food p) {
        food = p;
    }

    public Food getFood() {
        return food;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        double total = food.getPrice() * quantity;
        return total;
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }
}