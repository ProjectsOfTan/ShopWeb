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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddUser extends HttpServlet {

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
            if (request.getPart("fileimage") != null) {
                Part filepart = request.getPart("image");
                String filename = filepart.getSubmittedFileName();
                for (Part part : request.getParts()) {
                    part.write("D:\\ky4\\prj301\\project\\Tan_Shop\\web\\image\\" + filename);
                }
            }
            String email = "", pass = "";
            String firstname = "", lastname = "";
            String phone = "", gender = "", DoB = "";
            String address = "";
            String image = "";
            String admin = request.getParameter("IsAdmin");
            email = request.getParameter("email");
            pass = request.getParameter("pass");
            firstname = request.getParameter("firstname");
            lastname = request.getParameter("lastname");
            phone = request.getParameter("phone");
            gender = request.getParameter("gender");
            DoB = request.getParameter("DoB");
            address = request.getParameter("address");
            image = request.getParameter("inputimage");
            UserDAO udb = new UserDAO();
            User u = udb.getUserByEmail(email);
            System.out.println("request = "+request.getParameter("inputimage"));
            if (request.getParameter("inputimage").isEmpty()) {
                image = "no-profile-picture-icon-18.jpg";
            }
            if (u == null) {
                User uNew = new User(email, firstname, lastname, pass, phone, gender, DoB, address, image, admin);
                udb.insert(uNew);
                response.sendRedirect("listuser");
            } else {
                request.setAttribute("error", u + "existed!");
                request.getRequestDispatcher("admin/adduser.jsp").forward(request, response);
            }
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
        request.getRequestDispatcher("admin/adduser.jsp").forward(request, response);
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
