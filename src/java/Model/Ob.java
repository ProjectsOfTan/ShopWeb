/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author wth0z
 */
public class Ob {
    int id;
    String Ob;

    public Ob() {
    }

    public Ob(int id, String Ob) {
        this.id = id;
        this.Ob = Ob;
    }
    
    public Ob(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOb() {
        return Ob;
    }

    public void setOb(String Ob) {
        this.Ob = Ob;
    }
    
}
