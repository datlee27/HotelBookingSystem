/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author mac
 */
public class Account {
    private int cus_id ;
    private String userName ; 
    private String passWord; 
    private String email ;



    public Account(int cus_id, String userName, String passWord, String email) {
        this.cus_id = cus_id;
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
    }
    
    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" + "cus_id=" + cus_id + ", userName=" + userName + ", passWord=" + passWord + ", email=" + email + '}';
    }

    
    
    
    
    
}
