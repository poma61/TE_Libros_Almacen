<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.Libros"%>
<%@page import="java.util.List"%>
<%
    List<Libros> lib = (List<Libros>) session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="css/style.css" type="text/css" >
        <title>Libros</title>
    </head>
    <body id="lib">
        <div id="libro">
            <h1>Almacen de Libros</h1>
            <p><a href="LibroController?op=nuevo">Nuevo</a></p>
            <table border="1" id="table">
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Disponible</th>
                    <th>Categoria</th>
                    <th>Editar</th>
                    <th>Eliminar</th>

                </tr>
                <c:forEach var="item" items="${sessionScope.almacen}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.autor}</td>
                        <td>${item.disponible}</td>
                        <td>${item.cate.categoria}</td>
                        <td><a href="LibroController?op=editar&id=${item.id}">Editar</a></td>
                        <td><a href="LibroController?op=eliminar&id=${item.id}">Eliminar</a></td>
                    </tr>
                </c:forEach>

            </table>
            
            <p><a href="index.jsp">Ir al Inicio</a></p>
        </div>

    </body>
</html>
