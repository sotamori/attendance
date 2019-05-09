<%-- 
    Document   : class
    Created on : Aug 25, 2018, 12:22:03 AM
    Author     : asqar
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Lecturers"%>
<%@page import="model.AssignLtd"%>
<%@page import="facades.AssignLtdFacadeLocal"%>
<%@page import="java.util.List"%>
<%@page import="model.Classes"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%if(!session.getAttribute("user").equals("hos")) response.sendRedirect("../login.jsp");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
DepartmentFacadeLocal depFacade;
ClassesFacadeLocal classFacade;
AssignLtdFacadeLocal ltdFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
depFacade = (DepartmentFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/DepartmentFacade!facades.DepartmentFacadeLocal");
classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");
ltdFacade = (AssignLtdFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignLtdFacade!facades.AssignLtdFacadeLocal");

int class_id = Integer.parseInt(request.getParameter("id").toString());
int departmentId = Integer.parseInt(session.getAttribute("departmentId").toString());
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
      Classes currClass = classFacade.find(class_id);
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
          <div class="card-header">Class Details <small><a href="../Delete?user=HosClassDelete&id=<%= request.getParameter("id") %>">(delete)</a></small></div>
        <div class="card-body">
            <form action="../Update" method="POST">
                <input name="id" type="hidden" value="<%= currClass.getId() %>">
                <input name="userType" type="hidden" value="HosClassUpdate">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input name="name" value="<%= currClass.getName() %>" type="text" id="firstName" class="form-control" placeholder="First name" required="required">
                    <label for="firstName">Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <select style="height: 50px; padding-top: 0px;" required="required" name="lecturer_id" class="custom-select">
                        <%
                            List<AssignLtd> ltd = ltdFacade.getByDepartment(departmentId);
                            String selected;
                            List<Lecturers> lecs = new ArrayList<Lecturers>();
                            for(AssignLtd assignltd : ltd){
                                Lecturers newLec = lecturerFacade.find(assignltd.getLecturerId());
                                lecs.add(newLec);
                            }
                            
                            for(Lecturers lec : lecs){
                                if(lec.getId().equals(currClass.getLecturerId())) selected = "selected";
                                else selected = "";
                        %>
                        <option <%=selected%> value="<%= lec.getId() %>"><%= lec.getName() %></option>
                        <%}%>
                    </select>
                </div>
              </div>
            </div>
            <input class="btn btn-primary btn-block" type="submit" value="Update">
          </form>
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