<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Categoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="css/style.css" type="text/css" >
        <title>Categoria</title>
    </head>
    <body id="cat-edit">
        <div id="categorias">
            <h1>Categorias</h1>
            <p><a href="CategoriaController?op=nuevo">Nuevo</a></p>
            <table border="1"  id="table">
                <tr>
                    <th>Id</th>
                    <th>Categoria</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>    

                <c:forEach var="item" items="${sessionScope.cates}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.categoria}</td>
                        <td><a href="CategoriaController?op=editar&id=${item.id}">Editar</a></td>
                        <td><a href="CategoriaController?op=eliminar&id=${item.id}">Eliminar</a></td>


                    </tr>      

                </c:forEach>      

            </table>
              <p><a href="index.jsp">Ir al Inicio</a></p>
        </div>

    </body>
</html>
