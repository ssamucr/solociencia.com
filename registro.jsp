<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
	<style>
		body {
    background: linear-gradient(45deg, #19212d, #361f38, #434e1f, #4f322e, #25354e);
    background-size: 400% 400%;
    animation: fondo 8s ease-in-out infinite normal;
}

@keyframes fondo {
    0% {background-position: 0 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0 50%;}
}
	</style>
	<script>
		// Muestra mensaje de registro correcto y luego redirecciona de nuevo a pagina 1
        function mostrarPopup() {
            alert("Registrado correctamente");
        }

        window.onload = function() {
            mostrarPopup();
            window.location.href = "./login.html";
        };
    </script>
</head>
<body>
	<%
	  // Obtener los par�metros del formulario
	  String cedula = request.getParameter("cedula");
	  String nombre = request.getParameter("Nombre");
	  String apellido = request.getParameter("Apellido");
	  int edad = Integer.parseInt(request.getParameter("Edad"));
	  String contrase�a = request.getParameter("contrasena");
	  
	// Configurar la conexi�n a la base de datos
	    String ruta = "jdbc:mysql://localhost:3306/Semestral";
	    String usuario= "root";
	    String pass = "";
	    
	    // Establecer la conexi�n con la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection(ruta, usuario, pass);
	    Statement dbstatement = dbconect.createStatement();
	    
	 	// Preparar la sentencia SQL para insertar los datos en la tabla
	    String sql = "INSERT INTO usuario (cedula, nombre, apellido, edad, contrasena) VALUES ('"+cedula+"', '"+nombre+"', '"+ apellido +"', '"+edad+"', '"+contrase�a+"')";
	    
	    // Ejecutar la sentencia SQL
	   	dbstatement.executeUpdate(sql);
	    
	    // Cerrar la conexi�n
	    dbconect.close();
	%>
</body>
</html>