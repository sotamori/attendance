<%-- 
    Document   : departments_table
    Created on : Aug 18, 2018, 8:35:07 PM
    Author     : asqar
--%>

<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Department"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
StudentsFacadeLocal studentFacade;
ClassesFacadeLocal classFacade;
DepartmentFacadeLocal depFacade;
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
%>
<thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>HoS</th>
    </tr>
</thead>
<tbody>
    <%
        List<Department> dp = depFacade.findAll();
        
        for(Department dep : dp){
        %>
            <tr><td><%= dep.getId() %></td>
            <td><a href="department.jsp?id=<%= dep.getId() %>"><%= dep.getName() %></a></td>
            <td><%= lecturerFacade.find(dep.getLecturerId()).getName() %></td></tr>
        <%
        }
    %>