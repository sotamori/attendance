<%-- 
    Document   : register
    Created on : Aug 18, 2018, 8:06:24 AM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("lecturer")) response.sendRedirect("../login.jsp");%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Lecturers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
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
      
      if(!session.getAttribute("user").equals("lecturer")){
          response.sendError(423);
      }else{
          currLec = lecturerFacade.find(session.getAttribute("id"));
      }
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
          <div class="card-header">Your profile</div>
        <div class="card-body">
            <form action="../Update" method="POST">
                <input name="id" type="hidden" value="<%= currLec.getId() %>">
                <input name="userType" type="hidden" value="Lecturer">
                <input name="fromProfile" type="hidden" value="yes">
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