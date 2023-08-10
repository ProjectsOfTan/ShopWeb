/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author wth0z
 */
public class Product {
    private int id;
    private String name,color;
    private String[] desc; 
    private String unit_in_stock, unit_price;
    private String discount;
    private String img;
    private Category category;
    private Ob ob;
    private List<Size> listsize;

    public Product() {
    }

    public Product(int id, String name, String color, String[] desc, String unit_in_stock, String unit_price, String discount, String img, Category category, Ob ob, List<Size> listsize) {
        this.id = id;
        this.name = name;
        this.color = color;
        this.desc = desc;
        this.unit_in_stock = unit_in_stock;
        this.unit_price = unit_price;
        this.discount = discount;
        this.img = img;
        this.category = category;
        this.ob = ob;
        this.listsize = listsize;
    }

    public List<Size> getListsize() {
        return listsize;
    }

    public void setListsize(List<Size> listsize) {
        this.listsize = listsize;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Ob getOb() {
        return ob;
    }

    public void setOb(Ob ob) {
        this.ob = ob;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String[] getDesc() {
        return desc;
    }

    public void setDesc(String[] desc) {
        this.desc = desc;
    }

    public String getUnit_in_stock() {
        return unit_in_stock;
    }

    public void setUnit_in_stock(String unit_in_stock) {
        this.unit_in_stock = unit_in_stock;
    }

    public String getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(String unit_price) {
        this.unit_price = unit_price;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
