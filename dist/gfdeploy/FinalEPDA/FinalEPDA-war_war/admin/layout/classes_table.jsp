<%-- 
    Document   : classes_table
    Created on : Aug 18, 2018, 8:34:52 PM
    Author     : asqar
--%>

<%@page import="model.Classes"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.StudentsFacadeLocal"%>
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
        <th>Department</th>
        <th>Lecturer</th>
    </tr>
</thead>
<tbody>
    <%
        List<Classes> classes = classFacade.findAll();
        
        for(Classes cls : classes){
        %>
            <tr><td><%= cls.getId() %></td>
            <td><%= cls.getName() %></td>
            <td><%= depFacade.find(cls.getDepartmentId()).getName() %></td>
            <td><%= lecturerFacade.find(cls.getLecturerId()).getName() %></td></tr>
        <%
        }
    %>