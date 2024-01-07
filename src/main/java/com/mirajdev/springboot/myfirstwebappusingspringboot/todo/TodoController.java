package com.mirajdev.springboot.myfirstwebappusingspringboot.todo;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TodoController {
    
    
    // public TodoController(TodoService todoService) {
    //     super();
    //     this.todoService = todoService;
    // }
    @Autowired
    TodoService todoService;
    @RequestMapping("listtodos")
    public String listAllTodos(ModelMap model) {
         
        model.addAttribute("todos", todoService.getAllTodos());
        return "listTodos";
    }
}
