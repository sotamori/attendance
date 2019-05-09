<%-- 
    Document   : index
    Created on : Aug 17, 2018, 6:20:44 PM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("hos")) response.sendRedirect("../login.jsp");%>
<%@page import="model.Attendance"%>
<%@page import="java.util.List"%>
<%@page import="model.Classes"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.AttendanceFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
AttendanceFacadeLocal attFacade;
ClassesFacadeLocal classFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");
attFacade  = (AttendanceFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AttendanceFacade!facades.AttendanceFacadeLocal");
%>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Attendance System</title>

    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">

      <jsp:include page="layout/nav.jsp" />

    <div id="wrapper">

      <!-- Sidebar -->
      <jsp:include page="layout/leftbar.jsp" />

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">Head of Department</a>
            </li>
            <li class="breadcrumb-item active">Overview</li>
          </ol>

          <!-- Data Set -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Attendance Table</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Class</th>
                      <th>Lecturer</th>
                      <th>Date</th>
                      <th>Absence</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                        List<Classes> classes = classFacade.byDepId(Integer.parseInt(session.getAttribute("departmentId").toString()));
                        List<Attendance> atts = attFacade.getClassesGroupedByDate();
                        int abs;
                        for(Attendance att : atts){
                            abs=0;
                            if(classes.contains(classFacade.find(att.getClassId()))){;
                                if(attFacade.getClass(att.getClassId(), att.getDate()).size()!=0){abs = (attFacade.getClassPresent(att.getClassId(), att.getDate()).size()*100)/attFacade.getClass(att.getClassId(), att.getDate()).size();}
                    %>
                    <tr>
                                <td><%= att.getId() %></td>
                                <td><a href="view.jsp?id=<%= att.getClassId() %>&date=<%= att.getDate() %>"><%= classFacade.find(att.getClassId()).getName() %></a></td>
                                <td><%= lecturerFacade.find(classFacade.find(att.getClassId()).getLecturerId()).getName() %></td>
                                <td><%= att.getDate() %></td>
                                <td><%= abs %>%</td>
                    </tr>
                    <%      }
                        }
                    %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright © Imangali Turar 2018</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="layout/logout.jsp" />

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="../vendor/chart.js/Chart.min.js"></script>
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="../js/demo/datatables-demo.js"></script>
    <script src="../js/demo/chart-area-demo.js"></script>

  </body>

</html>
