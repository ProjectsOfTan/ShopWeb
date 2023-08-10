/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.DBContext;
import Model.Product;
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
public class Product_SizeDAO extends DBContext {

    public List<Size> getListSizeByID(int id_pro) {
        Size s = new Size();
        List<Size> list = new ArrayList<>();
        SizeDAO sdb = new SizeDAO();
        String sql = "select * from size_product where id_pro = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id_pro);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id_size = rs.getInt(1);
                list.add(sdb.getSizeById(id_size));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getSizeByID in Product_SizeDAO: " + e);
        }
        return null;
    }
    
    public List<Product> getListProByID(int id_size) {
        List<Product> list = new ArrayList<>();
        ProductDAO pdb = new ProductDAO();
        String sql = "select * from size_product where id_size = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id_size);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id_pro = rs.getInt(2);
                list.add(pdb.getProductById(id_pro));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getListProByID in Product_SizeDAO: " + e);
        }
        return null;
    }

    public void insert(Product p, List<Size> list) {
        String sql = "INSERT INTO [dbo].[size_product]\n"
                + "           ([id_size]\n"
                + "           ,[id_pro])\n"
                + "     VALUES (?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            connection.setAutoCommit(false);
            for (int i = 0; i < list.size(); i++) {
                stm.setInt(1, list.get(i).getId());
                stm.setInt(2, p.getId());
                stm.addBatch();
            }
            stm.executeBatch();
            connection.commit();
        } catch (SQLException e) {
            System.out.println("insert in Product_SizeDAO: " + e);
        }
    }

    public void delete(int id_pro) {
        String sql = "DELETE FROM [dbo].[size_product]\n"
                + "      WHERE id_pro = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id_pro);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insert in Product_SizeDAO: " + e);
        }
    }
    
    public void deleteList(List<Size> list) {
        String sql = "DELETE FROM [dbo].[size_product]\n"
                + "      WHERE id_size = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            connection.setAutoCommit(false);
            for (int i = 0; i < list.size(); i++) {
                stm.setInt(1, list.get(i).getId());
                stm.addBatch();
            }
            stm.executeBatch();
            connection.commit();
        } catch (SQLException e) {
            System.out.println("insert in Product_SizeDAO: " + e);
        }
    }

    public void update(Product p, List<Size> listsize) {
        String sql = "UPDATE [dbo].[size_product]\n"
                + "   SET [id_size] = ?\n"
                + "      ,[id_pro] = ?\n"
                + " WHERE id_pro = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
//            connection.setAutoCommit(false);
            for (int i = 0; i < listsize.size(); i++) {
                stm.setInt(1, listsize.get(i).getId());
                stm.setInt(2, p.getId());
                stm.setInt(3, p.getId());
                stm.executeUpdate();
//                stm.addBatch();
            }
//            stm.executeBatch();
//            stm.clearBatch();
//            connection.commit();

        } catch (SQLException e) {
            System.out.println("update in Product_SizeDAO: " + e);

        }
    }
    
    public boolean check(int id_pro,int id_size){
        String sql = "select * from size_product where id_pro = ? and id_size = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id_pro);
            stm.setInt(2, id_size);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Check product_size: "+e);
        }
        return false;
    }
    
}
