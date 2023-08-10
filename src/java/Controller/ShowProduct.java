/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import static Controller.Home.withLargeIntegers;
import Model.Cart;
import Model.Category;
import Model.Item;
import Model.Product;
import Model.Size;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class ShowProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        Cookie[] arr = request.getCookies();
        String chose = request.getParameter("chose");
        String key = request.getParameter("key");
        request.setAttribute("chose", chose);
        request.setAttribute("key", key);
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        String txt = "";
        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                    i.setMaxAge(0);
                    response.addCookie(i);
                }
            }
        }
        Cart cart = new Cart(txt);
        String newc = "";
        if (cart.getItems() != null) {
            for (int i = 0; i < cart.getItems().size(); i++) {
                if (newc.isEmpty()) {
                    newc += cart.getItems().get(i).getProduct().getId() + "-"
                            + cart.getItems().get(i).getQuantity() + "-"
                            + cart.getItems().get(i).getSize();
                } else {
                    newc = newc + ":" + cart.getItems().get(i).getProduct().getId() + "-"
                            + cart.getItems().get(i).getQuantity() + "-"
                            + cart.getItems().get(i).getSize();
                }
            }
            Cookie c = new Cookie("cart", newc);
            c.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(c);
        }
        int n;
        List<Item> listItem = cart.getItems();
        if (listItem != null) {
            n = cart.getTotalQuantity();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        List<Product> pro = new ArrayList<>();
        List<Product> temp1 = new ArrayList<>();
        String title = "";
        if (!chose.isEmpty()) {
            if (chose.equals("0")) {
                pro = pdb.getListSale();
                title = "HOT SALE";
            } else if (chose.equals("1")) {
                pro = pdb.getListByOb(1);
                title = "QUẦN ÁO NAM";
            } else if (chose.equals("2")) {
                pro = pdb.getListByOb(2);
                title = "QUẦN ÁO NỮ";
            } else if (chose.equals("3")) {
                pro = pdb.getListByOb(3);
                title = "QUẦN ÁO TRẺ EM";
            }
        }
        for (int i = 0; i < pro.size(); i++) {
            temp.add(pro.get(i).getUnit_price().replace(".", ""));
        }
        for (int i = 0; i < pro.size(); i++) {
            int price = Integer.parseInt(temp.get(i));
            int discount = Integer.parseInt(pro.get(i).getDiscount());
            int sum = (price - (price * discount / 100)) / 1000;
            sum *= 1000;
            listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
        }
        for (int i = 0; i < pro.size(); i++) {
            temp1.add(pro.get(i));
        }
        request.setAttribute("title", title);
        request.setAttribute("list", temp1);
        List<String> listcolor = new ArrayList<>();
        int i = 0;
        while (!pro.isEmpty()) {
            listcolor.add(pro.get(0).getColor());
            pro.remove(0);
            for (int j = 0; j < pro.size();) {
                if (pro.get(j).getColor().equals(listcolor.get(i))) {
                    pro.remove(j);
                    if (j == 0) {
                        j = 0;
                    } else {
                        j--;
                    }
                } else {
                    j++;
                }
            }
            i++;
        }
        CategoryDAO cdb = new CategoryDAO();
        List<Category> listc = cdb.gethalf();
        SizeDAO sdb = new SizeDAO();
        List<Size> lists = sdb.getall();
        request.setAttribute("listcolor", listcolor);
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("lcate", listc);
        request.setAttribute("lsize", lists);
        request.getRequestDispatcher("showproduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        Cookie[] arr = request.getCookies();
        String chose = request.getParameter("chose");
        String[] cate = request.getParameterValues("cate");
        String[] size = request.getParameterValues("size");
        String[] color = request.getParameterValues("color");
        String price_filter = request.getParameter("price");
        request.setAttribute("cate", cate);
        request.setAttribute("si", size);
        request.setAttribute("color", color);
        request.setAttribute("price_filter", price_filter);
        String key = request.getParameter("key");
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        String txt = "";
        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                    i.setMaxAge(0);
                    response.addCookie(i);
                }
            }
        }
        Cart cart = new Cart(txt);
        String newc = "";
        if (cart.getItems() != null) {
            for (int i = 0; i < cart.getItems().size(); i++) {
                if (newc.isEmpty()) {
                    newc += cart.getItems().get(i).getProduct().getId() + "-"
                            + cart.getItems().get(i).getQuantity() + "-"
                            + cart.getItems().get(i).getSize();
                } else {
                    newc = newc + ":" + cart.getItems().get(i).getProduct().getId() + "-"
                            + cart.getItems().get(i).getQuantity() + "-"
                            + cart.getItems().get(i).getSize();
                }
            }
            Cookie c = new Cookie("cart", newc);
            c.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(c);
        }
        int n;
        List<Item> listItem = cart.getItems();
        if (listItem != null) {
            n = cart.getTotalQuantity();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        List<Product> pro = new ArrayList<>();
        List<Product> listFilter = pdb.filter(key, chose, cate, size, color, price_filter);
        for (int i = 0; i < listFilter.size(); i++) {
            temp.add(listFilter.get(i).getUnit_price().replace(".", ""));
        }
        for (int i = 0; i < listFilter.size(); i++) {
            int price = Integer.parseInt(temp.get(i));
            int discount = Integer.parseInt(listFilter.get(i).getDiscount());
            int sum = (price - (price * discount / 100)) / 1000;
            sum *= 1000;
            listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
        }
        for (int i = 0; i < pro.size(); i++) {
            pro.add(listFilter.get(i));
        }
        if(chose == null){
            
        }
        else if (chose.equals("0")||chose.isEmpty()) {
            pro = pdb.getListSale();
        } else if (chose.equals("1")||chose.isEmpty()) {
            pro = pdb.getListByOb(1);
        } else if (chose.equals("2")||chose.isEmpty()) {
            pro = pdb.getListByOb(2);
        } else if (chose.equals("3")||chose.isEmpty()) {
            pro = pdb.getListByOb(3);
        }
        request.setAttribute("list", listFilter);
        List<String> listcolor = new ArrayList<>();
        int i = 0;
        while (!pro.isEmpty()) {
            listcolor.add(pro.get(0).getColor());
            pro.remove(0);
            for (int j = 0; j < pro.size();) {
                if (pro.get(j).getColor().equals(listcolor.get(i))) {
                    pro.remove(j);
                    if (j == 0) {
                        j = 0;
                    } else {
                        j--;
                    }
                } else {
                    j++;
                }
            }
            i++;
        }
        CategoryDAO cdb = new CategoryDAO();
        List<Category> listc = cdb.gethalf();
        SizeDAO sdb = new SizeDAO();
        List<Size> lists = sdb.getall();
        request.setAttribute("listcolor", listcolor);
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("lcate", listc);
        request.setAttribute("lsize", lists);
        request.getRequestDispatcher("showproduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
