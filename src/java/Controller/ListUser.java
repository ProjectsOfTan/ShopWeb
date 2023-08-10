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
public class ListUser extends HttpServlet {

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
            UserDAO u = new UserDAO();
            List<User> li = u.getall();
            request.setAttribute("data", li);
            request.getRequestDispatcher("admin/listuser.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            List<User> li;
            UserDAO u;
            if(request.getParameter("key") == null || request.getParameter("key").isEmpty()){
                u = new UserDAO();
                li = u.getall();
            }
            else{
                u = new UserDAO();
                String key = request.getParameter("key");
                li = u.search(key);
                System.out.println(key);
            }
            int page, numperpage;
            if(request.getParameter("entryperpage") == null 
                    || request.getParameter("entryperpage").isEmpty() 
                    || request.getParameter("entryperpage").equals("0")){
                numperpage = 10;
            }
            else{
                numperpage = Integer.parseInt(request.getParameter("entryperpage"));
            }
            String xpage = request.getParameter("page");
            int size = li.size();
            int num = (size%numperpage==0?(size/numperpage):((size/numperpage)+1));
            if(xpage == null){
                page = 1;
            }else{
                page = Integer.parseInt(xpage);
            }
            if (request.getAttribute("delete") != null) {
                int pageattr = Integer.parseInt(request.getAttribute("entryperpage").toString());
                int numattr = Integer.parseInt(request.getAttribute("size").toString());
                if (numattr % pageattr == 1 || pageattr == 1) {
                    page = Integer.parseInt(request.getAttribute("page").toString());
                }
            }
            int start, end;
            start = (page-1)*numperpage;
            end = Math.min(numperpage*page, size);
            List<User> list = u.getListByPage(li, start, end);
            request.setAttribute("key", request.getParameter("key"));
            request.setAttribute("entryperpage", numperpage);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("data", list);
            request.getRequestDispatcher("admin/listuser.jsp").forward(request, response);
        }
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            UserDAO u = new UserDAO();
            String key = request.getParameter("key");
            List<User> li = u.search(key);
            int page, numperpage=1;
            String xpage = request.getParameter("page");
            int size = li.size();
            int num = (size%numperpage==0?(size/numperpage):((size/numperpage)+1));
            if(xpage == null){
                page = 10;
            }else{
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page-1)*numperpage;
            end = Math.min(numperpage*page, size);
            List<User> list = u.getListByPage(li, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("data", list);
            request.getRequestDispatcher("admin/listuser.jsp").forward(request, response);
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
