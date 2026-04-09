<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rechercher un contact</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #ff9800;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #e68900;
        }
        .cancel {
            background-color: #4CAF50;
            margin-left: 10px;
        }
        .cancel:hover {
            background-color: #45a049;
        }
        .results {
            width: 90%;
            margin: 20px auto;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .results-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .results-table th, .results-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .results-table th {
            background-color: #ff9800;
            color: white;
        }
        .nav {
            text-align: center;
            margin-top: 20px;
        }
        .nav a {
            color: #2196F3;
            text-decoration: none;
        }
        .search-info {
            background-color: #2196F3;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Rechercher un contact</h1>
    
    <form action="ControllerServlet" method="POST">
        <input type="hidden" name="do_this" value="search">
        
        <table>
            <tr>
                <td align="center" colspan="2"><font size="4">Rechercher par prénom, nom ou email</font></td>
            </tr>
            <tr>
                <td>Mot-clé :</td>
                <td><input type="text" name="keyword" value="${requestScope.searchKeyword}" placeholder="Exemple: Jean" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Rechercher">
                    <a href="ControllerServlet"><input type="button" value="Annuler" class="cancel"></a>
                </td>
            </tr>
        </table>
    </form>
    
    <c:if test="${not empty requestScope.searchResults}">
        <div class="results">
            <div class="search-info">
                🔍 Résultats pour : "${requestScope.searchKeyword}" (${requestScope.searchResults.size()} contact(s) trouvé(s))
            </div>
            
            <table class="results-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Prénom</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Téléphone</th>
                        <th>Adresse</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.searchResults}" var="contact">
                        <tr>
                            <td>${contact.id}</td>
                            <td>${contact.firstName}</td>
                            <td>${contact.lastName}</td>
                            <td>${contact.email}</td>
                            <td>${contact.phone}</td>
                            <td>${contact.address}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
    
    <div class="nav">
        <a href="ControllerServlet">← Retour à l'accueil</a>
    </div>
</body>
</html>