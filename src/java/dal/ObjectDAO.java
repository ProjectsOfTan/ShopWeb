/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Category;
import Model.DBContext;
import Model.Ob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class ObjectDAO extends DBContext{
    public List<Ob> getall() {
        List<Ob> list = new ArrayList<>();
        String sql = "select * from object";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String ob = rs.getString(2);
                list.add(new Ob(id, ob));
            }
        } catch (SQLException e) {
            System.out.println("getallOb: "+e);
        }
        return list;
    }
    
    public Ob getObById(int id){
        String sql = "select * from object where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Ob o = new Ob(rs.getInt(1), rs.getString(2));
                return o;
            }
        } catch (SQLException e) {
            System.out.println("getObById: "+e);
        }
        return null;
    }
    
    public Ob getObByName(String ob){
        String sql = "select * from object where ob = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, ob);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Ob o = new Ob(rs.getInt(1), rs.getString(2));
                return o;
            }
        } catch (SQLException e) {
            System.out.println("getObByName: "+e);
        }
        return null;
    }
}
