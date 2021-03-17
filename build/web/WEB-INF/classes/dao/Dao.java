/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DbContext;
import entity.Product;

import entity.User;
import entity.Usercart;
import entity.category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admi
 */
public class Dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
     private final String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Shop;user=sa;password=123456";
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                        ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getCateIdProduct(String cateID) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where cateid = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                        ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> searchProduct(String Pname) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where name like ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + Pname + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                        ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public List<category> getAllCategory() {
        List<category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new category(
                        rs.getString(1),                       
                        rs.getString(2),
                        rs.getString(3)
                        ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Product getAllProduct_Sell(String id) {
        Product v = new Product();
        String query = "select * from product where id = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                v = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
            }
        } catch (Exception e) {
        }
        return v;
    }
    
    public User login(String user,String pass){
        User us = new User();
        String query = "select * from Account where [username] = ? and passwword = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public User checkUser(String user){
        User us = new User();
        String query = "select * from Account where [username] = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void getUser(String User,String pass,String name,String address,String phone){
        String query = "INSERT INTO Account  VALUES (?,?,0,?,?,?)";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, User);
            ps.setString(2, pass);
            ps.setString(3, name);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void setDeleteProduct(String id){
        String query = "DELETE FROM PRODUCT where id = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void setDeleteCart(int id,String username){
        String query = "DELETE FROM Cart where id = ? and username = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2,username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void getInsertProduct(String id,String name,float price,String cid,String image,int sl){
        String query = "Insert Into Product Values(?,?,?,?,?,?)";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setFloat(3, price);
            ps.setString(4, cid);
            ps.setString(5, image);
            ps.setInt(6, sl);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void InsertUserCart(String username,String id,String name,float price,String image,int sl){
        String query = "Insert Into Cart Values(?,?,?,?,?,?)";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, id);
            ps.setString(3, name);
            ps.setFloat(4, price);
            ps.setString(5, image);
            ps.setInt(6, sl);
        } catch (Exception e) {
        }
    }
    
    public List<Usercart> getUsercarts(String user){
        List<Usercart> list = new ArrayList<>();
        Product p = new Product();
        String query = "SELECT * FROM Cart c,product p Where c.id = p.id and c.username = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(
                        new Usercart(
                                rs.getString(1),
                                new Product(rs.getInt(2), rs.getString(5),rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9)),
                                rs.getInt(3)
                        )
                
                );
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void InsertCart(String User,int id,int sl){
        String query = "INSERT INTO Cart  VALUES (?,?,?)";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, User);
            ps.setInt(2, id);
            ps.setInt(3, sl);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void UpdateCart(String User,int id,int sl){
        String query = "UPDATE Cart SET sl = ? Where username = ? and id = ?";
        try {
            conn = DbContext.getDBConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sl);
            ps.setString(2, User);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        Dao dao = new Dao();
//        List<category> list = dao.getAllCategory();
//        for(category v:list){
//            System.out.println(v.getNameT()+" "+v.getCid()+" "+v.getImageT());
//        }
        if(dao.login("Cuong123","123") == null){
            System.out.println("1");
        }
        else System.out.println(dao.login("Cuong123","123").getPassword());
    }
}
