package com.productos.controller;

import java.io.IOException;
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
 * Servlet implementation class EliminarUsuario
 */
@WebServlet("/EliminarUsuario")
public class EliminarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarUsuario() {
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
		String idUsuario = request.getParameter("idUsuario");
        if (idUsuario != null && !idUsuario.isEmpty()) {
            Connection conn = Conexion.conectar();
            if (conn != null) {
                try {
                    String sql = "DELETE FROM tb_usuario WHERE id_us = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(idUsuario));
                    int filasEliminadas = pstmt.executeUpdate();
                    if (filasEliminadas > 0) {
                        // Usuario eliminado correctamente
                        response.sendRedirect("login.jsp");
                    } else {
                        // Error al eliminar el usuario
                    	System.out.println("Hubo un error");
                    }
                    pstmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    System.out.println("Hubo un error");
                }
            } else {
                // Error de conexión a la base de datos
            	System.out.println("Hubo un error");
            }
        } else {
            // ID de usuario no válido
        	System.out.println("Hubo un error");
        }
	}

}
