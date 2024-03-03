package com.example.Todo.Service;

import com.example.Todo.Modal.Todo;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

@Service
public class TodoService {
    private static List<Todo> todos = new ArrayList<>();
    private static int todoCount;

    static {
        todos.add(new Todo(++todoCount, "ankit", "Learn Spring Boot", LocalDate.now().plusMonths(1), false));
        todos.add(new Todo(++todoCount, "ankit", "Learn DevOps", LocalDate.now().plusMonths(2), false));
    }

    public List<Todo> findByUsername(String username) {
        Predicate<? super Todo> predicate = todo -> todo.getUsername().equalsIgnoreCase(username);
        return todos.stream().filter(predicate).toList();
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
        previousTodo.setTargetDate(todo.getTargetDate());
        previousTodo.setDone(todo.isDone());
    }
}
