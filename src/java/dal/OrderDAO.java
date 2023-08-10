/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Cart;
import Model.DBContext;
import Model.Item;
import Model.Order;
import Model.Order_Detail;
import Model.Product;
import Model.User;
import com.microsoft.sqlserver.jdbc.SQLServerPreparedStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class OrderDAO extends DBContext {

    public void addOrder(User u, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([u_email]\n"
                    + "           ,[oder_date]\n"
                    + "           ,[total_price])\n"
                    + "     VALUES (?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getEmail());
            st.setString(2, date);
            st.setString(3, cart.getTotalMoney());
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[order_detail]\n"
                            + "           ([order_id]\n"
                            + "           ,[product_id]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[size])\n"
                            + "     VALUES (?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setString(4, i.getPrice());
                    st2.setString(5, i.getSize());
                    st2.executeUpdate();
                }
            }
            //cap nhat so luong sp
            String sql3 = "UPDATE [dbo].[product]\n"
                    + "   SET [unit_in_stock] = [unit_in_stock] - ?\n"
                    + " WHERE id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("addorder: " + e);
        }
    }

    public List<Order> getCart(String email) {
        String sql = "select * from [order] where u_email = ?";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String[] str = rs.getString(3).split("-");
                String d = "";
                for (int i = str.length - 1; i >= 0; i--) {
                    if (d.isEmpty()) {
                        d += str[i];
                    } else {
                        d += "-" + str[i];
                    }
                }
                Order o = new Order(rs.getInt(1),
                        rs.getString(2), d,
                        rs.getString(4));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getCart: " + e);
        }
        return null;
    }
    
    public Order getOrder(int id) {
        String sql = "select * from [order] where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                String[] str = rs.getString(3).split("-");
                String d = "";
                for (int i = str.length - 1; i >= 0; i--) {
                    if (d.isEmpty()) {
                        d += str[i];
                    } else {
                        d += "-" + str[i];
                    }
                }
                Order o = new Order(rs.getInt(1),
                        rs.getString(2), d,
                        rs.getString(4));
                return o;
            }
        } catch (SQLException e) {
            System.out.println("getCart: " + e);
        }
        return null;
    }

    public List<Order_Detail> getDetailItem(int oid) {
        String sql = "select * from order_detail where order_id = ?";
        List<Order_Detail> list = new ArrayList<>();
        ProductDAO pdb = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = pdb.getProductById(rs.getInt(2));
                Order_Detail odt = new Order_Detail(oid,
                        p, rs.getInt(3),
                        rs.getString(4), rs.getString(5));
                list.add(odt);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getCart: " + e);
        }
        return null;
    }
}
