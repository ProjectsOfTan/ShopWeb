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
public class register extends HttpServlet {

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
            out.println("<title>Servlet register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String repass = request.getParameter("repass");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("pass", request.getParameter("pass"));
        request.setAttribute("firstname", request.getParameter("firstname"));
        request.setAttribute("lastname", request.getParameter("lastname"));
        request.setAttribute("phone", request.getParameter("phone"));
        request.setAttribute("address", request.getParameter("address"));
        request.setAttribute("repass", request.getParameter("repass"));
        if (!lastname.matches("[a-zA-Z]+")||!firstname.matches("[a-zA-Z]+")) {
            request.setAttribute("invalid", "Họ và Tên không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!phone.matches("\\d{10}")) {
            request.setAttribute("invalid", "Số điện thoại không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (pass.matches("//s*")) {
            request.setAttribute("invalid", "Mật khẩu đang để trống, vui lòng điền mật khẩu");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!email.matches("^[\\w]*[\\w]\\@([\\w]+\\.)+[\\w]+[\\w]$")) {
            request.setAttribute("invalid", "email không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!pass.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}")) {
            request.setAttribute("invalid", "Mật khẩu không hợp lệ, vui lòng thử lại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!repass.matches(pass)) {
            request.setAttribute("invalid", "Mật khẩu nhập lại không khớp, vui lòng thử lại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        UserDAO udb = new UserDAO();
        HttpSession session = request.getSession();
        if (udb.checkIsExist(email)) {
            request.setAttribute("invalid", "email đã tồn tại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            String img = "no-profile-picture-icon-18.jpg";
            User u = new User(email, firstname, lastname, pass, phone, "", "", address, img, "User");
            udb.insert(u);
            session.setAttribute("account", u);
            response.sendRedirect("home");
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
