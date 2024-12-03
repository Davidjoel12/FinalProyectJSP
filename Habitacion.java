package JAVA;

public class Habitacion {
    private String numeroHabitacion;
    private String tipo;
    private double precio;
    private String descripcion;

    // Constructor vacío
    public Habitacion() {}

    // Constructor con parámetros
    public Habitacion(String numeroHabitacion, String tipo, double precio, String descripcion) {
        this.numeroHabitacion = numeroHabitacion;
        this.tipo = tipo;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public String getNumeroHabitacion() {
        return numeroHabitacion;
    }

    public void setNumeroHabitacion(String numeroHabitacion) {
        this.numeroHabitacion = numeroHabitacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
