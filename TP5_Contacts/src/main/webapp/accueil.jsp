<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Contacts</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 40px;
        

        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
    }
    
    h1 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 40px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

   
    .menu {
        display: flex;
        justify-content: center; 
        gap: 15px; 
        flex-wrap: wrap; 
        margin-bottom: 40px;
    }

    .menu a {
        padding: 12px 25px;
        background-color: #3498db;
        color: white;
        text-decoration: none;
        border-radius: 30px; 
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        border: none;
    }

    .menu a:hover {
        background-color: #2980b9;
        transform: translateY(-3px); 
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }

   
    .menu a[href*="create"] { background-color: #2ecc71; } 
    .menu a[href*="delete"] { background-color: #e74c3c; } 
    .menu a[href*="update"] { background-color: #f39c12; } 
    .menu a[href*="search"] { background-color: #9b59b6; } 

    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        background-color: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    th {
        background-color: #2c3e50;
        color: white;
        padding: 18px;
        font-size: 15px;
    }

    td {
        padding: 15px;
        border-bottom: 1px solid #f1f1f1;
        text-align: center;
    }

    tr:last-child td { border-bottom: none; }
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
