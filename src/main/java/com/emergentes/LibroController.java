package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "LibroController", urlPatterns = {"/LibroController"})
public class LibroController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = (request.getParameter("op").equals("")) ? "listar" : request.getParameter("op");
        Libros lib = new Libros();
      
        int id;
        HttpSession ses = request.getSession();
        List<Libros> lista = (List<Libros>) ses.getAttribute("almacen");
        List<Categoria> categorias = (List<Categoria>) ses.getAttribute("cates");  
      
        switch (op) {
            case "nuevo":
                if (lista.size() == 0) {
                    lib.setId(1);
                } else {
                    lib.setId(lista.get(lista.size() - 1).getId() + 1);
                }
                  request.setAttribute("op", "grabar");
                request.setAttribute("categor", categorias);
                  request.setAttribute("almacenes", lib);
              
             request.getRequestDispatcher("libro-edit.jsp").forward(request, response);
              break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                lib = lista.get(PosNodoLibro(id, request));
                request.setAttribute("categor", categorias);
                request.setAttribute("almacenes", lib);
                request.setAttribute("op", op);
                request.getRequestDispatcher("libro-edit.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                int pos = PosNodoLibro(id, request);
                lista.remove(pos);
                response.sendRedirect("Libro.jsp");
                break;
            case "listar":
                request.setAttribute("almacen", lista);
                response.sendRedirect("Libro.jsp");
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String disponible = request.getParameter("disponible");
        int idcat = Integer.parseInt(request.getParameter("idcat"));
        String op = request.getParameter("op");
        Categoria cat = NodoCategoria(idcat, request);
        Libros lib = new Libros();
        lib.setId(id);
        lib.setTitulo(titulo);
        lib.setAutor(autor);
        lib.setDisponible(disponible);
        lib.setCate(cat);

        HttpSession ses = request.getSession();
        List<Libros> alma = (List<Libros>) ses.getAttribute("almacen");
        if (op.equals("grabar")) {
            alma.add(lib);
        } else {
            alma.set(PosNodoLibro(id, request), lib);
        }
        response.sendRedirect("Libro.jsp");
    }
//metodos personalizados

    public int PosNodoLibro(int id, HttpServletRequest request) {
        int index = -1;
        HttpSession ses = request.getSession();
        List<Libros> lista = (List<Libros>) ses.getAttribute("almacen");
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == id) {
                index = i;
                break;
            }
        }

        return index;
    }

    public Categoria NodoCategoria(int id, HttpServletRequest request) {
        Categoria aux = new Categoria();
        HttpSession ses = request.getSession();
        List<Categoria> lista = (List<Categoria>) ses.getAttribute("cates");
        for (Categoria obj : lista) {
            if (obj.getId() == id) {
                aux = obj;
                break;
            }
        }

        return aux;
    }

}
