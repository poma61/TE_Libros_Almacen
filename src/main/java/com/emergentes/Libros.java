package com.emergentes;
public class Libros {
private int id;
private String titulo;
private String autor;
private String disponible;
private Categoria cate;
    public Libros() {
    this.id=0;
this.titulo="";
this.autor="";
this.disponible="";
this.cate=new Categoria();
        
    }
    public Libros(int id, String titulo, String autor, String disponible, Categoria cate) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.disponible = disponible;
        this.cate = cate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getDisponible() {
        return disponible;
    }

    public void setDisponible(String disponible) {
        this.disponible = disponible;
    }

    public Categoria getCate() {
        return cate;
    }

    public void setCate(Categoria cate) {
        this.cate = cate;
    }

    
    
    
    
    
    
    
}
