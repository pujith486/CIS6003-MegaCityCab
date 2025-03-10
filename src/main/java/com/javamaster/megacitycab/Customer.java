package com.javamaster.megacitycab;

public class Customer {

    private int customerId;
    private String name;
    private String address;
    private String NIC;
    private String telephone;
    private int userId; // Foreign key referencing User table

    public Customer() {
    }

    public Customer(int customerId, String name, String address, String NIC, String telephone, int userId) {
        this.customerId = customerId;
        this.name = name;
        this.address = address;
        this.NIC = NIC;
        this.telephone = telephone;
        this.userId = userId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerId=" + customerId +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", NIC='" + NIC + '\'' +
                ", telephone='" + telephone + '\'' +
                ", userId=" + userId +
                '}';
    }
}
