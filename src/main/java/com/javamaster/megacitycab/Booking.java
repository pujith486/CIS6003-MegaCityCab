package com.javamaster.megacitycab;

import java.util.Date;

public class Booking {
    
    private int bookingId;
    private String customerName;
    private String address;
    private String phoneNumber;
    private String destination;
    private Date bookingDate;
    private double totalAmount;

    public Booking() {
    }

    public Booking(int bookingId, String customerName, String address, String phoneNumber, 
                   String destination, Date bookingDate, double totalAmount) {
        this.bookingId = bookingId;
        this.customerName = customerName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.destination = destination;
        this.bookingDate = bookingDate;
        this.totalAmount = totalAmount;
    }


    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", customerName='" + customerName + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", destination='" + destination + '\'' +
                ", bookingDate=" + bookingDate +
                ", totalAmount=" + totalAmount +
                '}';
    }
}