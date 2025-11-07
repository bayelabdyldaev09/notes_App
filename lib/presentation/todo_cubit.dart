import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/model/todo.dart';
import 'package:notes_app/domain/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>>{
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todoLIst = await todoRepository.getTodos();

    emit(todoLIst);
  }

  Future<void> addTodo(String text) async {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    await todoRepository.addTodo(newTodo);

    loadTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    await todoRepository.deleteTodo(todo);

    loadTodos();
  }

  Future<void> toggleCompletion(Todo todo) async {
    final updateTodo = todo.toggleCompletion();

    await todoRepository.updateTodo(updateTodo);

    loadTodos();
  }
}