<%-- 
    Document   : lecturer_table
    Created on : Aug 18, 2018, 8:24:03 PM
    Author     : asqar
--%>

<%@page import="facades.StudentsFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Lecturers"%>
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
        <th>Gender</th>
        <th>Phone</th>
        <th>IC</th>
        <th>Email</th>
        <th>Address</th>
    </tr>
</thead>
<tbody>
    <%
        List<Lecturers> lc = lecturerFacade.findAll();
        
        for(Lecturers lec : lc){
        %>
            <tr><td><%= lec.getId() %></td>
            <td><a href="lecturer.jsp?id=<%= lec.getId() %>"><%= lec.getName() %></a></td>
            <td><%= lec.getGender() %></td>
            <td><%= lec.getPhone() %></td>
            <td><%= lec.getIc() %></td>
            <td><%= lec.getEmail() %></td>
            <td><%= lec.getAddress() %></td></tr>
        <%
        }
    %>