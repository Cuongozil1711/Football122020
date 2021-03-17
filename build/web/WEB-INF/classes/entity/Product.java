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
public class Product {
    int id;
    String name;
    float price;
    String cadeid;
    String image;
    int soluong;
    public Product() {
    }

    public Product(int id, String name, float price, String cadeid, String image, int soluong) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.cadeid = cadeid;
        this.image = image;
        this.soluong = soluong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCadeid() {
        return cadeid;
    }

    public void setCadeid(String cadeid) {
        this.cadeid = cadeid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    
}
