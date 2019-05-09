/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import facades.LecturersFacadeLocal;
import facades.StudentsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Lecturers;
import model.Students;

/**
 *
 * @author asqar
 */
public class Register extends HttpServlet {
@EJB
LecturersFacadeLocal lecturerFacade;
@EJB
StudentsFacadeLocal studentFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(request.getParameter("role").equals("Student")){
                // register new student
                Students newStudent = new Students(request.getParameter("name"),request.getParameter("gender"),request.getParameter("phone"),request.getParameter("IC"),request.getParameter("email"),request.getParameter("address"));
                studentFacade.create(newStudent);
                response.sendRedirect("admin/index.jsp");
            } else if(request.getParameter("role").equals("Lecturer")){
                // register new lecturer
                Lecturers newLecturer = new Lecturers(request.getParameter("name"),request.getParameter("gender"),request.getParameter("phone"),request.getParameter("IC"),request.getParameter("email"),request.getParameter("address"));
                lecturerFacade.create(newLecturer);
                response.sendRedirect("admin/index.jsp");
            } else {
                System.out.println("*||| REGISTRATION ERROR |||*");
                response.sendRedirect("admin/register.jsp");
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
