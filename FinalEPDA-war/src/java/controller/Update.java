/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import facades.ClassesFacadeLocal;
import facades.LecturersFacadeLocal;
import facades.StudentsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Classes;
import model.Lecturers;
import model.Students;

/**
 *
 * @author asqar
 */
public class Update extends HttpServlet {
@EJB
LecturersFacadeLocal lecturerFacade;
@EJB
StudentsFacadeLocal studentFacade;
@EJB
ClassesFacadeLocal classFacade;
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
            if(request.getParameter("userType").equals("Lecturer") || request.getParameter("userType").equals("Hos")){
                Lecturers newLecturer = lecturerFacade.find(Integer.parseInt(request.getParameter("id")));            
                newLecturer.setAddress(request.getParameter("address"));
                newLecturer.setEmail(request.getParameter("email"));
                newLecturer.setIc(request.getParameter("IC"));
                newLecturer.setPhone(request.getParameter("phone"));
                newLecturer.setName(request.getParameter("name"));
                lecturerFacade.edit(newLecturer);
                if(request.getParameter("fromProfile") == null)
                    response.sendRedirect("admin/lecturer.jsp?id="+request.getParameter("id"));
                else{
                    if (request.getParameter("userType").equals("Lecturer")) response.sendRedirect("lecturer/profile.jsp");
                    else response.sendRedirect("hos/profile.jsp");
                }
            } else if(request.getParameter("userType").equals("Student")){
                Students newStudent = studentFacade.find(Integer.parseInt(request.getParameter("id")));
                newStudent.setAddress(request.getParameter("address"));
                newStudent.setEmail(request.getParameter("email"));
                newStudent.setIc(request.getParameter("IC"));
                newStudent.setPhone(request.getParameter("phone"));
                newStudent.setName(request.getParameter("name"));
                studentFacade.edit(newStudent);
                if(request.getParameter("fromProfile") == null)
                    response.sendRedirect("admin/student.jsp?id="+request.getParameter("id"));
                else{
                    response.sendRedirect("student/profile.jsp");
                }
            } else if(request.getParameter("userType").equals("HosClassUpdate")){
                Classes newClass = classFacade.find(Integer.parseInt(request.getParameter("id")));
                newClass.setName(request.getParameter("name"));
                newClass.setLecturerId(Integer.parseInt(request.getParameter("lecturer_id")));
                classFacade.edit(newClass);
                response.sendRedirect("hos/class.jsp?id="+request.getParameter("id"));
            } else {
                out.print("error");
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
