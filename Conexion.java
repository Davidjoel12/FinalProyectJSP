package JAVA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=GestionHospedaje;encrypt=true;trustServerCertificate=true";
    private static final String USER = "Juan";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Cargar el driver explícitamente
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Establecer conexión
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver JDBC.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) {
        Connection con = getConnection();
        if (con != null) {
            System.out.println("Conexión exitosa a la base de datos.");
            try {
                con.close();
                System.out.println("Conexión cerrada correctamente.");
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("Conexión fallida.");
        }
    }
}

