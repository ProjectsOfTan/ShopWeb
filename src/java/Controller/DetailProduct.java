/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Cart;
import Model.Item;
import Model.Product;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class DetailProduct extends HttpServlet {

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
            out.println("<title>Servlet DetailProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailProduct at " + request.getContextPath() + "</h1>");
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
        Product p = pdb.getProductById(Integer.parseInt(request.getParameter("id")));
        List<Product> listpro = pdb.getListProductsByName(p.getName(), p.getId());
        Cookie[] arr = request.getCookies();
        String txt = "";
        int quan = Integer.parseInt(p.getUnit_in_stock());
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
                if (cart.getItems().get(i).getProduct().getId() == p.getId()) {
                    quan = quan - cart.getItems().get(i).getQuantity();
                }
            }
        }
        int n;
        List<Item> listItem = cart.getItems();
        if (listItem != null) {
            n = cart.getTotalQuantity();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        if (!p.getDiscount().equals("0")) {
            String temp = p.getUnit_price().replace(".", "");
            int price = Integer.parseInt(temp);
            int discount = Integer.parseInt(p.getDiscount());
            int sum = (price - (price * discount / 100)) / 1000;
            sum *= 1000;
            String aftersalse = String.valueOf(withLargeIntegers(sum)).replace(",", ".");
            request.setAttribute("aftersalse", aftersalse);
        }
        request.setAttribute("quan", quan);
        request.setAttribute("data", p);
        request.setAttribute("listpro", listpro);
        request.getRequestDispatcher("detailproduct.jsp").forward(request, response);
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
