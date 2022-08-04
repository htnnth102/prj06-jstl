package edu.prj06.StudentManagerJstl.dao;

import edu.prj06.StudentManagerJstl.model.Students;
import edu.prj06.StudentManagerJstl.utils.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentDao implements IStudentDAO{
    @Override
    public void getAllStudent() {
        String Select_sql = "select s.id, fullname, class_name, address, phone, gender from students s inner join class c on s.class_id = c.class_id";
        try {
            Connection con = DBConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(Select_sql);
            while (rs.next()) {

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Students getStudentById(int id) {
        return null;
    }

    @Override
    public void insertStudent(Students students) {

    }

    @Override
    public void editStudent(Students students) {

    }

    @Override
    public void deleteStudent(int id) {

    }
}
