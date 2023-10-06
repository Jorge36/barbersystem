/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalTime;

/**
 * Slot class represents a slot in the system
 * @author Jorge
 */
public class Slot {
    
    private int id;
    private Barber barber;
    private LocalTime time;
    private boolean available; 

    public Barber getBarber() {
        return barber;
    }

    public void setBarber(Barber barber) {
        this.barber = barber;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Slot(Barber barber, LocalTime time, boolean available) {
        this.barber = barber;
        this.time = time;
        this.available = available;
    }

    public Slot(int id, Barber barber, LocalTime time, boolean available) {
        this.id = id;
        this.barber = barber;
        this.time = time;
        this.available = available;
    }

    @Override
    public String toString() {
        return "Slot{" + "id=" + id + ", email=" + barber + ", time=" + time + ", available=" + available + '}';
    }

    
    
    
    
    
    
}
