/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import static Controller.ShowCart.withLargeIntegers;
import Model.Cart;
import Model.Item;
import Model.Order_Detail;
import Model.User;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class Order extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        List<String> dis = new ArrayList<>();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }
        Cart cart = new Cart(txt);
        int n;
        List<Item> listItem = cart.getItems();
        if (listItem != null) {
            n = cart.getTotalQuantity();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        OrderDAO odb = new OrderDAO();
        List<Order_Detail> list = odb.getDetailItem(id);
        Model.Order o = odb.getOrder(id);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        request.setAttribute("data", list);
        for (int i = 0; i < list.size(); i++) {
                if (!list.get(i).getProduct().getDiscount().equals("0")) {
                    temp.add(list.get(i).getProduct().getUnit_price().replace(".", ""));
                    dis.add(list.get(i).getProduct().getDiscount());
                }
            }
            for (int i = 0; i < temp.size(); i++) {
                int price = Integer.parseInt(temp.get(i));
                int discount = Integer.parseInt(dis.get(i));
                int sum = (price - (price * discount / 100)) / 1000;
                sum *= 1000;
                listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
            }
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("order", o);
        request.setAttribute("user", u);
        request.getRequestDispatcher("order_detail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
