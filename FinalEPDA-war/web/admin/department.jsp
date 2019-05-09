<%-- 
    Document   : department
    Created on : Aug 19, 2018, 6:49:08 PM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("admin")) response.sendRedirect("../login.jsp");%>
<%@page import="model.Classes"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Lecturers"%>
<%@page import="model.Department"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Context context = new InitialContext();

LecturersFacadeLocal lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
DepartmentFacadeLocal depFacade = (DepartmentFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/DepartmentFacade!facades.DepartmentFacadeLocal");
ClassesFacadeLocal classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lecturer Profile</title>

    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

  </head>
  <%
      Department currDep = null;
      if(request.getParameter("id") != null){
        currDep = depFacade.find(Integer.parseInt(request.getParameter("id")));
      } else {
        //redirection
      }
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header"><%= currDep.getName() %></div>
        <div class="card-body">
            <form action="../AssignLTD" method="POST">
                <input name="id" type="hidden" value="<%= request.getParameter("id") %>">
                <input name="type" type="hidden" value="Hos">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-4">
                    <div style="margin: 8px 3px">
                        Head of Department:
                    </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <select name="lecturer" class="custom-select">
                        <%
                            List<Lecturers> lecs = lecturerFacade.findAll();
                            for(Lecturers lc : lecs){
                                
                                String selected = "";
                                if(currDep.getLecturerId() == lc.getId()){
                                    selected = "selected";
                                }
                        %>
                        <option <%= selected %> value="<%= lc.getId() %>"><%= lc.getName() %></option>
                        <% } %>
                      </select>
                  </div>
                </div>
                  <div class="col-md-2">
                  <div class="form-label-group">
                    <input style="height: 38px; padding-top: 0px;" class="btn btn-primary btn-block" type="submit" value="Update">
                  </div>
                </div>
              </div>
            </div>
          </form>
          <hr>
            <div class="card mb-3">
                <div class="card-header">
                  <i class="fas fa-table"></i>
                  Classes</div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Lecturer</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Classes> list = classFacade.byDepId(Integer.parseInt(request.getParameter("id")));
                   
                            for(Classes cls : list){
                        %>
                                <tr><td><%= cls.getId() %></td>
                                <td><%= cls.getName() %></td>
                                <td><%= lecturerFacade.find(cls.getLecturerId()).getName() %></td></tr>
                        <%
                            }
                        %>
                      </tbody>
                    </table>
                  </div>
                </div>
            </div>
          <hr>
          <div class="text-center">
            <a class="d-block small mt-3" href="index.jsp">Home Page</a>
          </div>
        </div>
      </div>
                    
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>