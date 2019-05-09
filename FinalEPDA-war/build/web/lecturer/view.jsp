<%-- 
    Document   : view
    Created on : Aug 23, 2018, 7:22:27 PM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("lecturer")) response.sendRedirect("../login.jsp");%>
<%@page import="model.Attendance"%>
<%@page import="facades.AttendanceFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Students"%>
<%@page import="model.AssignStc"%>
<%@page import="facades.AssignStcFacadeLocal"%>
<%@page import="model.Classes"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
StudentsFacadeLocal studentFacade;
ClassesFacadeLocal classFacade;
AssignStcFacadeLocal stcFacade;
AttendanceFacadeLocal attFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
classFacade = (ClassesFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/ClassesFacade!facades.ClassesFacadeLocal");
stcFacade  = (AssignStcFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignStcFacade!facades.AssignStcFacadeLocal");
studentFacade  = (StudentsFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/StudentsFacade!facades.StudentsFacadeLocal");
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

          <!-- DataTables Example -->
          <form action="../modifyAtt" method="POST"><div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              <%= classFacade.find(Integer.parseInt(request.getParameter("id"))).getName() %> / <%= request.getParameter("date") %>
              <input type="hidden" name="class_id" value="<%=request.getParameter("id")%>">
              <input type="hidden" name="date" value="<%= request.getParameter("date") %>">
              <input type="submit" value="Modify"></div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <input type="hidden" value="<%= request.getParameter("id") %>" name="class_id">
                    <input type="hidden" value="<%= request.getParameter("date") %>" name="date">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            String date = request.getParameter("date");
                            System.out.println(id + " : " + date);
                            List<Attendance> list = attFacade.getClass(id, date);
                            
                            for(Attendance att : list){
                                Students newStudent = studentFacade.find(att.getStudentId());
                                String P = "", A = "", L = "";
                                if(att.getStatus().equals("Present")){
                                    P = "selected";
                                } else if(att.getStatus().equals("Absent")){
                                    A = "selected";
                                } else if(att.getStatus().equals("Late")){
                                    L = "selected";
                                }
                        %>
                        
                        <tr>
                            <td><%= newStudent.getId() %></td>
                            <td><%= newStudent.getName() %></td>
                            <td>
                                <select name="<%= newStudent.getId() %>" class="custom-select">
                                    <option <%=P%> selected value="Present">Present</option>
                                    <option <%=A%> value="Absent">Absent</option>
                                    <option <%=L%> value="Late">Late</option>
                                </select>
                            </td>
                        </tr>
                        <% }
                        %>
                    </tbody>
                </table>
              </div>
            </div>
          </div></form>
               
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
