<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Test Database</title></head>
<body>
<h1>Test de connexion MySQL</h1>
<%
    String url = "jdbc:mysql://localhost:3306/tp5_contacts?useSSL=false&serverTimezone=UTC";
    String user = "root";  // Votre utilisateur MySQL
    String password = "";  // Votre mot de passe MySQL
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        out.println("<p style='color:green'>✅ Connexion réussie !</p>");
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM Contact");
        if (rs.next()) {
            out.println("<p>Nombre de contacts : " + rs.getInt("count") + "</p>");
        }
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red'>❌ Erreur : " + e.getMessage() + "</p>");
        e.printStackTrace(response.getWriter());
    }
%>
</body>
</html>