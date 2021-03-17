/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.Dao;
import entity.User;
import entity.Usercart;
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
public class Logincontrol extends HttpServlet {

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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        
        Dao dao = new Dao();
        
        
        User a = dao.login(username, password);
        if(a == null){
            request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        if(a.getUsername().trim().equals("Admin") && a!=null){
            response.sendRedirect("manager");
            return;
        }
        
        if(a !=null){
//            request.getRequestDispatcher("Homecontrol").forward(request, response); // cần truyền dữ liệu
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            List<Usercart> usk = dao.getUsercarts(a.getUsername());
            double tong = 0;
            for (int i = 0; i < usk.size(); i++) {
                tong = tong + usk.get(i).getD().getPrice() * usk.get(i).getSl();
            }
            request.setAttribute("Sosp", usk.size());
            request.setAttribute("tong", tong);
            request.setAttribute("list", usk);
            request.getRequestDispatcher("Homecontrol").forward(request, response); // chuyển trang không cần truyền dữ liệu
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
