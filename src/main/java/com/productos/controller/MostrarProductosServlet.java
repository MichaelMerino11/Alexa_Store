package com.productos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.productos.datos.Conexion;

@WebServlet("/MostrarProductosServlet")
public class MostrarProductosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = Conexion.conectar();
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM tb_producto");
                out.println("<table border='1'>");
                out.println("<tr><th>Código</th><th>Categoría</th><th>Nombre</th><th>Cantidad</th><th>Precio</th><th>Imagen</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("id_pr") + "</td>");
                    out.println("<td>" + rs.getInt("id_cat") + "</td>");
                    out.println("<td>" + rs.getString("nombre_pr") + "</td>");
                    out.println("<td>" + rs.getInt("cantidad_pr") + "</td>");
                    out.println("<td>" + rs.getDouble("precio_pr") + "</td>");
                    out.println("<td><img src='https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fes%2Fsearch%3Fq%3DBarcelona&psig=AOvVaw2ncdit88laM_ECH940VMEX&ust=1715193969029000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKDv08uZ_IUDFQAAAAAdAAAAABAE' width='100'></td>");
                    
/*                    out.println("<td><img src='https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fes%2Fsearch%3Fq%3DBarcelona&psig=AOvVaw2ncdit88laM_ECH940VMEX&ust=1715193969029000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKDv08uZ_IUDFQAAAAAdAAAAABAE'" + 
                                java.util.Base64.getEncoder().encodeToString(rs.getBytes("foto_pr")) + 
                                "' width='100'></td>"); */
                    out.println("</tr>");
                }
                out.println("</table>");
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error al obtener los datos de la base de datos: " + e.getMessage());
            }
        } else {
            out.println("Error al conectar a la base de datos.");
        }
    }
}
