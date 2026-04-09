package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Contact;
import model.ContactFacade;

public class ControllerServlet extends HttpServlet {
    
    private ContactFacade contactFacade;
    
    public ControllerServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** initializing controller servlet.");
        super.init(config);
        contactFacade = new ContactFacade();
    }
    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        // recuperation de l'action à effectuer
        String do_this = request.getParameter("do_this");
        
        if (do_this == null) {
            // definir le contexte pour une redirection sur la page accueil.jsp
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/accueil.jsp");
            // charger la liste des contacts dans la requête pour les
            // transmettre à la JSP accueil.jsp (qui va les afficher)
            request.setAttribute("listContacts", contactFacade.findAll());
            rd.forward(request, response);
        }
        else if (do_this.equals("delete")) {
            // recuperation de l'id du contact
            String idStr = request.getParameter("contact_id");
            if (idStr == null || idStr.isEmpty()) {
                // redirection sur la page removeContact.jsp
                response.sendRedirect("removeContact.jsp");
            }
            else {
                // id non null, donc on supprime le contact identifié par id
                int id = Integer.parseInt(idStr);
                contactFacade.deleteContact(id);
                // on recharge la page d'accueil
                response.sendRedirect("ControllerServlet");
            }
        }
        else if (do_this.equals("create")) {
            // recuperation du nom contact
            String lastName = request.getParameter("lastName");
            if (lastName == null || lastName.isEmpty()) {
                // redirection sur la page addContact.jsp
                response.sendRedirect("addContact.jsp");
            }
            else {
                // le nom n'est pas nul, donc on ajoute le contact dans la base
                Contact contact = new Contact();
                contact.setFirstName(request.getParameter("firstName"));
                contact.setLastName(lastName);
                contact.setEmail(request.getParameter("email"));
                contact.setPhone(request.getParameter("phone"));
                contact.setAddress(request.getParameter("address"));
                
                contactFacade.createContact(contact);
                // on recharge la page d'accueil
                response.sendRedirect("ControllerServlet");
            }
        }
        else if (do_this.equals("update")) {
            String idStr = request.getParameter("id");
            
            if (idStr == null || idStr.isEmpty()) {
                // If no ID, show update form with contact data
                String contactId = request.getParameter("contact_id");
                if (contactId != null && !contactId.isEmpty()) {
                    int id = Integer.parseInt(contactId);
                    Contact contact = contactFacade.findById(id);
                    request.setAttribute("contact", contact);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateContact.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("updateContact.jsp");
                }
            }
            else {
                // Update the contact
                int id = Integer.parseInt(idStr);
                Contact contact = new Contact();
                contact.setId(id);
                contact.setFirstName(request.getParameter("firstName"));
                contact.setLastName(request.getParameter("lastName"));
                contact.setEmail(request.getParameter("email"));
                contact.setPhone(request.getParameter("phone"));
                contact.setAddress(request.getParameter("address"));
                
                contactFacade.updateContact(contact);
                // on recharge la page d'accueil
                response.sendRedirect("ControllerServlet");
            }
        }
        else if (do_this.equals("search")) {
            String keyword = request.getParameter("keyword");
            
            if (keyword == null || keyword.isEmpty()) {
                // Show search form
                response.sendRedirect("searchContact.jsp");
            }
            else {
                // Perform search
                List<Contact> results = contactFacade.searchContacts(keyword);
                request.setAttribute("searchResults", results);
                request.setAttribute("searchKeyword", keyword);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/searchContact.jsp");
                rd.forward(request, response);
            }
        }
    }
}