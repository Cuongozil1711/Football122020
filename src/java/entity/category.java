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
public class category {
    private String cid;
    private String nameT;
    private String imageT;

    public category(String cid, String nameT, String imageT) {
        this.cid = cid;
        this.nameT = nameT;
        this.imageT = imageT;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getNameT() {
        return nameT;
    }

    public void setNameT(String nameT) {
        this.nameT = nameT;
    }

    public String getImageT() {
        return imageT;
    }

    public void setImageT(String imageT) {
        this.imageT = imageT;
    }

    
}
