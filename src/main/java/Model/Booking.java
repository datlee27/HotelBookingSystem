/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author mac
 */
public class Booking {
    private int id_booking;
    private int room_number; 
    private String booking_date;
    private String start_time; 
    private String end_time ; 
    private int cus_id; 

    public Booking(int room_number, String booking_date, String start_time, String end_time, int cus_id) {
        this.room_number = room_number;
        this.booking_date = booking_date;
        this.start_time = start_time;
        this.end_time = end_time;
        this.cus_id = cus_id;
    }

    public Booking(int id_booking, int room_number, String booking_date, String start_time, String end_time, int cus_id) {
        this.id_booking = id_booking;
        this.room_number = room_number;
        this.booking_date = booking_date;
        this.start_time = start_time;
        this.end_time = end_time;
        this.cus_id = cus_id;
    }

    public int getId_booking() {
        return id_booking;
    }

    public void setId_booking(int id_booking) {
        this.id_booking = id_booking;
    }
    
    

 



    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    @Override
    public String toString() {
        return "Booking{" + "room_number=" + room_number + ", booking_date=" + booking_date + ", start_time=" + start_time + ", end_time=" + end_time + ", cus_id=" + cus_id + '}';
    }

 
    
    
    
}
