/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import facades.DepartmentFacadeLocal;
import facades.LecturersFacadeLocal;
import facades.StudentsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Lecturers;
import model.Students;

/**
 *
 * @author asqar
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
@EJB
StudentsFacadeLocal sf;
@EJB
DepartmentFacadeLocal df;
@EJB
LecturersFacadeLocal lf;
    
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                HttpSession session = request.getSession();
                                
                if(email.equals("admin") && password.equals("admin")){
                    session.setAttribute("user", "admin");               
                    System.out.println("*||| ADMIN LOGGED IN |||*");
                    
                    response.sendRedirect("admin/index.jsp");
                    //out.println("admin");
                } else if(df.isHos(lf.login(email, password))!=0){
                    session.setAttribute("user", "hos");
                    Lecturers lecturer = new Lecturers(lf.login(email, password));
                    session.setAttribute("id", lecturer.getId());
                    session.setAttribute("departmentId", df.isHos(lf.login(email, password)));
                    response.sendRedirect("hos/index.jsp");
                    //out.println("hos");
                } else if(lf.login(email, password)!=0){
                    session.setAttribute("user", "lecturer");
                    Lecturers lecturer = new Lecturers(lf.login(email, password));
                    session.setAttribute("id", lecturer.getId());
                    response.sendRedirect("lecturer/index.jsp");
                    //out.println("lecturer");
                } else if(sf.login(email, password)!=0){
                    session.setAttribute("user", "student");
                    Students student = new Students(sf.login(email, password));
                    session.setAttribute("id", student.getId());
                    response.sendRedirect("student/index.jsp");
                    //out.println("student");
                } else {
                    out.println("login error");
                    //response.sendRedirect("login.jsp");
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
