/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.Dao;
import entity.Product;
import entity.User;
import entity.Usercart;
import entity.category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Detailcontrol extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("iid");
        String txtSearch = request.getParameter("txt");
        Dao dao = new Dao();
        
        List<Product> listP1 = dao.searchProduct(txtSearch);
        Product list = dao.getAllProduct_Sell(id);
        List<Product> listP = dao.getAllProduct();
        List<category> listC = dao.getAllCategory();
        
        request.setAttribute("Listp", listP);
        request.setAttribute("Listc", listC);
        request.setAttribute("detail", list);
        HttpSession session = request.getSession(false);
        User a = (User) session.getAttribute("acc");
        if (a != null) {
            List<Usercart> usk = dao.getUsercarts(a.getUsername());
            double tong = 0;
            for (int i = 0; i < usk.size(); i++) {
                tong = tong + usk.get(i).getD().getPrice() * usk.get(i).getSl();
            }
            request.setAttribute("Sosp", usk.size());
            request.setAttribute("tong", tong);
            request.setAttribute("list", usk);
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
