/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mac
 */
public class DBcontext {
        public Connection getConnection() throws Exception {
        // Chuỗi kết nối JDBC cho MySQL
        String url = "jdbc:mysql://localhost:3306/Room_DE180983" // dien ten DB to connect
                   + "?useSSL=false"
                   + "&serverTimezone=UTC"
                   + "&zeroDateTimeBehavior=CONVERT_TO_NULL";

        // Tài khoản đăng nhập MySQL
        String user = "root";
        String password = "Levandat2004^";

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Trả về đối tượng kết nối
        return DriverManager.getConnection(url, user, password);
    }
    
    
}
