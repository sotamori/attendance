<%-- 
    Document   : classes_table
    Created on : Aug 18, 2018, 8:34:52 PM
    Author     : asqar
--%>

<%@page import="model.Classes"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="facades.DepartmentFacadeLocal"%>
<%@page import="facades.ClassesFacadeLocal"%>
<%@page import="facades.LecturersFacadeLocal"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Context context;
LecturersFacadeLocal lecturerFacade;
ClassesFacadeLocal classFacade;
DepartmentFacadeLocal depFacade;
%>
<%
context = new InitialContext();
lecturerFacade = (LecturersFacadeLocal) context
        .lookup("java:global/FinalEPDA/FinalEPDA-ejb/LecturersFacade!facades.LecturersFacadeLocal");
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
        int id = Integer.parseInt(session.getAttribute("departmentId").toString());
        
        List<Classes> cl = classFacade.byDepId(id);
        
        for(Classes cls : cl){
        %>
            <tr><td><%= cls.getId() %></td>
                <td><a href="class.jsp?id=<%= cls.getId() %>"><%= cls.getName() %></a></td>
            <td><%= depFacade.find(cls.getDepartmentId()).getName() %></td>
            <td><%= lecturerFacade.find(cls.getLecturerId()).getName() %></td></tr>
        <%
        }
    %>