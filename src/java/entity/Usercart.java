/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Usercart {
    private String usename;
    private Product d;
    private int sl;

    public Usercart(String usename, Product d, int sl) {
        this.usename = usename;
        this.d = d;
        this.sl = sl;
    }

    public Usercart() {
    }

    public String getUsename() {
        return usename;
    }

    public void setUsename(String usename) {
        this.usename = usename;
    }

    public Product getD() {
        return d;
    }

    public void setD(Product d) {
        this.d = d;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    
}
