package edu.prj06.StudentManagerJstl.dao;

import edu.prj06.StudentManagerJstl.model.Students;

public interface IStudentDAO {
    public void getAllStudent();

    public Students getStudentById(int id);

    public void insertStudent(Students students);

    public void editStudent(Students students);

    public void deleteStudent(int id);


}
