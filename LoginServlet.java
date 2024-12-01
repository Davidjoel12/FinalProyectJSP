import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Credenciales de ejemplo
        String validUsername = "admin";
        String validPassword = "1234";

        // Obtener valores del formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validar credenciales
        if (validUsername.equals(username) && validPassword.equals(password)) {
            // Redirigir a la página de recepción
            response.sendRedirect("index.jsp");
        } else {
            // Redirigir al login con mensaje de error
            response.sendRedirect("login.jsp?error=Usuario+o+contraseña+incorrectos");
        }
    }
}
