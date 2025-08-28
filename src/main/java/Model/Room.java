/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author mac
 */
public class Room {
    private int id_room ;
    private int room_number ;
    private int capacity ;
    private int floor ;

    public Room(int id_room, int room_number, int capacity, int floor) {
        this.id_room = id_room;
        this.room_number = room_number;
        this.capacity = capacity;
        this.floor = floor;
    }

    public int getId_room() {
        return id_room;
    }

    public void setId_room(int id_room) {
        this.id_room = id_room;
    }

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

   

    @Override
    public String toString() {
        return "Room{" + "id_room=" + id_room + ", room_number=" + room_number + ", capacity=" + capacity + ", floor=" + floor + '}';
    }
    
    
}
