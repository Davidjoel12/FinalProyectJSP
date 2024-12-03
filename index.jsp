<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recepción</title>
</head>
<body>
    <!-- -----------------CSS--------------------------- --> 
    <style>
    
        body {
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
          background-color: #f4f4f4;
          color: #333;
        }

        .wrapper {
          display: flex;
        }

        /* Sidebar Styles */
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

        /* Main Content Styles */
        .content {
          margin-left: 250px; /* Sidebar width */
          padding: 20px;
          width: 100%;
        }

        .title {
          margin-bottom: 20px;
          font-size: 24px;
          color: #444;
          text-align: center;
        }

        /* Status Counters */
        .status-counters {
          display: flex;
          justify-content: space-around;
          margin-bottom: 20px;
        }

        .status {
          text-align: center;
          background: #fff;
          border-radius: 8px;
          padding: 10px;
          width: 100px;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .status-label {
          display: block;
          font-weight: bold;
          margin-bottom: 5px;
        }

        .status-count {
          font-size: 20px;
          color: #555;
        }

        /* Card Styles */
        .card-container {
          display: flex;
          justify-content: space-around;
          flex-wrap: wrap;
          gap: 15px;
        }

        .card {
          width: 180px;
          height: 120px;
          background: #fff;
          border-radius: 8px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          text-align: center;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s, box-shadow 0.2s;
          cursor: pointer;
        }

        .card:hover {
          transform: translateY(-5px);
          box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .card p {
          margin: 5px 0 0;
          font-weight: bold;
          color: #444;
        }

        .card .icon {
          font-size: 30px;
          margin-bottom: 10px;
        }

        /* Card-specific Styles */
        .create-reservation {
          background: #e0f7fa;
        }
        
        .update-reservation {
          background: #F6D8AE;
        }

        .occupied {
          background: #ffcdd2;
        }

        .free {
          background: #c8e6c9;
        }

        .cleaning {
          background: #ffe082;
        }

    </style>
    <!-- -------------------------------------------------- -->
  <div class="wrapper">
    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="logo">
        <span class="icon">🏨</span>
        <span>HOTEL</span>
      </div>
      <nav class="menu">
        <ul>
          <li><a href="index.jsp" class="active">Recepción</a></li>
          <li><a href="login.jsp">Salida</a></li>
          <li><a href="clientesHospedados.jsp">Clientes</a></li>
          <li><a href="#">Reportes</a></li>
        </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="content">
      <h1 class="title">Entrada de hospedamiento</h1>
      <div class="status-counters">
        <div class="status">
          <span class="status-label">En limpieza</span>
          <span class="status-count">1</span>
        </div>
        <div class="status">
          <span class="status-label">Ocupado</span>
          <span class="status-count">2</span>
        </div>
        <div class="status">
          <span class="status-label">Libre</span>
          <span class="status-count">4</span>
        </div>
      </div>
      <div class="card-container">
        <div class="card create-reservation" onclick="window.location.href='crearReserva.jsp';">
            <span class="icon">➕</span>
            <p>Crear reservación</p>
        </div>
        <div class="card update-reservation" onclick="window.location.href='actualizar.jsp';">
          <span class="icon">➕</span>
          <p>Actualizar reservación</p>
        </div>
        <div class="card occupied">
          <span class="icon">🛌</span>
          <p>Ocupado</p>
        </div>
        <div class="card free">
          <span class="icon">🛏️</span>
          <p>Libre</p>
        </div>
        <div class="card cleaning">
          <span class="icon">🧹</span>
          <p>Limpieza</p>
        </div>
      </div>
    </main>
  </div>
    
    <script>
        document.querySelectorAll('.card').forEach(card => {
        card.addEventListener('click', () => {
          const status = card.querySelector('p').textContent;
          alert(`Has seleccionado: ${status}`);
        });
      });
    </script>
</body>
</html>
