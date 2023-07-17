<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" href="login.css">
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
	function mostrarPopup(mensaje) {
	    alert(mensaje);
	    window.location.href = "./login.html"; // Cambiar "./login.html" con la ruta correcta a la p�gina de inicio de sesi�n
	}
</script>
</head>
<body>
	<%
	    String cedula = request.getParameter("cedula");
	    String password = request.getParameter("password");
	%>
	
	<%
    // Configurar la conexi�n a la base de datos
    String ruta = "jdbc:mysql://localhost:3306/Semestral";
    String usuario = "root";
    String pass = "";

    // Establecer la conexi�n con la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    Connection dbconect = DriverManager.getConnection(ruta, usuario, pass);
    Statement dbstatement = dbconect.createStatement();

    // Preparar la consulta SQL para verificar las credenciales del usuario
    String sql = "SELECT * FROM usuario WHERE cedula='" + cedula + "' AND contrasena='" + password + "'";
    ResultSet result = dbstatement.executeQuery(sql);
    
 	// Verificar si se encontraron resultados en la consulta
    if (result.next()) {
        // Las credenciales son correctas, redireccionar al usuario a la p�gina HOME.html
        response.sendRedirect("./HOME.html"); // Cambiar "./HOME.html" con la ruta correcta a la p�gina HOME.html
    } else {
        // Las credenciales son incorrectas o el usuario no est� registrado
        // Mostrar un mensaje de error utilizando JavaScript
        String mensaje = "Credenciales incorrectas o usuario no registrado";
       	out.println("<script>mostrarPopup('"+mensaje+"');</script>");
    }

    // Cerrar la conexi�n a la base de datos
    result.close();
    dbstatement.close();
    dbconect.close();
	%>
	
	
</body>
</html>