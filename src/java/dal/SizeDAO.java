/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Category;
import Model.DBContext;
import Model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class SizeDAO extends DBContext{
    public List<Size> getall() {
        List<Size> list = new ArrayList<>();
        String sql = "select * from size";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String size = rs.getString(2);
                list.add(new Size(id, size));
            }
        } catch (SQLException e) {
            System.out.println("getallSize: "+e);
        }
        return list;
    }
    
    public Size getSizeById(int id){
        String sql = "select * from size where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Size c = new Size(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println("getSizeById: "+e);
        }
        return null;
    }
}
