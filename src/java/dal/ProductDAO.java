/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Category;
import Model.DBContext;
import Model.Ob;
import Model.Product;
import Model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author wth0z
 */
public class ProductDAO extends DBContext {

    public List<Product> getall() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }
    
    public int getSizeOfList() {
        String sql = "select count(id) from product";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getSizeOfList: " + e);
        }
        return 0;
    }

    public List<Product> gethalf() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where (id <= 136 and id>=117) "
                + "or (id<= 91 and id >=80 )";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }

    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where cate_id = ?";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, cid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getProById: " + e);
        }
        return list;
    }

    public Product getProductsByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where name = ?";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                return p;
            }
        } catch (SQLException e) {
            System.out.println("getProById: " + e);
        }
        return null;
    }

    public List<Product> getListProductsByName(String name, int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where name = N'" + name.trim() + "' and id != ?";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getProById: " + e);
        }
        return null;
    }

    public Product getProductById(int id) {
        String sql = "select * from product where id = ?";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                return p;
            }
        } catch (SQLException e) {
            System.out.println("getProductById: " + e);
        }
        return null;
    }

    public void delete(int id) {
        Product_SizeDAO psdb = new Product_SizeDAO();
        String sql = "DELETE FROM product\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            psdb.delete(id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteproduct: " + e);
        }
    }

    public void beforeInsert() {
        String sql = "Declare @total int  \n"
                + "select @total = COUNT(name) from product\n"
                + "DBCC CHECKIDENT ('product', RESEED, @total);";
        try {
            connection.createStatement().execute(sql);
        } catch (SQLException e) {
            System.out.println("beforeInsert: " + e);
        }
    }

    public void insert(Product p) {
        Product_SizeDAO psdb = new Product_SizeDAO();
        String des = "";
        for (int i = 0; i < p.getDesc().length; i++) {
            if (i == p.getDesc().length - 1) {
                des += p.getDesc()[i];
            } else {
                des += p.getDesc()[i] + ".";
            }
        }
        ProductDAO pdb = new ProductDAO();
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[object_id]\n"
                + "           ,[color]\n"
                + "           ,[desc]\n"
                + "           ,[unit_in_stock]\n"
                + "           ,[unit_price]\n"
                + "           ,[discount]\n"
                + "           ,[img]\n"
                + "           ,[cate_id])\n"
                + "     VALUES (N'" + p.getName().trim()
                + "',?,N'" + p.getColor().trim() + "',N'" + des.trim() + "',?,?,?,N'" + p.getImg().trim() + "',?)";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, p.getOb().getId());
            pstm.setString(2, p.getUnit_in_stock());
            pstm.setString(3, p.getUnit_price());
            pstm.setInt(4, Integer.parseInt(p.getDiscount()));
            pstm.setInt(5, p.getCategory().getId());
            pstm.executeUpdate();
            psdb.insert(pdb.getTheLastProduct(), p.getListsize());
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Product getTheLastProduct() {
        String sql = "Declare @total int  \n"
                + "select @total = COUNT(name) from product\n"
                + "select * from product where id = @total\n";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                return p;
            }
        } catch (SQLException e) {
            System.out.println("getTheLastProduct: " + e);
        }
        return null;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> u = new ArrayList<>();
        for (int i = start; i < end; i++) {
            u.add(list.get(i));
        }
        return u;
    }
    
    public List<Product> getListByPage1(int start, int top) {
        List<Product> list = new ArrayList<>();
        String sql = "select top "+top+" * from product where id >= ? ";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, start);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                System.out.println("ok");
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getListByPage1: " + e);
        }
        return list;
    }

    public List<Product> search(String key) {
        List<Product> list = new ArrayList<>();
        Product_SizeDAO psdb = new Product_SizeDAO();
        String sql = "select * from product where 1=1";
        try {
            ResultSet rs;
            if (key != null && !key.isEmpty()) {
                sql += " and (name like N'%" + key.trim() + "%'" + " or color like N'%" + key.trim() + "%'";
                CategoryDAO cdb = new CategoryDAO();
                Category c = cdb.getCategoryByName(key);
                if (c != null) {
                    sql += " or cate_id = " + c.getId();
                }
                try {
                    int num = Integer.parseInt(key);
                    sql += " or id = " + key + ")";
                } catch (Exception e) {
                    System.out.println("Search product so :" + e);
                    sql += ")";
                }
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            } else {
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            }
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                ObjectDAO odb = new ObjectDAO();
                Ob o = odb.getObById(rs.getInt(3));
                String color = rs.getString(4);
                String[] desc = rs.getString(5).split("\\.");
                String unit_in_stock = rs.getString(6);
                String unit_price = rs.getString(7);
                String discount = String.valueOf(rs.getInt(8));
                String img = rs.getString(9);
                CategoryDAO cdb = new CategoryDAO();
                Category c = cdb.getCategoryById(rs.getInt(10));
                list.add(new Product(id, name, color, desc, unit_in_stock,
                        unit_price, discount, img, c, o, psdb.getListSizeByID(rs.getInt(1))));
            }
        } catch (SQLException e) {
            System.out.println("searchUser:" + e);
        }

        return list;
    }

    public void update(Product p) {
        Product_SizeDAO psdb = new Product_SizeDAO();
        String des = "";
        for (int i = 0; i < p.getDesc().length; i++) {
            if (i == p.getDesc().length - 1) {
                des += p.getDesc()[i];
            } else {
                des += p.getDesc()[i] + ".";
            }
        }
        ProductDAO pdb = new ProductDAO();
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "	,[object_id] = ?\n"
                + "      ,[color] = ?\n"
                + "      ,[desc] = ?\n"
                + "      ,[unit_in_stock] = ?\n"
                + "      ,[unit_price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[cate_id] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setNString(1, p.getName());
            pstm.setInt(2, p.getOb().getId());
            pstm.setString(3, p.getColor());
            pstm.setNString(4, des);
            pstm.setInt(5, Integer.parseInt(p.getUnit_in_stock()));
            pstm.setString(6, p.getUnit_price());
            pstm.setInt(7, Integer.parseInt(p.getDiscount()));
            pstm.setNString(8, p.getImg());
            pstm.setInt(9, p.getCategory().getId());
            pstm.setInt(10, p.getId());
            pstm.executeUpdate();
            List<Size> listinsert = new ArrayList<>();
            for (int i = 0; i < p.getListsize().size(); i++) {
                if (!psdb.check(p.getId(), p.getListsize().get(i).getId())) {
                    listinsert.add(p.getListsize().get(i));
                }
            }
            psdb.insert(p, listinsert);
            List<Size> listdelete = new ArrayList<>();
            List<Size> listSize = psdb.getListSizeByID(p.getId());
            int j = 0;
            for (int i = 0; i < listSize.size(); i++) {
                for (j = 0; j < p.getListsize().size(); j++) {
                    if (listSize.get(i).getId() == p.getListsize().get(j).getId()) {
                        break;
                    }
                }
                if (j == p.getListsize().size()) {
                    listdelete.add(listSize.get(i));
                }
                j = 0;
            }
            psdb.deleteList(listdelete);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getListSale() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where discount > 0";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }

    public List<Product> getHalfListSale() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where discount > 0 and id<=18 and id>=9";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }

    public List<Product> getListOb(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where object_id = ? and discount = 0";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }

    public List<Product> getListByOb(int ob) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where object_id = ?";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setInt(1, ob);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }

    public List<Product> filter(String key, String chose, String[] cate,
            String[] size, String[] color, String price_filter) {
        List<Product> list = new ArrayList<>();
        Product_SizeDAO psdb = new Product_SizeDAO();
        String sql = "select * from product where 1=1";
        try {
            ResultSet rs;
            if ((key != null && !key.isEmpty())
                    || (chose != null && !chose.isEmpty())
                    || (cate != null && cate.length != 0)
                    || (size != null && size.length != 0)
                    || (color != null && color.length != 0)
                    || (price_filter != null && !price_filter.isEmpty())) {
                if (key != null && !key.isEmpty()) {
                    sql += " and (name like N'%" + key.trim() + "%'" + " or color like N'%" + key.trim() + "%'";
                    CategoryDAO cdb = new CategoryDAO();
                    Category c = cdb.getCategoryByName(key);
                    if (c != null) {
                        sql += " or cate_id = " + c.getId();
                    }
                    try {
                        int num = Integer.parseInt(key);
                        sql += " or id = " + key + ")";
                    } catch (Exception e) {
                        System.out.println("Search product so :" + e);
                        sql += ")";
                    }
                }
                if (cate != null && cate.length != 0) {
                    if (cate.length == 1) {
                        sql += " and (cate_id = " + cate[0].trim() + ")";
                    } else {
                        sql += " and (cate_id = " + cate[0].trim();
                        for (int i = 1; i < cate.length; i++) {
                            if (i + 1 != cate.length) {
                                sql += " or cate_id = " + cate[i].trim();
                            } else {
                                sql += " or cate_id = " + cate[i].trim() + ")";
                            }
                        }
                    }
                }
                if (color != null && color.length != 0) {
                    if (color.length == 1) {
                        sql += " and (color like N'%" + color[0].trim() + "%')";
                    } else {
                        sql += " and (color like N'%" + color[0].trim() + "%'";
                        for (int i = 1; i < color.length; i++) {
                            if (i + 1 != color.length) {
                                sql += " or color like N'%" + color[i].trim() + "%'";
                            } else {
                                sql += " or color like N'%" + color[i].trim() + "%')";
                            }
                        }
                    }
                }
                if (size != null && size.length != 0) {
                    if (size.length == 1) {
                        System.out.println("hello");
                        String sql1 = "select * from \n"
                                + "size_product inner JOIN product\n"
                                + "on\n"
                                + "size_product.id_pro = product.id and id_size = " + size[0];
                        PreparedStatement st1 = connection.prepareStatement(sql1);
                        ResultSet rs1 = st1.executeQuery();
                        List<String> str = new ArrayList<>();
                        while (rs1.next()) {
                            str.add(String.valueOf(rs1.getInt("id_pro")));
                        }
                        sql += " and (id = " + str.get(0).trim();
                        for (int i = 1; i < str.size(); i++) {
                            if (i + 1 != str.size()) {
                                sql += " or id = " + str.get(i).trim();
                            } else {
                                sql += " or id = " + str.get(i).trim() + ")";
                            }
                        }
                    } else {
                        String sql1 = "select id_pro,id_size from product, size_product\n"
                                + "where product.id = size_product.id_pro and (id_size = " + size[0];
                        for (int i = 1; i < size.length; i++) {
                            if (i + 1 != size.length) {
                                sql1 += " or id_size = " + size[i].trim();
                            } else {
                                sql1 += " or id_size = " + size[i].trim() + ")";
                            }
                        }
                        PreparedStatement st1 = connection.prepareStatement(sql1);
                        ResultSet rs1 = st1.executeQuery();
                        List<String> str = new ArrayList<>();
                        while (rs1.next()) {
                            str.add(String.valueOf(rs1.getInt("id_pro")));
                        }
                        sql += " and (id = " + str.get(0).trim();
                        for (int i = 1; i < str.size(); i++) {
                            if (i + 1 != str.size()) {
                                sql += " or id = " + str.get(i).trim();
                            } else {
                                sql += " or id = " + str.get(i).trim() + ")";
                            }
                        }
                    }
                }
                if (price_filter != null && !price_filter.isEmpty()) {
                    if (price_filter.equals("1")) {
                        sql += " and (unit_price like '35%.%' or unit_price like '5%.%' "
                                + "or unit_price like '4%.%')";
                    } else if (price_filter.equals("2")) {
                        sql += " and (unit_price like '5%.%' or unit_price like '6%.%' "
                                + "or unit_price like '7%.%')";
                    } else if (price_filter.equals("3")) {
                        sql += " and (unit_price like '7%.%' or unit_price like '8%.%' "
                                + "or unit_price like '9%.%' or unit_price like '1%.%.%')";
                    }
                }
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            } else {
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            }
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                ObjectDAO odb = new ObjectDAO();
                Ob o = odb.getObById(rs.getInt(3));
                String colorp = rs.getString(4);
                String[] desc = rs.getString(5).split("\\.");
                String unit_in_stock = rs.getString(6);
                String unit_price = rs.getString(7);
                String discount = String.valueOf(rs.getInt(8));
                String img = rs.getString(9);
                CategoryDAO cdb = new CategoryDAO();
                Category c = cdb.getCategoryById(rs.getInt(10));
                list.add(new Product(id, name, colorp, desc, unit_in_stock,
                        unit_price, discount, img, c, o, psdb.getListSizeByID(rs.getInt(1))));
            }
        } catch (SQLException e) {
            System.out.println("filter:" + e);
        }
        return list;
    }
    
    public List<Product> gethalfsortDecre() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where (id <= 136 and id>=117) "
                + "or (id<= 91 and id >=80 )"
                + " ORDER BY unit_price desc";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }
    
    public List<Product> gethalfsortIncre() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where (id <= 136 and id>=117) "
                + "or (id<= 91 and id >=80 )"
                + " ORDER BY unit_price asc";
        Product_SizeDAO psdb = new Product_SizeDAO();
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                ObjectDAO o = new ObjectDAO();
                p.setOb(o.getObById(rs.getInt(3)));
                p.setColor(rs.getString(4));
                p.setDesc(rs.getString(5).split("\\."));
                p.setUnit_in_stock(rs.getString(6));
                p.setUnit_price(rs.getString(7));
                p.setDiscount(rs.getString(8));
                p.setImg(rs.getString(9));
                CategoryDAO c = new CategoryDAO();
                p.setCategory(c.getCategoryById(rs.getInt(10)));
                p.setListsize(psdb.getListSizeByID(rs.getInt(1)));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getallPro: " + e);
        }
        return list;
    }
}
