<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@page import="java.util.*, JAVA.Personal" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Habitaciones Libres</title>
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
                    <li><a href="clientesHospedados.jsp">Clientes</a></li>
                    <li><a href="#">Reportes</a></li>
                    <li><a href="login.jsp">Salida</a></li>
                </ul>
            </nav>
        </aside>
        <div class="container">
            <h1>Habitaciones Libres</h1>

            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div style="color: red;"><%= error %></div>
            <% 
                } 
            %>

            <table>
                <thead>
                    <tr>
                        <th>Número</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            List<Personal> habitaciones = (List<Personal>) request.getAttribute("habitacionesLibres");
                            if (habitaciones != null && !habitaciones.isEmpty()) {
                                for (Personal habitacion : habitaciones) {
                    %>
                    <tr>
                        <td><%= habitacion.getNumeroHabitacion() %></td>
                        <td><%= habitacion.getTipo() %></td>
                        <td><%= habitacion.getDescripcion() %></td>
                        <td><%= habitacion.getPrecio() %></td>
                    </tr>

                    <%
                                }
                            } else {
                    %>
                    <tr>
                        <td colspan="4">No se encontraron habitaciones libres.</td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='4' style='color: red;'>Error al procesar datos: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
            <a href="index.jsp" class="back-button">Volver al Inicio</a>
        </div>
    </div>
</body>
</html>
