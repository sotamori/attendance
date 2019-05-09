<%-- 
    Document   : students_table
    Created on : Aug 18, 2018, 8:25:17 PM
    Author     : asqar
--%>

<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Students"%>
<%@page import="java.util.List"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>IC</th>
        <th>Email</th>
        <th>Address</th>
    </tr>
</thead>
<tbody>
    <%
        List<Students> st = studentFacade.findAll();
        
        for(Students std : st){
        %>
            <tr><td><%= std.getId() %></td>
            <td><a href="student.jsp?id=<%= std.getId() %>"><%= std.getName() %></a></td>
            <td><%= std.getGender() %></td>
            <td><%= std.getPhone() %></td>
            <td><%= std.getIc() %></td>
            <td><%= std.getEmail() %></td>
            <td><%= std.getAddress() %></td></tr>
        <%
        }
    %>
