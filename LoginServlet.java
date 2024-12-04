package JAVA;

import static JAVA.Conexion.getConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los valores ingresados en el formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Conexión a la base de datos
        Connection con = null;

        try {
            con = getConnection();
            if (con != null) {
                String sql = "SELECT * FROM Personal WHERE nombre = ? AND contraseña = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password); // No es necesario encriptar la contraseña

                // Imprimir la consulta para depuración
                System.out.println("Ejecutando consulta: " + sql);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    // Usuario autenticado
                    System.out.println("Usuario autenticado: " + username);
                    response.sendRedirect("index.jsp"); // Redirige a la página principal
                } else {
                    // Usuario o contraseña incorrectos
                    System.out.println("Credenciales incorrectas para usuario: " + username);
                    response.sendRedirect("login.jsp?error=Usuario o contraseña incorrectos");
                }
            } else {
                // Error al conectar a la base de datos
                System.err.println("No se pudo establecer conexión a la base de datos.");
                response.sendRedirect("login.jsp?error=Error al conectar con la base de datos");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Ocurrió un error interno");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
