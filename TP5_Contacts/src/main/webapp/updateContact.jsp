<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un contact</title>
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
        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0b7dda;
        }
        .cancel {
            background-color: #f44336;
            margin-left: 10px;
        }
        .cancel:hover {
            background-color: #da190b;
        }
        .nav {
            text-align: center;
            margin-top: 20px;
        }
        .nav a {
            color: #2196F3;
            text-decoration: none;
        }
        .info {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Modifier un contact</h1>
    
    <c:choose>
        <c:when test="${empty requestScope.contact}">
            <div class="info">
                ℹ️ Entrez l'ID du contact à modifier
            </div>
            
            <form action="ControllerServlet" method="POST">
                <input type="hidden" name="do_this" value="update">
                
                <table>
                    <tr>
                        <td align="center" colspan="2"><font size="4">Entrez l'ID du contact à modifier</font></td>
                    </tr>
                    <tr>
                        <td>ID du contact :</td>
                        <td><input type="number" name="contact_id" required placeholder="Exemple: 1"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input type="submit" value="Charger le contact">
                            <a href="ControllerServlet"><input type="button" value="Annuler" class="cancel"></a>
                        </td>
                    </tr>
                </table>
            </form>
        </c:when>
        <c:otherwise>
            <div class="info">
                ℹ️ Modifiez les informations du contact #${contact.id}
            </div>
            
            <form action="ControllerServlet" method="POST">
                <input type="hidden" name="do_this" value="update">
                <input type="hidden" name="id" value="${contact.id}">
                
                <table>
                    <tr>
                        <td align="center" colspan="2"><font size="4">Modifier les informations</font></td>
                    </tr>
                    <tr>
                        <td>Prénom :</td>
                        <td><input type="text" name="firstName" value="${contact.firstName}" required></td>
                    </tr>
                    <tr>
                        <td>Nom :</td>
                        <td><input type="text" name="lastName" value="${contact.lastName}" required></td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td><input type="email" name="email" value="${contact.email}" required></td>
                    </tr>
                    <tr>
                        <td>Téléphone :</td>
                        <td><input type="text" name="phone" value="${contact.phone}"></td>
                    </tr>
                    <tr>
                        <td>Adresse :</td>
                        <td><input type="text" name="address" value="${contact.address}"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input type="submit" value="Mettre à jour">
                            <a href="ControllerServlet"><input type="button" value="Annuler" class="cancel"></a>
                        </td>
                    </tr>
                </table>
            </form>
        </c:otherwise>
    </c:choose>
    
    <div class="nav">
        <a href="ControllerServlet">← Retour à l'accueil</a>
    </div>
</body>
</html>
