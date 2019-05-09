<%-- 
    Document   : classes
    Created on : Aug 18, 2018, 8:15:19 AM
    Author     : asqar
--%>
<%if(!session.getAttribute("user").equals("hos")) response.sendRedirect("../login.jsp");%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Lecturers"%>
<%@page import="model.AssignLtd"%>
<%@page import="facades.AssignLtdFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
DepartmentFacadeLocal depFacade;
AssignLtdFacadeLocal ltdFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
depFacade = (DepartmentFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/DepartmentFacade!facades.DepartmentFacadeLocal");
ltdFacade = (AssignLtdFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/AssignLtdFacade!facades.AssignLtdFacadeLocal");

int departmentId = Integer.parseInt(session.getAttribute("departmentId").toString());
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
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Data Table</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">              
                    <jsp:include page="layout/classes_table.jsp" />
                  </tbody>
                </table>
              </div>
            </div>
          </div>
                  
            <div class="form-group">
              <form action="../Class" method="POST">
                  <input name="department_id" type="hidden" value="<%= departmentId %>">
              <div class="form-row">
                <div class="col-md-4">
                  <div class="form-label-group">
                  <input name="name" type="text" id="inputEmail" class="form-control" placeholder="Class name" required="required">
                <label for="inputEmail">Name</label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <select style="height: 50px; padding-top: 0px;" required="required" name="lecturer_id" class="custom-select">
                        <%
                            List<AssignLtd> ltd = ltdFacade.getByDepartment(departmentId);
                            
                            List<Lecturers> lecs = new ArrayList<Lecturers>();
                            for(AssignLtd assignltd : ltd){
                                Lecturers newLec = lecturerFacade.find(assignltd.getLecturerId());
                                lecs.add(newLec);
                            }
                            
                            for(Lecturers lec : lecs){
                        %>
                        <option value="<%= lec.getId() %>"><%= lec.getName() %></option>
                        <%}%>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input class="btn btn-primary btn-block" type="submit" value="Add New Class">
                  </div>
                </div>
              </div>
              </form>
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
