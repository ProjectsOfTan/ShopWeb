/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Cart;
import Model.Item;
import Model.Product;
import Model.User;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class Home extends HttpServlet {

    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        List<Product> listsale = pdb.getHalfListSale();
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        Cookie[] arr = request.getCookies();
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
        for (int i = 0; i < listsale.size(); i++) {
            temp.add(listsale.get(i).getUnit_price().replace(".", ""));
        }
        for (int i = 0; i < listsale.size(); i++) {
            int price = Integer.parseInt(temp.get(i));
            int discount = Integer.parseInt(listsale.get(i).getDiscount());
            int sum = (price - (price * discount / 100)) / 1000;
            sum *= 1000;
            listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
        }
        List<Product> list = pdb.gethalf();
        List<Product> listmale = new ArrayList<>();
        List<Product> listfemale = new ArrayList<>();
        List<Product> listchild = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getOb().getId() == 1) {
                listmale.add(list.get(i));
            } else if (list.get(i).getOb().getId() == 2) {
                listfemale.add(list.get(i));
            } else if (list.get(i).getOb().getId() == 3) {
                listchild.add(list.get(i));
            }
        }
        String str = request.getParameter("sort");
        if (str != null && !str.isEmpty()) {
            if (str.equals("incre")) {
                list = pdb.gethalfsortIncre();
            } else {
                list = pdb.gethalfsortDecre();
            }
            request.setAttribute("sort", request.getParameter("sort"));
            request.setAttribute("list", list);
        }
        request.setAttribute("listmale", listmale);
        request.setAttribute("listfemale", listfemale);
        request.setAttribute("listchild", listchild);
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("listsale", listsale);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        List<Product> listsale = pdb.getHalfListSale();
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        Cookie[] arr = request.getCookies();
        String txt = "";
        String t = "";
        if (u != null) {
            t = u.getEmail().replace("@", "%40");
        }
        if (arr != null) {
            for (Cookie i : arr) {
                if (u != null) {
                    if (i.getName().equals(t)) {
                        txt += i.getValue();
                        i.setMaxAge(0);
                        response.addCookie(i);
                    }
                } else {
                    if (i.getName().equals("cart")) {
                        txt += i.getValue();
                        i.setMaxAge(0);
                        response.addCookie(i);
                    }
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
            if (u != null) {
                Cookie c = new Cookie(t, newc);
                c.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(c);
            } else {
                Cookie c = new Cookie("cart", newc);
                c.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(c);
            }
        }
        int n;
        List<Item> listItem = cart.getItems();
        if (listItem != null) {
            n = cart.getTotalQuantity();
            System.out.println(cart.getTotalQuantity());
        } else {
            n = 0;
        }
        System.out.println(n);
        request.setAttribute("size", n);
        for (int i = 0; i < listsale.size(); i++) {
            temp.add(listsale.get(i).getUnit_price().replace(".", ""));
        }
        for (int i = 0; i < listsale.size(); i++) {
            int price = Integer.parseInt(temp.get(i));
            int discount = Integer.parseInt(listsale.get(i).getDiscount());
            int sum = (price - (price * discount / 100)) / 1000;
            sum *= 1000;
            listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
        }
        List<Product> list = pdb.gethalf();
        List<Product> listmale = new ArrayList<>();
        List<Product> listfemale = new ArrayList<>();
        List<Product> listchild = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getOb().getId() == 1) {
                listmale.add(list.get(i));
            } else if (list.get(i).getOb().getId() == 2) {
                listfemale.add(list.get(i));
            } else if (list.get(i).getOb().getId() == 3) {
                listchild.add(list.get(i));
            }
        }
        String str = request.getParameter("sort");
        if (str.equals("incre")) {
            list = pdb.gethalfsortIncre();
        } else {
            list = pdb.gethalfsortDecre();
        }
        request.setAttribute("sort", request.getParameter("sort"));
        request.setAttribute("list", list);
        request.setAttribute("listmale", listmale);
        request.setAttribute("listfemale", listfemale);
        request.setAttribute("listchild", listchild);
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("listsale", listsale);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
