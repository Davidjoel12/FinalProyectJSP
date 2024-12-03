<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Hotel</title>
  <link rel="stylesheet" href="login-styles.css">
</head>
<body>
    <style>
        /* General Styles */
        body {
          margin: 0;
          padding: 0;
          font-family: Arial, sans-serif;
          background: #2c3e50;
          color: #fff;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }

        /* Login Container */
        .login-container {
          width: 100%;
          max-width: 400px;
          background: #34495e;
          padding: 30px;
          border-radius: 8px;
          box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        /* Form Styles */
        .login-form {
          display: flex;
          flex-direction: column;
        }

        h2 {
          text-align: center;
          margin-bottom: 20px;
          font-size: 24px;
        }

        .input-group {
          margin-bottom: 15px;
        }

        .input-group label {
          display: block;
          margin-bottom: 5px;
          font-weight: bold;
        }

        .input-group input {
          width: 100%;
          padding: 10px;
          border: none;
          border-radius: 4px;
          background: #ecf0f1;
          color: #2c3e50;
          font-size: 14px;
        }

        button {
          background: #1abc9c;
          color: #fff;
          border: none;
          padding: 10px;
          border-radius: 4px;
          font-size: 16px;
          cursor: pointer;
          transition: background 0.3s ease;
        }

        button:hover {
          background: #16a085;
        }

        .error-message {
          color: #e74c3c;
          text-align: center;
          margin-bottom: 15px;
          font-size: 14px;
        }
    </style>
    <div class="login-container">
        <form action="LoginServlet" method="POST" class="login-form">
            <h2>Iniciar Sesión</h2>
            <div class="input-group">
                <label for="username">Usuario</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>
            </div>
            <!-- Mostrar mensaje de error si existe -->
            <%
                String errorMessage = request.getParameter("error");
                if (errorMessage != null) {
            %>
                <div class="error-message"><%= errorMessage %></div>
            <% } %>
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>
