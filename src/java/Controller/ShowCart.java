/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import static Controller.Home.withLargeIntegers;
import Model.Cart;
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
public class ShowCart extends HttpServlet {

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
        List<String> listaftersale = new ArrayList<>();
        List<String> temp = new ArrayList<>();
        List<String> dis = new ArrayList<>();
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
            for (int i = 0; i < cart.getItems().size(); i++) {
                if (!cart.getItems().get(i).getProduct().getDiscount().equals("0")) {
                    temp.add(cart.getItems().get(i).getProduct().getUnit_price().replace(".", ""));
                    dis.add(cart.getItems().get(i).getProduct().getDiscount());
                }
            }
            for (int i = 0; i < temp.size(); i++) {
                int price = Integer.parseInt(temp.get(i));
                int discount = Integer.parseInt(dis.get(i));
                int sum = (price - (price * discount / 100)) / 1000;
                sum *= 1000;
                listaftersale.add(String.valueOf(withLargeIntegers(sum)).replace(",", "."));
            }
        }
        request.setAttribute("listaftersale", listaftersale);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
