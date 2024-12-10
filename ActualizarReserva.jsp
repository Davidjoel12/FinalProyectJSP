<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, JAVA.Reserva"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Reservación</title>
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
        <h1>Actualizar Reservación</h1>
        <form action="ActualizarReservaServlet" method="POST">
            <input type="hidden" name="huespedId" value="<%= request.getAttribute("huespedId") %>" />

            <label for="nombre">Nombre del Huésped:</label>
            <input type="text" id="nombre" name="nombre" required value="<%= request.getAttribute("nombre") %>" />

            <label for="apellido">Apellido del Huésped:</label>
            <input type="text" id="apellido" name="apellido" required value="<%= request.getAttribute("apellido") %>" />

            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required value="<%= request.getAttribute("telefono") %>" />

            <label for="tipoHabitacion">Tipo de Habitación:</label>
            <select id="tipoHabitacion" name="tipoHabitacion">
                <option value="Individual" <%= "Individual".equals(request.getAttribute("tipoHabitacion")) ? "selected" : "" %>>Individual</option>
                <option value="Doble" <%= "Doble".equals(request.getAttribute("tipoHabitacion")) ? "selected" : "" %>>Doble</option>
                <option value="Suite" <%= "Suite".equals(request.getAttribute("tipoHabitacion")) ? "selected" : "" %>>Suite</option>
                <option value="Matrimonial" <%= "Matrimonial".equals(request.getAttribute("tipoHabitacion")) ? "selected" : "" %>>Matrimonial</option>
                <option value="Familiar" <%= "Familiar".equals(request.getAttribute("tipoHabitacion")) ? "selected" : "" %>>Familiar</option>
            </select>

            <label for="fechaEntrada">Fecha de Entrada:</label>
            <input type="date" id="fechaEntrada" name="fechaEntrada" required value="<%= request.getAttribute("fechaEntrada") %>" />

            <label for="fechaSalida">Fecha de Salida:</label>
            <input type="date" id="fechaSalida" name="fechaSalida" required value="<%= request.getAttribute("fechaSalida") %>" />

            <button type="submit" value="Actualizar">Actualizar Reservación</button>
        </form>

        <a href="HabitacionesOcupadasServlet" class="back-link">Cancelar</a>
    </div>
</body>
</html>
