<%-- 
    Document   : register
    Created on : Aug 18, 2018, 8:06:24 AM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("student")) response.sendRedirect("../login.jsp");%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Students"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
StudentsFacadeLocal studentFacade;
%>
<%
context = new InitialContext();
studentFacade = (StudentsFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/StudentsFacade!facades.StudentsFacadeLocal");
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
      
      if(!session.getAttribute("user").equals("student")){
          response.sendError(423);
      }else{
          currStd = studentFacade.find(session.getAttribute("id"));
      }
  %>
  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
          <div class="card-header">Your profile</div>
        <div class="card-body">
            <form action="../Update" method="POST">
                <input name="id" type="hidden" value="<%= currStd.getId() %>">
                <input name="userType" type="hidden" value="Student">
                <input name="fromProfile" type="hidden" value="yes">
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