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
 * Servlet implementation class ModificarPersona
 */
@WebServlet("/ModificarPersona")
public class ModificarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarPersona() {
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
		System.out.println("HOLAAAA 3");

		String idUsuario = request.getParameter("idUsuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String perfil = request.getParameter("perfil");
        String estadoCivil = request.getParameter("estadoCivil");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        System.out.println(estadoCivil + " y " + perfil);
        
        
        if (idUsuario != null && !idUsuario.isEmpty()) {
            Connection conn = Conexion.conectar();
            if (conn != null) {
                try {
                    String sql = "UPDATE tb_usuario SET nombre_us = ?, apellido_us = ?, cedula_us = ?, id_per = ?, id_est = ?, correo_us = ?, clave_us = ? WHERE id_us = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, nombre);
                    pstmt.setString(2, apellido);
                    pstmt.setString(3, cedula);
                    pstmt.setInt(4, Integer.parseInt(perfil));
                    pstmt.setInt(5, Integer.parseInt(estadoCivil));
                    pstmt.setString(6, correo);
                    pstmt.setString(7, clave);
                    pstmt.setInt(8, Integer.parseInt(idUsuario));
                    
                    int filasActualizadas = pstmt.executeUpdate();
                    if (filasActualizadas > 0) {
                        // Usuario actualizado correctamente
                        response.sendRedirect("login.jsp");
                    } else {
                        // Error al actualizar el usuario
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
