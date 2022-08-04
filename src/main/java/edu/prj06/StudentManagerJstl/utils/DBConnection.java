package edu.prj06.StudentManagerJstl.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "motconvit");
        } catch (SQLException e) {
            System.out.println("Connection failed");
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            System.out.println("Connection failed");
            throw new RuntimeException(e);
        }
        return con;
    }
}
