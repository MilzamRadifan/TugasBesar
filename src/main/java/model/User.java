package model;

import java.io.Serializable;
import java.util.Objects;

public class User implements Serializable {
    // Version number for serialization
    private static final long serialVersionUID = 1L;
    
    private int id;
    private String name;
    private String email;
    private String phone;
    private String role;  // Tambahan field untuk role/tingkat akses
    private boolean active; // Status aktif/tidak
    
    // Constructors
    public User() {
        this.active = true; // Default active
    }
    
    public User(int id, String name, String email, String phone) {
        this();
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }
    
    // Getters and Setters
    public int getId() { 
        return id; 
    }
    
    public void setId(int id) { 
        this.id = id; 
    }
    
    public String getName() { 
        return name; 
    }
    
    public void setName(String name) { 
        this.name = name != null ? name.trim() : null; 
    }
    
    public String getEmail() { 
        return email; 
    }
    
    public void setEmail(String email) { 
        this.email = email != null ? email.toLowerCase().trim() : null; 
    }
    
    public String getPhone() { 
        return phone; 
    }
    
    public void setPhone(String phone) { 
        this.phone = phone != null ? phone.trim() : null; 
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    
    // Override methods
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", role='" + role + '\'' +
                ", active=" + active +
                '}';
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id && 
               Objects.equals(email, user.email);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(id, email);
    }
    
    // Business methods
    public boolean isAdmin() {
        return "admin".equalsIgnoreCase(role);
    }
    
    public String getMaskedPhone() {
        if (phone == null || phone.length() < 4) {
            return phone;
        }
        return "***-***-" + phone.substring(phone.length() - 4);
    }
}