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

/*
 *
 * @author Admin
 */
public class CartAddControl extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String cid = request.getParameter("cid");
            String sl = request.getParameter("quantity");
            int soluong = Integer.valueOf(sl);
            Dao dao = new Dao();
            HttpSession session = request.getSession(false);
            User a = (User) session.getAttribute("acc");
            if(!cid.equals("null")){
                List<Usercart> us = dao.getUsercarts(a.getUsername());
                boolean check = true;
                for (Usercart v : us) {
                    if (v.getUsename().equals(a.getUsername()) && v.getD().getId() == Integer.valueOf(cid)) {
                        dao.UpdateCart(v.getUsename(), Integer.valueOf(cid), v.getSl() + soluong);
                        check = false;
                        break;
                    }
            }
            if(check){
            dao.InsertCart(a.getUsername(), Integer.valueOf(cid), soluong);
            }
            }
            List<Usercart> usk = dao.getUsercarts(a.getUsername());
            double tong = 0;
            for (int i = 0; i < usk.size(); i++) {
                tong = tong + usk.get(i).getD().getPrice() * usk.get(i).getSl();
            }
            request.setAttribute("listC", usk);
            request.setAttribute("tong", tong);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("loi CartAddControl: " + e.getMessage());
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
