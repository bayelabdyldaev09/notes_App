import 'package:isar/isar.dart';
import 'package:notes_app/data/models/isar_todo.dart';
import 'package:notes_app/domain/model/todo.dart';
import 'package:notes_app/domain/repository/todo_repository.dart';

class IsarTodoRepository implements TodoRepository{
  final Isar db;

  IsarTodoRepository(this.db);

  @override
  Future<void> addTodo(Todo newTodo) {
    final todoIsar = TodoIsar.fromDomain(newTodo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

}