package com.mirajdev.springboot.myfirstwebappusingspringboot.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import jakarta.validation.Valid;

@Service
public class TodoService {
    private static List<Todo> todos = new ArrayList<>();
    private static int todoCount = 0;
    static {
        todos.add(
                new Todo(++todoCount, "mirajdev", "Learn AWS", LocalDate.now().plusYears(1), false));
        todos.add(
                new Todo(++todoCount, "mirajdev", "Learn AWS", LocalDate.now().plusYears(2), false));
        todos.add(
                new Todo(++todoCount, "mirajdev", "Learn AWS", LocalDate.now().plusYears(3), false));
    }

    public Todo findByUsername(String username) {
        return null;
    }

    public Todo findById(int id) {
        Predicate<? super Todo> predicate = todo -> todo.getId() == id;
        return todos.stream().filter(predicate).findFirst().get();
    }

    public List<Todo> getAllTodos() {
        return todos;
    }

    public void addNewTodos(String username, String description, LocalDate targetDate, boolean isdone) {
        todos.add(
                new Todo(++todoCount, username, description, targetDate, isdone));
    }

    public void deleteTodoById(int id) {
        Predicate<? super Todo> predicate = todo -> todo.getId() == id;
        todos.removeIf(predicate);
    }

    public void updateTodos(@Valid Todo todo) {
        Predicate<? super Todo> predicate = todos -> todos.getId() == todo.getId();
        todos.stream().filter(predicate).findFirst().get().setDescription(todo.getDescription());

    }
}
