package edu.prj06.StudentManagerJstl.model;


public class Class {
    private int id;
    private String class_name;
    private String teacher;

    public Class() {
    }

    public Class(int id, String class_name, String teacher) {
        this.id = id;
        this.class_name = class_name;
        this.teacher = teacher;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
}
