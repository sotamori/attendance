/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import facades.AssignLtdFacadeLocal;
import facades.DepartmentFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AssignLtd;
import model.Department;

/**
 *
 * @author asqar
 */
public class AssignLTD extends HttpServlet {
@EJB
DepartmentFacadeLocal departmentFacade;
@EJB
AssignLtdFacadeLocal assignltdFacade;
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
            if(request.getParameter("type").equals("Hos")){
                // assign lecturer to head of department
                Department dep = departmentFacade.find(Integer.parseInt(request.getParameter("id")));
                dep.setLecturerId(Integer.parseInt(request.getParameter("lecturer")));               
                departmentFacade.edit(dep);
                response.sendRedirect("admin/department.jsp?id="+request.getParameter("id"));
            } else if(request.getParameter("type").equals("Lecturer")){
                // delete if it was assigned
                int prevAssignedId = assignltdFacade.getByLecturerId(Integer.parseInt(request.getParameter("id")));
                if(prevAssignedId!=0){
                    AssignLtd deletePrev = assignltdFacade.find(prevAssignedId);
                    assignltdFacade.remove(deletePrev);
                }
                
                // assign lecturer under department
                AssignLtd assignLtd = new AssignLtd(Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("department")));
                assignltdFacade.create(assignLtd);
                response.sendRedirect("admin/lecturer.jsp?id="+request.getParameter("id"));
            } else {
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
