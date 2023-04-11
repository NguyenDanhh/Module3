package com.example.bai1;

public class Customer {
    private String name;
    private String date;
    private String address;
    private String image;
    private int id;

    public Customer() {
    }

    public Customer(int id, String name, String date, String address, String image) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.address = address;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
