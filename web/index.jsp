<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Personas"%>
<%
    if(session.getAttribute("listaper") == null){
        ArrayList<Personas> la = new ArrayList<Personas> ();
        session.setAttribute("listaper", la);
    }
    ArrayList<Personas> lista = (ArrayList<Personas>) session.getAttribute("listaper");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de personas!</h1>
        <a href="MainServlet?op=nuevo">Nuevo Registro</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Edad</th>
            <th></th>
            <th></th>
        </tr>    
        <%
        if (lista != null){
            for (Personas item : lista){
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getNombre() %></td>
            <td><%= item.getApellidos() %></td>
            <td><%= item.getEdad() %></td>
            <td><a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
            <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>" onclick="return(confirm('Estas seguro de eliminar???'))">Eliminar</a></td>            
        </tr>
        <%
            }
        }
        %>
    </table>     
    </body>
</html>
