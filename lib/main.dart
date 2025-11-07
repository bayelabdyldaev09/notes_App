import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/data/models/isar_todo.dart';
import 'package:notes_app/data/repository/isar_todo_repository.dart';
import 'package:notes_app/domain/repository/todo_repository.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  final isarTodoRepo = IsarTodoRepository(isar);

  runApp(MainApp(todoRepository: isarTodoRepo));
}

class MainApp extends StatelessWidget {

  final TodoRepository todoRepository;

  const MainApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
