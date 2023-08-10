/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Category;
import Model.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class CategoryDAO extends DBContext{
    public List<Category> getall() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Category(id, name));
            }
        } catch (SQLException e) {
            System.out.println("getallCategory: "+e);
        }
        return list;
    }
    
    public List<Category> gethalf() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from categories where id<=13";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Category(id, name));
            }
        } catch (SQLException e) {
            System.out.println("getallCategory: "+e);
        }
        return list;
    }
    
    public Category getCategoryById(int id){
        String sql = "select * from categories where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println("getCategoryById: "+e);
        }
        return null;
    }
    
    public Category getCategoryByName(String name){
        String sql = "select * from categories where name = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println("getCategoryByName: "+e);
        }
        return null;
    }
}
