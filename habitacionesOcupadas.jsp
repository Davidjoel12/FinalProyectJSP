<%@page import="JAVA.HabitacionOcupada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Habitaciones Ocupadas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            flex: 1;
            margin-left: 200px; /* Ajusta según el ancho de la barra lateral */
            width: calc(100% - 200px); /* Reduce el ancho para que no se desborde */
            max-width: 1200px;
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow-x: auto;
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
            width: 200px;
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
        
        .main-container {
            display: flex;
        }
    </style>
</head>
<body>
    <div class="main-container">
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
                <h1 class="text-center">Habitaciones Ocupadas</h1>

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
                            <th>Huespedes ID</th>
                            <th>Nombre del Huésped</th>
                            <th>Teléfono</th>
                            <th>Numero de habitacion</th>
                            <th>Tipo</th>
                            <th>Descripción</th>
                            <th>Fecha de Entrada</th>
                            <th>Fecha de Salida</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<HabitacionOcupada> habitaciones = (List<HabitacionOcupada>) request.getAttribute("habitacionesOcupadas");
                            if (habitaciones != null && !habitaciones.isEmpty()) {
                                for (HabitacionOcupada habitacion : habitaciones) {
                        %>
                        <tr>
                            <td><%= habitacion.getHuespedId() %></td>
                            <td><%= habitacion.getNombre() %> <%= habitacion.getApellido() %></td>
                            <td><%= habitacion.getTelefono() %></td>
                            <td><%= habitacion.getNumeroHabitacion() %></td>
                            <td><%= habitacion.getTipo() %></td>
                            <td><%= habitacion.getDescripcion() %></td>
                            <td><%= habitacion.getFechaEntrada() %></td>
                            <td><%= habitacion.getFechaSalida() %></td>
                            <td>
                               <form action="ActualizarReservaServlet" method="get">
                                    <input type="hidden" name="huespedId" value="<%= habitacion.getHuespedId() %>" />
                                    <button type="submit" style="background-color: #2F4858; color: #fff; border: none; padding: 8px 12px; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">
                                        Actualizar Reserva
                                    </button>
                                </form>
                                <form action="EliminarReservaServlet" method="post" style="display: inline-block;" 
                                        onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta reserva?');">
                                    <input type="hidden" name="huespedId" value="<%= habitacion.getHuespedId() %>" />
                                    <button type="submit" style="background-color: #d9534f; color: #fff; border: none; padding: 8px 12px; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">
                                        Eliminar Reserva
                                    </button>
                                </form>

                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center">No se encontraron habitaciones ocupadas.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <a href="index.jsp" class="back-button">Volver al Inicio</a>
            </div>
        </div>
    </div>
</body>
</html>
