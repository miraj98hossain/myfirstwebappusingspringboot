package com.mirajdev.springboot.myfirstwebappusingspringboot.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class TodoService {
    private static List<Todo> todos = new ArrayList<>();
    static{
        todos.add(
                new Todo(1, "mirajdev", "Learn AWS", LocalDate.now().plusYears(1), false)
        );
        todos.add(
                new Todo(2, "mirajdev1", "Learn AWS", LocalDate.now().plusYears(2), false)
        );
        todos.add(
                new Todo(3, "mirajdev2", "Learn AWS", LocalDate.now().plusYears(3), false)
        );
    }

    public List<Todo> findByUsername(String username) {
        return todos;
    }  
public List<Todo> getAllTodos() {
        return todos;
    } 
}
