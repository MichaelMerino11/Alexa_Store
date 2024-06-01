package com.productos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.productos.datos.Conexion;

/**
 * Servlet implementation class EliminarProducto
 */
@WebServlet("/EliminarProducto")
public class EliminarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("Borrado2");
        String id_pr = request.getParameter("id_pr");
        // Código para eliminar el producto
        response.setStatus(HttpServletResponse.SC_OK);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		System.out.println("Borrado");
		int id_pr = Integer.parseInt(request.getParameter("id_pr"));
		System.out.println(id_pr);
        
        
	    Connection conn = Conexion.conectar();
	    if (conn == null) {
	    	System.out.println("Error");
	    	return;
	    }
	    
	    String insertProductoSQL = "DELETE from tb_producto where id_pr = ?";
	    try {
			PreparedStatement statement = conn.prepareStatement(insertProductoSQL);
			statement.setInt(1, id_pr);
			
			int insercion = statement.executeUpdate() ;
			if (insercion > 0) {
				out.println("<h2>Borrado exitoso</h2>");
			}
			else {
				out.println("<h2>Error al borrar</h2>");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.println("Error para guardar en la bdd" + e.getMessage());
		}

        // Código para eliminar el producto
        //response.setStatus(HttpServletResponse.SC_OK);
	}

}
