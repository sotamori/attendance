<%-- 
    Document   : iconcard
    Created on : Aug 18, 2018, 7:18:49 PM
    Author     : asqar
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Context context = new InitialContext();

LecturersFacadeLocal lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
StudentsFacadeLocal studentFacade = (StudentsFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/StudentsFacade!facades.StudentsFacadeLocal");
DepartmentFacadeLocal depFacade = (DepartmentFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/DepartmentFacade!facades.DepartmentFacadeLocal");
ClassesFacadeLocal classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");

%>
<div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                  </div>
                    <div class="mr-5"><%= lecturerFacade.count() %> Lecturers</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="table.jsp?view=lecturers">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-list"></i>
                  </div>
                  <div class="mr-5"><%= studentFacade.count() %> Students</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="table.jsp?view=students">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5"><%= classFacade.count() %> Classes</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="table.jsp?view=classes">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-life-ring"></i>
                  </div>
                  <div class="mr-5"><%= depFacade.count() %> Departments</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="table.jsp?view=departments">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
          </div>