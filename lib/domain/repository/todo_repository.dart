import 'package:notes_app/domain/model/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<void> addTodo(Todo newTodo);

  Future<void> updateTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);
}