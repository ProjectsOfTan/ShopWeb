/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author wth0z
 */
public class login extends HttpServlet {

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
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String r = request.getParameter("rem");
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("pass", request.getParameter("pass"));
        if (pass.matches("//s*")) {
            request.setAttribute("invalid", "Mật khẩu đang để trống, vui lòng điền mật khẩu");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (!email.matches("^[\\w]*[\\w]\\@([\\w]+\\.)+[\\w]+[\\w]$")) {
            request.setAttribute("invalid", "email không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (!pass.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}")) {
            request.setAttribute("invalid", "Mật khẩu không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        Cookie cu = new Cookie("cuser", email);
        Cookie cp = new Cookie("cpass", pass);
        Cookie cr = new Cookie("crem", r);
        if (r != null) {
            cu.setMaxAge(60 * 60 * 24 * 31);
            cp.setMaxAge(60 * 60 * 24 * 31);
            cr.setMaxAge(60 * 60 * 24 * 31);
        } else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);
        UserDAO udb = new UserDAO();
        User a = udb.check(email, pass);
        HttpSession session = request.getSession();
        if (a == null) {
            request.setAttribute("invalid", "Tên tài khoản của bạn hoặc Mật khẩu không đúng, vui lòng thử lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            session.setAttribute("account", a);
            if (a.isAdmin().equalsIgnoreCase("Admin")) {
                System.out.println(a.isAdmin().equalsIgnoreCase("Admin"));
                response.sendRedirect("admin/management.jsp");
            } else {
                String str = (String) session.getAttribute("cart_login");
                if (str != null && !str.isEmpty()) {
                    response.sendRedirect("show");
                }
                response.sendRedirect("home");
            }
        }
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
