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

import org.apache.el.util.Validation;

import com.productos.datos.Conexion;

import Utils.ValidationUtils;

@WebServlet("/ProcesarRegistroServlet")
public class ProcesarRegistroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String perfil = request.getParameter("perfil");
        String estadoCivil = request.getParameter("estadoCivil");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");

        // Validar los datos del formulario
        if (nombre == null || nombre.isEmpty() || apellido == null || apellido.isEmpty() || cedula == null
                || cedula.isEmpty() || perfil == null || perfil.isEmpty() ||estadoCivil == null || estadoCivil.isEmpty() 
                || correo == null || correo.isEmpty() || clave == null || clave.isEmpty()) {
            response.getWriter().println("Todos los campos son obligatorios");
            return;
        }

        // Validar la cédula
        if (!ValidationUtils.validarCedula(cedula)) {
            response.getWriter().println("Número de cédula inválido");
            return;
        }

        // Validar el correo electrónico
        if (!ValidationUtils.validarCorreo(correo)) {
            response.getWriter().println("Correo electrónico inválido");
            return;
        }

        // Validar la clave
        if (clave.length() < 6) {
            response.getWriter().println("La clave debe tener al menos 6 caracteres");
            return;
        }

        // Insertar los datos en la base de datos
        Connection conn = Conexion.conectar();
        if (conn != null) {
            try {
                String sql = "INSERT INTO tb_usuario (id_est, id_per, nombre_us, apellido_us, cedula_us, correo_us, clave_us) VALUES  (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(estadoCivil));
                statement.setInt(2, Integer.parseInt(perfil));
                statement.setString(3, nombre);
                statement.setString(4, apellido);
                statement.setString(5, cedula);
                statement.setString(6, correo);
                statement.setString(7, clave);
                int filasInsertadas = statement.executeUpdate();
                if (filasInsertadas > 0) {
                	response.sendRedirect("login.jsp");
                } else {
                    response.getWriter().println("Error al registrar el usuario");
                }
            } catch (SQLException e) {
                response.getWriter().println("Error al conectar a la base de datos: " + e.getMessage());
            } finally {
                Conexion.cerrarConexion(conn);
            }
        } else {
            response.getWriter().println("Error al conectar a la base de datos");
        }
    }


}
