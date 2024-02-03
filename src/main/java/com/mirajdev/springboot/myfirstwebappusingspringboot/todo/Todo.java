package com.mirajdev.springboot.myfirstwebappusingspringboot.todo;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Size;

@Entity
public class Todo {
    @Id
    @GeneratedValue
    private int id;
    private String username;
    @Size(min = 10, message = "Enter atleast 10 characters")

    private String description;
    private LocalDate targetDate;
    private boolean isdone;

    public Todo() {

    }

    public Todo(int id, String username, String description, LocalDate targetDate, boolean isdone) {
        this.id = id;
        this.username = username;
        this.description = description;
        this.targetDate = targetDate;
        this.isdone = isdone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(LocalDate targetDate) {
        this.targetDate = targetDate;
    }

    public boolean isIsdone() {
        return isdone;
    }

    public void setIsdone(boolean isdone) {
        this.isdone = isdone;
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", username='" + getUsername() + "'" +
                ", description='" + getDescription() + "'" +
                ", targetDate='" + getTargetDate() + "'" +
                ", isdone='" + isIsdone() + "'" +
                "}";
    }

}
