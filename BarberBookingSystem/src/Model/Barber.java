/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 * This class represents a Barber
 * @author Jorge
 */
public class Barber extends Customer {
    
    private String location;

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Barber(String email, String password, String fName, String lName, String phoneNumber, String location) {
        super(email, password, fName, lName, phoneNumber);
        this.location = location;
    }

    public Barber(String email) {
        super(email);
    }
 
    @Override
    public String toString() {
        return "Customer{" + "email=" + email + ", fName=" + fName + ", lName=" + lName + ", phoneNumber=" + phoneNumber + "location=" + location + '}';

    }
    
}
