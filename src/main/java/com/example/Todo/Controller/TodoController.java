package com.example.Todo.Controller;

import com.example.Todo.Modal.Todo;
import com.example.Todo.Service.TodoService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
@SessionAttributes("username")
public class TodoController {

    private TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @RequestMapping(value = "list-todos", method = RequestMethod.GET)
    public String listAllTodos(ModelMap map) {
        List<Todo> todo = todoService.findByUsername("in28Minutes");
        map.addAttribute("todos", todo);
        return "listTodos";
    }

    @RequestMapping(value = "add-todo", method = RequestMethod.GET)
    public String showNewTodoPage(ModelMap map) {
        String userName = (String)map.get("username");
        Todo todo = new Todo(0, userName, "", LocalDate.now(), false);
        map.put("todo", todo);
        return "todo";
    }

    @RequestMapping(value="add-todo", method = RequestMethod.POST)
    public String addNewTodo(ModelMap map, @Valid Todo todo, BindingResult result) {
        if(result.hasErrors()) {
            return "todo";
        }
        todoService.addTodo((String) map.get("username"), todo.getDescription(), todo.getTargetDate(), todo.isDone());
        return "redirect:list-todos";
    }

    @RequestMapping(value = "delete-todo", method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id) {
        todoService.deleteById(id);
        return "redirect:list-todos";
    }

    @RequestMapping(value = "update-todo", method = RequestMethod.GET)
    public String showUpdateTodoPage(@RequestParam int id, ModelMap map) {
        Todo todo = todoService.findById(id);
        map.addAttribute("todo", todo);
        return "todo";
    }

    @RequestMapping(value = "update-todo", method = RequestMethod.POST)
    public String updateTodo(@Valid Todo todo, BindingResult result) {
        if (result.hasErrors()) {
            return "todo";
        }
        todoService.updateTodo(todo);
        return "redirect:list-todos";
    }
}
