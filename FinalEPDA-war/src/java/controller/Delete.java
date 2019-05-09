/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import facades.AssignStcFacadeLocal;
import facades.AttendanceFacadeLocal;
import facades.ClassesFacadeLocal;
import facades.LecturersFacadeLocal;
import facades.StudentsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AssignStc;
import model.Attendance;
import model.Lecturers;
import model.Students;

/**
 *
 * @author asqar
 */
public class Delete extends HttpServlet {
@EJB
LecturersFacadeLocal lecturerFacade;
@EJB
StudentsFacadeLocal studentFacade;
@EJB
ClassesFacadeLocal classFacade;
@EJB
AssignStcFacadeLocal stcFacade;
@EJB
AttendanceFacadeLocal attFacade;
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
            if(request.getParameter("user").equals("Lecturer")){
                Lecturers lec = lecturerFacade.find(Integer.parseInt(request.getParameter("id")));
                lecturerFacade.remove(lec);
                //remove from assign LTD 
                response.sendRedirect("admin/index.jsp");
            } else if(request.getParameter("user").equals("Student")){
                Students std = studentFacade.find(Integer.parseInt(request.getParameter("id")));
                studentFacade.remove(std);
                //remove from assign STC
                response.sendRedirect("admin/index.jsp");
            } else if(request.getParameter("user").equals("HosClassDelete")){
                int class_id = Integer.parseInt(request.getParameter("id"));
                //remove from assign STC
                List<AssignStc> stc = stcFacade.byClassId(class_id);
                for(AssignStc s : stc) stcFacade.remove(s);
                //remove from attendance
                List<Attendance> att = attFacade.getByClass(class_id);
                for(Attendance a : att) attFacade.remove(a);
                //remove from class
                classFacade.remove(classFacade.find(class_id));
                response.sendRedirect("hos/index.jsp");
            } else{
                response.sendError(404);
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
