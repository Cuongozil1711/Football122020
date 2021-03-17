/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Cart {
    private Product cart;
    private int soluong;
    private int mahang;

    public Cart(Product cart, int soluong, int mahang) {
        this.cart = cart;
        this.soluong = soluong;
        this.mahang = mahang;
    }

    public Cart() {
    }

    public Product getCart() {
        return cart;
    }

    public void setCart(Product cart) {
        this.cart = cart;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getMahang() {
        return mahang;
    }

    public void setMahang(int mahang) {
        this.mahang = mahang;
    }
    
    
    
}
