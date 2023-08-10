/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.DBContext;
import Model.User;
import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wth0z
 */
public class UserDAO extends DBContext {

    public List<User> getall() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    image = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                list.add(new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(User u) {
        String sql = "INSERT INTO [dbo].[user]\n"
                + "           ([email]\n"
                + "           ,[firstname]\n"
                + "           ,[lastname]\n"
                + "           ,[pass]\n"
                + "           ,[phone]\n"
                + "           ,[gender]\n"
                + "           ,[DoB]\n"
                + "           ,[address]\n"
                + "           ,[image]\n"
                + "           ,[admin])"
                + "     VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, u.getEmail());
            pstm.setString(2, u.getFirtname());
            pstm.setString(3, u.getLastname());
            pstm.setString(4, u.getPass());
            pstm.setString(5, u.getPhone());
            if (u.getGender().equalsIgnoreCase("None")||u.getGender().isEmpty()) {
                pstm.setNull(6, java.sql.Types.BOOLEAN);
            } else {
                boolean check = false;
                if (u.getGender().equalsIgnoreCase("Male")) {
                    check = true;
                }
                pstm.setBoolean(6, check);
            }
            if (u.getDoB().isEmpty()) {
                pstm.setNull(7, java.sql.Types.DATE);
            } else {
                pstm.setDate(7, Date.valueOf(u.getDoB()));
            }
            pstm.setString(8, u.getAddress());
            pstm.setString(9, u.getImage());
            boolean isadmin = false;
            if (u.isAdmin().equalsIgnoreCase("Admin")) {
                isadmin = true;
            }
            pstm.setBoolean(10, isadmin);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(User u) {
        String sql = "UPDATE [dbo].[user]\n"
                + "   SET [email] = ?, [firstname] = ?\n"
                + "      ,[lastname] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[DoB] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[admin] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, u.getEmail());
            pstm.setString(2, u.getFirtname());
            pstm.setString(3, u.getLastname());
            pstm.setString(4, u.getPass());
            pstm.setString(5, u.getPhone());
            if (u.getGender().equalsIgnoreCase("None")) {
                pstm.setNull(6, java.sql.Types.BOOLEAN);
            } else {
                boolean check = false;
                if (u.getGender().equalsIgnoreCase("Male")) {
                    check = true;
                }
                pstm.setBoolean(6, check);
            }
            if (u.getDoB().isEmpty()) {
                pstm.setNull(7, java.sql.Types.DATE);
            } else {
                pstm.setDate(7, Date.valueOf(u.getDoB()));
            }
            pstm.setString(8, u.getAddress());
            pstm.setString(9, u.getImage());
            boolean isadmin = false;
            if (u.isAdmin().equalsIgnoreCase("Admin")) {
                isadmin = true;
            }
            pstm.setBoolean(10, isadmin);
            pstm.setString(11, u.getEmail());
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("update: " + e);
        }
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [user] where email = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, email);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    image = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByFirstName(String firstname) {
        String sql = "select * from [user] where firstname = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, firstname);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String email = rs.getString(1);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    DoB = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByLastName(String lastname) {
        String sql = "select * from [user] where lastname = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, lastname);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    DoB = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByGender(String gender) {
        try {
            PreparedStatement pstm;
            if (gender.equalsIgnoreCase("None")) {
                String sql = "select * from [user] where gender IS NULL";
                pstm = connection.prepareStatement(sql);
            } else {
                String sql = "select * from [user] where gender = ?";
                pstm = connection.prepareStatement(sql);
                boolean check = false;
                if (gender.equals("Male")) {
                    check = true;
                }
                pstm.setBoolean(1, check);
            }
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    DoB = rs.getString(10);
                }
                String isadmin = "User";
                if (rs.getBoolean(6)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByAddress(String address) {
        String sql = "select * from [user] where address = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, address);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String image = "";
                if (rs.getString(9) != null) {
                    DoB = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByPhone(String phone) {
        String sql = "select * from [user] where phone = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, phone);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    DoB = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void delete(String email) {
        String sql = "DELETE FROM [user]\n"
                + "      WHERE email = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("delete: " + e);
        }
    }
    
    public boolean checkIsExist(String email) {
        String sql = "select * from [user] where email = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, email);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("check: " + e);
        }
        return false;
    }
    

    public User check(String email, String password) {
        String sql = "select * from [user] where email = ? and pass = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    image = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                User u = new User(email, firstname, lastname, password, phone, gender, DoB, address, image, isadmin);
                return u;
            }
        } catch (SQLException e) {
            System.out.println("check: " + e);
        }
        return null;
    }

    public List<User> search(String key) {
        List<User> list = new ArrayList<>();
        String sql = "select * from [user] where 1=1";
        try {
            ResultSet rs;
            if (key != null && !key.isEmpty()) {
                sql += " and (email like N'%" 
                        + key.trim() + "%' or firstname like N'%" 
                        + key.trim() + "%' or lastname like N'%" 
                        + key.trim() + "%' or phone like '%" 
                        + key.trim() + "%' or address like N'%" 
                        + key.trim() + "%'";
                if (key.equals("none")) {
                    sql += " or gender is null)";
                } else {
                    if (key.equals("Male")) {
                        sql += " or gender = 1)";
                    } else if (key.equals("Female")) {
                        sql += " or gender = 0)";
                    } else {
                        sql += ")";
                    }
                }
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            } else {
                PreparedStatement stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
            }
            while (rs.next()) {
                String email = rs.getString(1);
                String firstname = rs.getString(2);
                String lastname = rs.getString(3);
                String pass = rs.getString(4);
                String phone = rs.getString(5);
                String gender = "Nữ";
                if (rs.getBoolean(6)) {
                    gender = "Nam";
                }
                if (rs.wasNull()) {
                    gender = "Khác";
                }
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                String DoB = "";
                if (rs.getDate(7) != null) {
                    DoB = f.format(rs.getDate(7));
                }
                String address = rs.getString(8);
                String image = "";
                if (rs.getString(9) != null) {
                    image = rs.getString(9);
                }
                String isadmin = "User";
                if (rs.getBoolean(10)) {
                    isadmin = "Admin";
                }
                if (rs.wasNull()) {
                    isadmin = "User";
                }
                list.add(new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, isadmin));
            }
        } catch (SQLException e) {
            System.out.println("searchUser:" + e);
        }

        return list;
    }

    public List<User> getListByPage(List<User> list, int start, int end) {
        ArrayList<User> u = new ArrayList<>();
        for (int i = start; i < end; i++) {
            u.add(list.get(i));
        }
        return u;
    }

}
