<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Contacts</title>
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
        .menu {
            text-align: center;
            margin: 20px 0;
        }
        .menu a {
            margin: 0 10px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .menu a:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .action-links a {
            margin: 0 5px;
            color: #2196F3;
            text-decoration: none;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Gestion des Contacts</h1>
    
    <div class="menu">
        <a href="addContact.jsp">+ Créer un nouveau contact</a>
        <a href="removeContact.jsp">- Supprimer un contact</a>
        <a href="updateContact.jsp">✏ Modifier un contact</a>
        <a href="searchContact.jsp">🔍 Rechercher un contact</a>
    </div>
    
    <h2>Liste des contacts</h2>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Prénom</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Téléphone</th>
                <th>Adresse</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.listContacts}" var="contact">
                <tr>
                    <td>${contact.id}</td>
                    <td>${contact.firstName}</td>
                    <td>${contact.lastName}</td>
                    <td>${contact.email}</td>
                    <td>${contact.phone}</td>
                    <td>${contact.address}</td>
                    <td class="action-links">
                        <a href="ControllerServlet?do_this=update&contact_id=${contact.id}">Modifier</a>
                        <a href="ControllerServlet?do_this=delete&contact_id=${contact.id}" 
                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce contact ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty requestScope.listContacts}">
                <tr>
                    <td colspan="7" style="text-align: center;">Aucun contact trouvé</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>