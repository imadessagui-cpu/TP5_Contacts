package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import model.Contact;
import model.ContactFacade;

/**
 * Servlet implementation class ControllerServlet
 
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactFacade contactFacade;
    
    public ControllerServlet() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("*** Initializing Controller Servlet...");
        super.init(config);
         
        contactFacade = new ContactFacade();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
      
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
        String do_this = request.getParameter("do_this");
        
       
        if (do_this == null) {
            request.setAttribute("listContacts", contactFacade.findAll());
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);
        }
        
        
        else if (do_this.equals("delete")) {
            String idStr = request.getParameter("contact_id");
            if (idStr == null || idStr.isEmpty()) {
                response.sendRedirect("removeContact.jsp");
            } else {
                contactFacade.deleteContact(Integer.parseInt(idStr));
                response.sendRedirect("ControllerServlet");
            }
        }
        
        
        else if (do_this.equals("create")) {
            String lastName = request.getParameter("lastName");
            if (lastName == null || lastName.isEmpty()) {
                response.sendRedirect("addContact.jsp");
            } else {
                Contact contact = new Contact();
                contact.setFirstName(request.getParameter("firstName"));
                contact.setLastName(lastName);
                contact.setEmail(request.getParameter("email"));
                contact.setPhone(request.getParameter("phone"));
                contact.setAddress(request.getParameter("address"));
                
                contactFacade.createContact(contact);
                response.sendRedirect("ControllerServlet");
            }
        }
        
        
        else if (do_this.equals("update")) {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                String contactId = request.getParameter("contact_id");
                if (contactId != null && !contactId.isEmpty()) {
                    Contact contact = contactFacade.findById(Integer.parseInt(contactId));
                    request.setAttribute("contact", contact);
                    request.getRequestDispatcher("/updateContact.jsp").forward(request, response);
                } else {
                    response.sendRedirect("updateContact.jsp");
                }
            } else {
                Contact contact = new Contact();
                contact.setId(Integer.parseInt(idStr));
                contact.setFirstName(request.getParameter("firstName"));
                contact.setLastName(request.getParameter("lastName"));
                contact.setEmail(request.getParameter("email"));
                contact.setPhone(request.getParameter("phone"));
                contact.setAddress(request.getParameter("address"));
                
                contactFacade.updateContact(contact);
                response.sendRedirect("ControllerServlet");
            }
        }
        
       
        else if (do_this.equals("search")) {
            String keyword = request.getParameter("keyword");
            if (keyword == null || keyword.isEmpty()) {
                response.sendRedirect("searchContact.jsp");
            } else {
                List<Contact> results = contactFacade.searchContacts(keyword);
                request.setAttribute("searchResults", results);
                request.setAttribute("searchKeyword", keyword);
                request.getRequestDispatcher("/searchContact.jsp").forward(request, response);
            }
        }
    }
}
