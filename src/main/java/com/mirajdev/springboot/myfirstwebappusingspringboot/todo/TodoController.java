package com.mirajdev.springboot.myfirstwebappusingspringboot.todo;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("username")
public class TodoController {

    // public TodoController(TodoService todoService) {
    // super();
    // this.todoService = todoService;
    // }
    @Autowired
    TodoService todoService;
    @Autowired
    TodoRepository todoRepository;

    @RequestMapping("listtodos")
    public String listAllTodos(ModelMap model) {
        String username = (String) model.get("username");
        model.addAttribute("todos", todoRepository.findByUsername(username));
        return "listTodos";
    }

    @RequestMapping(value = "addtodo", method = RequestMethod.GET)
    public String showNewTodo(ModelMap model) {
        String username = (String) model.get("username");
        Todo todo = new Todo(0, username, "", LocalDate.now().plusYears(1), false);
        model.put("todo", todo);
        return "addTodo";
    }

    @RequestMapping(value = "delete-todo", method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id) {
        todoRepository.deleteById(id);
        // todoService.deleteTodoById(id);
        return "redirect:/listtodos";
    }

    @RequestMapping(value = "edit-todo", method = RequestMethod.GET)
    public String showEditTodoPage(@RequestParam int id, ModelMap model) {
        Todo todo = todoRepository.findById(id).get();
        model.put("todo", todo);
        return "addTodo";
    }

    @RequestMapping(value = "edit-todo", method = RequestMethod.POST)
    public String editTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
        if (result.hasErrors()) {
            return "addTodo";
        }
        String username = (String) model.get("username");
        todo.setUsername(username);
        todoRepository.save(todo);
        // todoService.updateTodos(todo);
        return "redirect:/listtodos";
    }

    @RequestMapping(value = "addtodo", method = RequestMethod.POST)
    public String addNewTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
        if (result.hasErrors()) {
            return "addTodo";
        }
        String username = (String) model.get("username");
        todo.setUsername(username);
        todoRepository.save(todo);
        // todoService.addNewTodos(username, todo.getDescription(),
        // LocalDate.now().plusYears(1), false);
        return "redirect:/listtodos";
    }
}
