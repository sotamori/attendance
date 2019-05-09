<%-- 
    Document   : register
    Created on : Aug 18, 2018, 8:06:24 AM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("admin")) response.sendRedirect("../login.jsp");%>
<%@page import="facades.AttendanceFacadeLocal"%>
<%@page import="facades.AssignStcFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Classes"%>
<%@page import="model.AssignStc"%>
<%@page import="model.Students"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
AssignStcFacadeLocal assignStcFacade = (AssignStcFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignStcFacade!facades.AssignStcFacadeLocal");
AttendanceFacadeLocal attFacade = (AttendanceFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AttendanceFacade!facades.AttendanceFacadeLocal");
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Student Profile</title>

    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

  </head>
  <%
      Students currStd = null;
      if(request.getParameter("id") != null){
        currStd = studentFacade.find(Integer.parseInt(request.getParameter("id")));
      } else {
        //redirection
      }
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
          <div class="card-header">Student profile <small><a href="../Delete?user=Student&id=<%= request.getParameter("id") %>">(delete)</a></small></div>
        <div class="card-body">
            <form action="../Update" method="POST">
                <input name="id" type="hidden" value="<%= request.getParameter("id") %>">
                <input name="userType" type="hidden" value="Student">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="name" value="<%= currStd.getName() %>" type="text" id="firstName" class="form-control" placeholder="First name" required="required">
                    <label for="firstName">Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="phone" value="<%= currStd.getPhone() %>" type="text" id="lastName" class="form-control" placeholder="Last name" required="required">
                    <label for="lastName">Phone</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                  <input name="email" value="<%= currStd.getEmail() %>" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
                <label for="inputEmail">Email</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="IC" value="<%= currStd.getIc() %>" type="text" id="inputPassword" class="form-control" placeholder="Password" required="required">
                    <label for="inputPassword">IC</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="address" value="<%= currStd.getAddress() %>" type="text" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
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
                  Taken Classes</div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Department</th>
                                <th>Lecturer</th>
                                <th>Attendance</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            List<AssignStc> assignedCls = assignStcFacade.byStudentId(Integer.parseInt(request.getParameter("id")));
                            List<Classes> list = new ArrayList<Classes>();
                            for(AssignStc stc : assignedCls){
                                list.add(classFacade.find(stc.getClassId()));
                            }
                   
                            for(Classes cls : list){
                        %>
                                <tr><td><%= cls.getId() %></td>
                                <td><%= cls.getName() %></td>
                                <td><%= depFacade.find(cls.getDepartmentId()).getName() %></td>
                                <td><%= lecturerFacade.find(cls.getLecturerId()).getName() %></td>
                                <td><%= attFacade.getPercentageOfStdByCls(currStd.getId(), cls.getId()) %>%</td></tr>
                        <%
                            }
                        %>
                      </tbody>
                    </table>
                  </div>
                </div>
            </div>
            <div class="form-group">
                <form action="../AssignSTC" method="POST">
                    <input name="id" type="hidden" value="<%= request.getParameter("id") %>">
              <div class="form-row">
                <div class="col-md-8">
                  <div class="form-label-group">
                    <select style="height: 40px"  name="class" class="custom-select">
                        <%
                            List<Classes> cl = classFacade.findAll();
                            for(Classes cls : cl){
                        %>
                        <option value="<%= cls.getId() %>"><%= cls.getName() %></option>
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
