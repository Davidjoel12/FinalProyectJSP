<%@page import="JAVA.Personal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Personal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            width: 90%;
            margin: 20px auto;
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #2F4858;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 16px;
        }

        table th, table td {
            text-align: left;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #2F4858;
            color: #fff;
            text-transform: uppercase;
            font-size: 14px;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2F4858;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-size: 16px;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #1976d2;
        }

        .wrapper {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #ecf0f1;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 1px solid #34495e;
        }

        .logo .icon {
            font-size: 30px;
        }

        .menu {
            flex-grow: 1;
            padding: 20px 0;
        }

        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            margin-bottom: 10px;
        }

        .menu a {
            text-decoration: none;
            color: #ecf0f1;
            padding: 10px 20px;
            display: block;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .menu a.active,
        .menu a:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>
    
    <div class="wrapper">
        <aside class="sidebar">
            <div class="logo">
                <span class="icon">🏨</span>
                <span>HOTEL</span>
            </div>
            <nav class="menu">
                <ul>
                    <li><a href="index.jsp">Recepción</a></li>
                    <li><a href="HuespedesServlet">Clientes</a></li>
                    <li><a href="#">Reportes</a></li>
                    <li><a href="login.jsp">Salida</a></li>
                </ul>
            </nav>
        </aside>
        <div class="container">
            <h1 class="text-center">Personal</h1>

            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
            <% 
                } 
            %>

            <table>
                <thead>
                    <tr>
                        <th>Personal ID</th>
                        <th>Nombre del personal</th>
                        <th>Correo</th>
                        <th>Telefono</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Personal> personalList = (List<Personal>) request.getAttribute("personal");
                        if (personalList != null && !personalList.isEmpty()) {
                            for (Personal person : personalList) {
                    %>
                    <tr>
                        <td><%= person.getId()%></td>
                        <td><%= person.getNombre() %> <%= person.getApellido() %></td>
                        <td><%= person.getCorreo() %></td>
                        <td><%= person.getTelefono() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4" class="text-center">No se encontro personal disponible.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <a href="index.jsp" class="back-button">Volver al Inicio</a>
        </div>
    </div>
</body>
</html>
