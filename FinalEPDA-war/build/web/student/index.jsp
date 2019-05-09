<%-- 
    Document   : index
    Created on : Aug 17, 2018, 6:20:44 PM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("student")) response.sendRedirect("../login.jsp");%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Classes"%>
<%@page import="java.util.List"%>
<%@page import="model.AssignStc"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.AssignStcFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="facades.AttendanceFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
StudentsFacadeLocal studentFacade;
DepartmentFacadeLocal depFacade;
ClassesFacadeLocal classFacade;
AssignStcFacadeLocal assignStcFacade;
AttendanceFacadeLocal attFacade;
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
assignStcFacade = (AssignStcFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignStcFacade!facades.AssignStcFacadeLocal");
attFacade = (AttendanceFacadeLocal) context
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
              <a href="#">Student</a>
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
                      <th>Department</th>
                      <th>Lecturer</th>
                      <th>Attendance</th>
                    </tr>
                  </thead>
                  <tbody>
                        <%
                            int student_id = studentFacade.find(Integer.parseInt(session.getAttribute("id").toString())).getId();
                            List<AssignStc> assignedCls = assignStcFacade.byStudentId(student_id);
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
                                <td><%= attFacade.getPercentageOfStdByCls(student_id, cls.getId()) %>%</td></tr>
                        <%
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
