/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Booking;
import Model.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mac
 */
public class DAO {
     Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
    
    // mau lenh de lay du lieu tu DB 
//        public Account checkLogin(String user, String pass) {
//        try {
//            String query = "CAu lenh truy van rong DB";
//            conn = new DBcontext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user); // truyen tham so tu user vao dau ? thu nhat de truy van 
//            ps.setString(2, pass); // truyn tham so tu pass vao ? thu 2 de tuy van 
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                return new Account(
//                    rs.getInt("id"),
//                    rs.getString("username"),
//                    rs.getString("password"),
//                    rs.getInt("isSell"),
//                    rs.getInt("isAdmin")
//                ); // them cac doi tuong truy van duoc vao trong class model
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//                if (conn != null) conn.close();
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
//        }
//        return null;
//    }
    
       public Account checkLogin(String user, String pass) {
        try {
            String query = "SELECT * FROM Room_DE180983.Customers WHERE username = ? AND password = ?;";
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(
                    rs.getInt("cus_id"),
                    rs.getString("userName"),
                    rs.getString("passWord"),
                    rs.getString("email")
            
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            } 
        }
        return null;
    }

       public List<Room> getAllRoom(){
       List<Room> list = new ArrayList<>(); 
       String query = "SELECT * FROM Room_DE180983.Room;";
        try{
        conn = new DBcontext().getConnection(); 
        ps = conn.prepareStatement(query); 
        rs=ps.executeQuery(); 
            while(rs.next()){
            list.add(new Room(
                    rs.getInt("id_room"),
                    rs.getInt("room_number"),
                    rs.getInt("capacity"),
                    rs.getInt("floor")

            )); }
        }catch (Exception e){e.printStackTrace();}

       return list; 
       }
public List<Room> getAvailableRoom(String checkIn, String checkOut) {
    List<Room> list = new ArrayList<>(); 
    String query = "SELECT * FROM Room_DE180983.Room " +
                   "WHERE room_number NOT IN (" +
                   "  SELECT room_number FROM Room_DE180983.Booking " +
                   "  WHERE start_time < ? AND end_time > ?" +
                   ")";
    try {
        conn = new DBcontext().getConnection(); 
        ps = conn.prepareStatement(query); 
        ps.setString(1, checkOut); // end_time > checkIn
        ps.setString(2, checkIn);  // start_time < checkOut
        rs = ps.executeQuery(); 
        while (rs.next()) {
            list.add(new Room(
                rs.getInt("id_room"),
                rs.getInt("room_number"),
                rs.getInt("capacity"),
                rs.getInt("floor")
            ));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    return list; 
}
    
       public Room getRoomByID(String id) {
        String query = "SELECT * FROM Room_DE180983.Room where id_room =?;";
        try {
             conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Room(
                    rs.getInt("id_room"),
                    rs.getInt("room_number"),
                    rs.getInt("capacity"),
                    rs.getInt("floor")                        
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
       
       public void bookingRoom (String room_number,String booking_date,String start_time,String end_time,int cus_id){
       String query = "INSERT INTO Room_DE180983.Booking \n" +
                      "(room_number, booking_date, start_time, end_time, cus_id) \n" +
                      "VALUES (?,?,?,?,?);";
        try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,room_number );
            ps.setString(2,booking_date );
            ps.setString(3,start_time);
            ps.setString(4, end_time);
            ps.setInt(5, cus_id);
            ps.executeUpdate();  
        } catch (Exception e) {
            e.printStackTrace();
        }
       
   }   
       
       public List<Booking> getBookingByCusIdNow(int cusId){
           List<Booking> list = new ArrayList<>();
           String query = "SELECT *\n" +
                            "FROM Room_DE180983.Booking\n" +
                            "WHERE cus_id = ?\n" +
                            "  AND (\n" +
                            "        booking_date > CURRENT_DATE\n" +
                            "        OR (booking_date = CURRENT_DATE AND end_time > CURRENT_TIME)\n" +
                            "      );";
                try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, cusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Booking(
//int room_number, String booking_date, String start_time, String end_time, int cus_id        
                    rs.getInt("id_booking"),    
                    rs.getInt("room_number"),
                    rs.getString("booking_date"),
                    rs.getString("start_time"),
                    rs.getString("end_time"),
                    rs.getInt("cus_id")                            
                )) ;}
                } catch (Exception e) {}
                
        return list ; 
       }
       public void deleteBookingById(int id_booking) {
    String query = "DELETE FROM Room_DE180983.Booking WHERE id_booking = ?";
    try {
        conn = new DBcontext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, id_booking);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
       

       
}
