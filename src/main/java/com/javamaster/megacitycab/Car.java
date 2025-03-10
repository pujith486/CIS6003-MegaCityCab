package com.javamaster.megacitycab;

public class Car {

    private int carId;
    private String model;
    private String registrationNo;
    private boolean availability;

    public Car() {
    }

    public Car(int carId, String model, String registrationNo, boolean availability) {
        this.carId = carId;
        this.model = model;
        this.registrationNo = registrationNo;
        this.availability = availability;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    @Override
    public String toString() {
        return "Car{" +
                "carId=" + carId +
                ", model='" + model + '\'' +
                ", registrationNo='" + registrationNo + '\'' +
                ", availability=" + availability +
                '}';
    }
}
