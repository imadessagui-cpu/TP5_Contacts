<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un contact</title>
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
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
    </style>
</head>
<body>
    <h1>Ajouter un nouveau contact</h1>
    
    <form action="ControllerServlet" method="POST">
        <input type="hidden" name="do_this" value="create">
        
        <table>
            <tr>
                <td align="center" colspan="2"><font size="4">Veuillez saisir les informations du contact</font></td>
            </tr>
            <tr>
                <td>Prénom :</td>
                <td><input type="text" name="firstName" required></td>
            </tr>
            <tr>
                <td>Nom :</td>
                <td><input type="text" name="lastName" required></td>
            </tr>
            <tr>
                <td>Email :</td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td>Téléphone :</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>Adresse :</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="Validate" value="Enregistrer">
                    <a href="ControllerServlet"><input type="button" value="Annuler" class="cancel"></a>
                </td>
            </tr>
        </table>
    </form>
    
    <div class="nav">
        <a href="ControllerServlet">← Retour à l'accueil</a>
    </div>
</body>
</html>
