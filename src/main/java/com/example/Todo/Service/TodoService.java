package com.example.Todo.Service;

import com.example.Todo.Modal.Todo;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.function.Predicate;

@Service
public class TodoService {
    private static ArrayList<Todo> todos = new ArrayList<>();
    private static int todoCount;

    static {
        todos.add(new Todo(++todoCount, "in28Minutes", "Learn Spring Boot", LocalDate.now().plusMonths(1), false));
        todos.add(new Todo(++todoCount, "in28Minutes", "Learn DevOps", LocalDate.now().plusMonths(2), false));
    }

    public ArrayList<Todo> findByUsername(String username) {
        return todos;
    }

    public void addTodo(String username, String description, LocalDate targetDate, boolean isDone) {
        Todo todo = new Todo(++todoCount, username, description, targetDate, isDone);
        todos.add(todo);
    }

    public void deleteById(int id) {
        Predicate<? super Todo> predicate = todo -> todo.getId() == id;
        todos.removeIf(predicate);
    }

    public Todo findById(int id) {
        Predicate<? super Todo> predicate = todo -> todo.getId() == id;
        Todo todo = todos.stream().filter(predicate).findFirst().get();
        return todo;
    }

    public void updateTodo(Todo todo) {
        Todo previousTodo = findById(todo.getId());
        previousTodo.setDescription(todo.getDescription());
        // TODO: 02-03-2024 change format of target date to match with html date 
//        previousTodo.setTargetDate(todo.getTargetDate());
        previousTodo.setDone(todo.isDone());
    }
}
