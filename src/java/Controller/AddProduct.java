/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Category;
import Model.Ob;
import Model.Product;
import Model.Size;
import dal.CategoryDAO;
import dal.ObjectDAO;
import dal.ProductDAO;
import dal.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cdb = new CategoryDAO();
        SizeDAO sdb = new SizeDAO();
        List<Category> list = cdb.getall();
        List<Size> li = sdb.getall();
        request.setAttribute("data", list);
        request.setAttribute("size", li);
        request.getRequestDispatcher("admin/addproduct.jsp").forward(request, response);
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
        if (request.getPart("fileimage") != null) {
            Part filepart = request.getPart("fileimage");
            String filename = filepart.getSubmittedFileName();
            for (Part part : request.getParts()) {
                part.write("D:\\ky4\\prj301\\project\\Tan_Shop\\web\\image\\" + filename);
            }
        }
        String name = "", color = "";
        String[] desc = request.getParameter("desc").split("\\.");
        String unit_in_stock = "", unit_price = "";
        String discount = "";
        String img = request.getParameter("inputimage");
        CategoryDAO cdb = new CategoryDAO();
        ObjectDAO odb = new ObjectDAO();
        Category category = cdb.getCategoryByName(request.getParameter("type"));
        Ob ob = odb.getObByName(request.getParameter("object"));
        name = request.getParameter("name");
        color = request.getParameter("color");
        unit_in_stock = request.getParameter("quantity");
        unit_price = request.getParameter("price");
        discount = request.getParameter("discount");
        ProductDAO pdb = new ProductDAO();
        SizeDAO sdb = new SizeDAO();
        List<Size> list = new ArrayList<>();
        String[] size = request.getParameterValues("size");
        try {
            for (int i = 0; i < size.length; i++) {
                int id_size = Integer.parseInt(size[i]);
                list.add(sdb.getSizeById(id_size));
        }
        } catch (Exception e) {
            System.out.println("AddProduct: "+ e);
        }
        Product pNew = new Product(0, name, color, desc, unit_in_stock, unit_price, discount, img, category, ob,list);
        pdb.beforeInsert();
        pdb.insert(pNew);
        CategoryDAO cdbtemp = new CategoryDAO();
        SizeDAO temp = new SizeDAO();
        List<Category> listc = cdbtemp.getall();
        List<Size> li = temp.getall();
        request.setAttribute("data", listc);
        request.setAttribute("size", li);
        request.setAttribute("successfull", "THÊM SẢN PHẨM THÀNH CÔNG");
        request.getRequestDispatcher("admin/addproduct.jsp").forward(request, response);
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
