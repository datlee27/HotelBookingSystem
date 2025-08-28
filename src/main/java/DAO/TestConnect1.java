package DAO;



import DAO.DBcontext;
import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestConnect1 {
      Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
  
    public static void main(String[] args) {
        try {
            DBcontext db = new DBcontext();
            Connection conn = db.getConnection();
            System.out.println("✅ Kết nối DB thành công!");
            
       
        } catch (Exception e) {
            System.out.println("❌ Kết nối DB thất bại:");
            e.printStackTrace();
        }
    }
}
