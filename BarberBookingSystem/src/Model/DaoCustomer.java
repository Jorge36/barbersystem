/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * DaoCustomer is used to get data for customers
 * @author Jorge
 */
public class DaoCustomer {
 
        // link to the database
    private String dbServer = "jdbc:mysql://XX.YY.ZZ.TTT/DBName?use_SSL=false";
    // user to query DB and perorm inserts, deletes and updaes
    private String user = "USER";
    // password
    private String password = "PASSWORD";
    
    // get customer by email
    public Customer get(String email) throws DBException {
        
       String query = "SELECT * FROM Customer WHERE email = '" + email + "';";
       String fName, lName, pNumber, pass;
       Customer customer = null;
        
        try {
                    
            // Get a connection to the database
            Connection conn = DriverManager.getConnection(dbServer, user, password);
            
            // Get a statement from the connection
            Statement stmt = conn.createStatement();

            // Execute the query
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the result set
            if (rs.next()) {
                
                fName = rs.getString("first_name");
                lName = rs.getString("last_name");
                pNumber = rs.getString("phone_number");
                pass = rs.getString("password");
                        
                customer = new Customer(email, pass, fName, lName, pNumber);
                
            }

            // Close the result set, statement and the connection
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            String msg = null;
            // Loop through the SQL Exceptions
            while (se != null) {
                msg = se.getSQLState() + " " + "Message: " + se.getMessage() + " " + "Error  : " + se.getErrorCode();
                se = se.getNextException();
                if (se != null)
                    msg =  msg + System.lineSeparator();
            }
            throw  new DBException(msg);
        } catch (Exception e) {
            throw  new DBException(e.getMessage());
        }
        
        return customer;     
        
    }
    
    // save a customer
    public void save(Customer customer) throws DBException {
        
        String sql = "INSERT INTO Customer (email, password, first_name, last_name, phone_number) "
                     + "VALUES ('" + customer.getEmail() + "','" + customer.getPassword() + "','" + customer.getfName()
                     + "','" + customer.getlName() + "','" + customer.getPhoneNumber() +"')";
                
        try {
                    
            // Get a connection to the database
            Connection conn = DriverManager.getConnection(dbServer, user, password);
            
            // Get a statement from the connection
            Statement stmt = conn.createStatement();

            stmt.executeUpdate(sql);

            // Close the result set, statement and the connection
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            String msg = null;
            // Loop through the SQL Exceptions
            while (se != null) {
                msg = se.getSQLState() + " " + "Message: " + se.getMessage() + " " + "Error  : " + se.getErrorCode();
                se = se.getNextException();
                if (se != null)
                    msg =  msg + System.lineSeparator();
            }
            throw  new DBException(msg);
        } catch (Exception e) {
            throw  new DBException(e.getMessage());
        } 
                     
    }
    
    
}
