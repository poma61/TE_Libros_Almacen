<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.Libros"%>
<%@page import="com.emergentes.Categoria"%>
<%
    List<Categoria> categori = (List<Categoria>) request.getAttribute("categor");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" >
        <title>Edicion</title>
    </head>
    <body id="lib-edit">
        <div id="libro-edit">


            <h1>
                <c:if test="${requestScope.op=='grabar'}" var="res1" scope="request" >    
                    Registro de 
                </c:if>
                <c:if test="${requestScope.op=='editar'}" var="res1" scope="request" >    
                    Modificar
                </c:if>
                Libros

            </h1>

            <jsp:useBean id="almacenes" scope="request" class="com.emergentes.Libros"/>
            <jsp:useBean id="ca" scope="request" class="com.emergentes.Categoria"/>


            <form action="LibroController" method="post">
                <table id="table" >
                    <tr>
                        <td>Id:</td>
                        <td><input type="text" name="id" value="<jsp:getProperty name="almacenes" property="id" />"></td>
                    </tr>
                    <tr>
                        <td>Titulo:</td>
                        <td><input type="text" name="titulo" value="${almacenes.titulo}" ></td>
                    </tr>   
                    <tr>
                        <td>Autor:</td>
                        <td><input type="text" name="autor" value="<jsp:getProperty name="almacenes" property="autor"/>" ></td>
                    </tr>   

                    <tr>
                        <td>Disponible:</td>
                        <td>
                            <select name="disponible">
                                <option value="si"
                                        <c:if test="${almacenes.disponible=='si'}" var="res2" scope="request">
                                            selected
                                        </c:if>
                                        >Si</option>   

                                <option value="no"
                                        <c:if test="${almacenes.disponible=='no'}" var="res2" scope="request">
                                            selected
                                        </c:if>
                                        >No</option>
                            </select>
                        </td>
                    </tr>   


                    <tr>
                        <td>Categoria:</td>
                        <td><select name="idcat">

                                <%for (Categoria c : categori) {%>
                                <option 
                                    value="<%=c.getId()%>" 
                                    <%=(c.getId() == almacenes.getCate().getId()) ? "selected" : ""%>      

                                    >
                                    <%=c.getCategoria()%> </option>
                                    <%}%>
                            </select></td>
                    </tr>  
                    <tr>
                        <td>
                            <input type="hidden" name="op" value="${requestScope.op}"/>

                        </td>
                        <td><input type="submit" value="Procesar"></td>
                    </tr>


                </table>  

            </form>

            <p><a href="Libro.jsp">Volver</a></p>
        </div>          
    </body>
</html>
