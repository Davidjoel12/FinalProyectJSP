<%-- 
    JSP para agregar una reservación
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, JAVA.Habitacion" %>
<%@page import="java.util.*, JAVA.Reserva" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Reservación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2F4858;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            background-color: #2F4858;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1976d2;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: #1976d2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registrar Reservación</h1>

        <form action="AgregarReservaServlet" method="post">
            <label for="nombre">Nombre del Huésped:</label>
            <input type="text" id="nombre" name="nombre" required placeholder="Ejemplo: Juan" />

            <label for="apellido">Apellido del Huésped:</label>
            <input type="text" id="apellido" name="apellido" required placeholder="Ejemplo: Pérez" />

            <label for="correo">Correo (opcional):</label>
            <input type="email" id="correo" name="correo" placeholder="Ejemplo: juan.perez@gmail.com" />

            <label for="telefono">Teléfono (opcional):</label>
            <input type="text" id="telefono" name="telefono" placeholder="Ejemplo: +507 6123-4567" />

            <label for="fechaEntrada">Fecha de Entrada:</label>
            <input type="date" id="fechaEntrada" name="fechaEntrada" required />

            <label for="fechaSalida">Fecha de Salida:</label>
            <input type="date" id="fechaSalida" name="fechaSalida" required />

            <%-- Número de habitación pasado como campo oculto --%>
            <input type="hidden" name="numeroHabitacion" value="<%= request.getParameter("numeroHabitacion") %>" />

            <button type="submit">Confirmar Reservación</button>
        </form>

        <a href="HabitacionesLibresServlet" class="back-link">Cancelar</a>
    </div>
</body>
</html>
