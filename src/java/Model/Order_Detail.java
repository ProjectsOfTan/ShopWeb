/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author wth0z
 */
public class Order_Detail {
    private int oid;
    private Product product;
    private int quantity;
    private String totalprice;
    private String size;

    public Order_Detail() {
    }

    public Order_Detail(int oid, Product p, int quantity, String totalprice, String size) {
        this.oid = oid;
        this.product = p;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.size = size;
    }

    public String getTotalPrice() {
        return totalprice;
    }

    public void setTotalPrice(String totalprice) {
        this.totalprice = totalprice;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product p) {
        this.product = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
