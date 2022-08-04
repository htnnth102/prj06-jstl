package edu.prj06.StudentManagerJstl.model;

public class Students {
    private int id;
    private String name;
    private int class_id;
    private String address;
    private String phone;
    private boolean gender;

    public Students() {
    }
    public Students(int id, String name, int class_id, String address, String phone, boolean gender) {
        this.id = id;
        this.name = name;
        this.class_id = class_id;
        this.address = address;
        this.phone = phone;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
