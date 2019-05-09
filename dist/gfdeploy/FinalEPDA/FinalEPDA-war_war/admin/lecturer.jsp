<%-- 
    Document   : lecturer
    Created on : Aug 19, 2018, 5:38:56 PM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("admin")) response.sendRedirect("../login.jsp");%>
<%@page import="facades.AssignLtdFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Department"%>
<%@page import="model.Classes"%>
<%@page import="model.Lecturers"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
StudentsFacadeLocal studentFacade;
DepartmentFacadeLocal depFacade;
ClassesFacadeLocal classFacade;
AssignLtdFacadeLocal assignLtdFacade;
%>
<%
context = new InitialContext();

lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
studentFacade = (StudentsFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/StudentsFacade!facades.StudentsFacadeLocal");
depFacade = (DepartmentFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/DepartmentFacade!facades.DepartmentFacadeLocal");
classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");
assignLtdFacade = (AssignLtdFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignLtdFacade!facades.AssignLtdFacadeLocal");

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
      Lecturers currLec = null;
      if(request.getParameter("id") != null){
        currLec = lecturerFacade.find(Integer.parseInt(request.getParameter("id")));
      } else {
        //redirection
      }
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Lecturer profile <small><a href="../Delete?user=Lecturer&id=<%= request.getParameter("id") %>">(delete)</a></small></div>
        <div class="card-body">
            <form action="../Update" method="POST">
                <input name="id" type="hidden" value="<%= request.getParameter("id") %>">
                <input name="userType" type="hidden" value="Lecturer">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="name" value="<%= currLec.getName() %>" type="text" id="firstName" class="form-control" placeholder="First name" required="required">
                    <label for="firstName">Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="phone" value="<%= currLec.getPhone() %>" type="text" id="lastName" class="form-control" placeholder="Last name" required="required">
                    <label for="lastName">Phone</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                  <input name="email" value="<%= currLec.getEmail() %>" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">Email</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="IC" value="<%= currLec.getIc() %>" type="text" id="inputPassword" class="form-control" placeholder="Password" required="required">
                    <label for="inputPassword">IC</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="address" value="<%= currLec.getAddress() %>" type="text" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                    <label for="confirmPassword">Address</label>
                  </div>
                </div>
              </div>
            </div>
            <input class="btn btn-primary btn-block" type="submit" value="Update">
          </form>
          <hr>
            <div class="card mb-3">
                <div class="card-header">
                  <i class="fas fa-table"></i>
                  Teaching Classes</div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Department</th>
                                <th>Lecturer</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Classes> list = classFacade.byLecturerId(Integer.parseInt(request.getParameter("id")));
                   
                            for(Classes cl : list){
                        %>
                                <tr><td><%= cl.getId() %></td>
                                <td><%= cl.getName() %></td>
                                <td><%= depFacade.find(cl.getDepartmentId()).getName() %></td>
                                <td><%= lecturerFacade.find(cl.getLecturerId()).getName() %></td></tr>
                        <%
                            }
                        %>
                      </tbody>
                    </table>
                  </div>
                </div>
            </div>
            <div class="form-group">
                <form action="../AssignLTD" method="POST">
                    <input name="id" type="hidden" value="<%= request.getParameter("id") %>">
                    <input name="type" type="hidden" value="Lecturer">
              <div class="form-row">
                <div class="col-md-2">
                  <div style="padding-top: 6px;" class="form-label-group">
                    Department:
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <select style="height: 40px"  name="department" class="custom-select">
                        <option value="">No department</option>
                        <%
                            List<Department> deps = depFacade.findAll();
                            for(Department dep : deps){
                            String selected = "";
                            if(assignLtdFacade.isLATD(Integer.parseInt(request.getParameter("id")), dep.getId())) selected = "selected";
                        %>
                        <option <%= selected %> value="<%= dep.getId() %>"><%= dep.getName() %></option>
                        <%}%>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input style="height: 40px; padding-top: 0px;" class="btn btn-primary btn-block" type="submit" value="Assign">
                  </div>
                </div>
              </div>
              </form>
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