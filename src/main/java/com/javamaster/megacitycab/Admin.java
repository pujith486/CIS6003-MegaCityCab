package com.javamaster.megacitycab;

public class Admin {

    private int adminId;
    private String role;
    private String privileges;
    private int userId; // Foreign key referencing User table

    public Admin() {
    }

    public Admin(int adminId, String role, String privileges, int userId) {
        this.adminId = adminId;
        this.role = role;
        this.privileges = privileges;
        this.userId = userId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPrivileges() {
        return privileges;
    }

    public void setPrivileges(String privileges) {
        this.privileges = privileges;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", role='" + role + '\'' +
                ", privileges='" + privileges + '\'' +
                ", userId=" + userId +
                '}';
    }
}
