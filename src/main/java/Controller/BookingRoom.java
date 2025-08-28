/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;



/**
 *
 * @author mac
 */
public class BookingRoom extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession();
    String checkInSess  = (String) session.getAttribute("checkIn");
    String checkOutSess = (String) session.getAttribute("checkOut");

   
        
        
    String id = request.getParameter("aid");
    DAO dao = new DAO(); 
    Model.Room r = dao.getRoomByID(id);   
    
     // chưa chọn ngày ⇒ quay lại room, kèm thông báo
    if (checkInSess == null || checkInSess.isEmpty()
        || checkOutSess == null || checkOutSess.isEmpty()) {
        session.setAttribute("errorSearch", "Bạn phải chọn Check-in / Check-out trước!");
        response.sendRedirect("room");
        return;
    }
    request.setAttribute("detailR", r);
    request.getRequestDispatcher("View/BookingRoom.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession session = request.getSession();
    Account acc = (Account) session.getAttribute("acc");

    String checkIn = request.getParameter("checkIn");
    String checkOut = request.getParameter("checkOut");
    String room_number = request.getParameter("roomNumber");

    
    // Booking time
    LocalDateTime now = LocalDateTime.now();
    String bookingDate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

    DAO dao = new DAO();
    dao.bookingRoom(room_number, bookingDate, checkIn, checkOut, acc.getCus_id());

    session.setAttribute("fine", "Booking room successfully!");
if (checkIn == null || checkIn.isEmpty()
            || checkOut == null || checkOut.isEmpty()) {
        session.setAttribute("errorbooking", "Bạn phải chọn Check-in / Check-out trước!");
        response.sendRedirect("room");
        return;
    }
    
    // Redirect to main page
    response.sendRedirect("room");
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
