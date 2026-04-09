package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactFacade {
    
    // Database connection parameters - Update these with your MySQL credentials
    private static final String URL = "jdbc:mysql://localhost:3306/tp5_contacts?useSSL=false&serverTimezone=UTC";
    private static final String USERNAME = "root";  // Change to your MySQL username
    private static final String PASSWORD = "";      // Change to your MySQL password
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    // Get database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    
    // Find all contacts
    public List<Contact> findAll() {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contact ORDER BY ID_CONTACT";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("ID_CONTACT"));
                contact.setFirstName(rs.getString("FIRSTNAME"));
                contact.setLastName(rs.getString("LASTNAME"));
                contact.setEmail(rs.getString("EMAIL"));
                contact.setPhone(rs.getString("PHONE"));
                contact.setAddress(rs.getString("ADDRESS"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }
    
    // Create a new contact
    public boolean createContact(Contact contact) {
        String sql = "INSERT INTO contact (FIRSTNAME, LASTNAME, EMAIL, PHONE, ADDRESS) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, contact.getFirstName());
            pstmt.setString(2, contact.getLastName());
            pstmt.setString(3, contact.getEmail());
            pstmt.setString(4, contact.getPhone());
            pstmt.setString(5, contact.getAddress());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete a contact by ID
    public boolean deleteContact(int id) {
        String sql = "DELETE FROM contact WHERE ID_CONTACT = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Update a contact
    public boolean updateContact(Contact contact) {
        String sql = "UPDATE contact SET FIRSTNAME=?, LASTNAME=?, EMAIL=?, PHONE=?, ADDRESS=? WHERE ID_CONTACT=?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, contact.getFirstName());
            pstmt.setString(2, contact.getLastName());
            pstmt.setString(3, contact.getEmail());
            pstmt.setString(4, contact.getPhone());
            pstmt.setString(5, contact.getAddress());
            pstmt.setInt(6, contact.getId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Find a contact by ID
    public Contact findById(int id) {
        String sql = "SELECT * FROM contact WHERE ID_CONTACT = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("ID_CONTACT"));
                contact.setFirstName(rs.getString("FIRSTNAME"));
                contact.setLastName(rs.getString("LASTNAME"));
                contact.setEmail(rs.getString("EMAIL"));
                contact.setPhone(rs.getString("PHONE"));
                contact.setAddress(rs.getString("ADDRESS"));
                return contact;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Search contacts by keyword (searches in firstname, lastname, email)
    public List<Contact> searchContacts(String keyword) {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contact WHERE FIRSTNAME LIKE ? OR LASTNAME LIKE ? OR EMAIL LIKE ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("ID_CONTACT"));
                contact.setFirstName(rs.getString("FIRSTNAME"));
                contact.setLastName(rs.getString("LASTNAME"));
                contact.setEmail(rs.getString("EMAIL"));
                contact.setPhone(rs.getString("PHONE"));
                contact.setAddress(rs.getString("ADDRESS"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }
}