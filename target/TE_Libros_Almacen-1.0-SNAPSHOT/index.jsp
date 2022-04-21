<%@page import="com.emergentes.Categoria"%>
<%@page import="com.emergentes.Libros"%>
<%@page import="java.util.ArrayList"%>
<%
  if(session.getAttribute("almacen")==null)
  {
      ArrayList<Libros> lisaux=new ArrayList<Libros>();
      session.setAttribute("almacen", lisaux);
  }
if(session.getAttribute("cates")==null){
    ArrayList<Categoria> liscat=new ArrayList<Categoria>();
    liscat.add(new Categoria(1,"Novela"));
    liscat.add(new Categoria(2,"Historia"));
    liscat.add(new Categoria(3,"Cuento"));
    session.setAttribute("cates", liscat);
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style.css" type="text/css" >
           
        <title>Almacen</title>
    </head>
    <body id="in">
        <div id="menu">
        <h1>Almacen</h1>
        
            <a href="Libro.jsp">Libros</a>
            <br>
            <a href="categorias.jsp">Categorias</a>
        
        
       </div> 
        
    </body>
</html>
