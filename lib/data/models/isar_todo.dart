import 'package:isar/isar.dart';
import 'package:notes_app/domain/model/todo.dart';

part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isComplete;

  Todo toDomain() {
    return Todo(id: id, text: text, isComplete: isComplete);
  }

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
    ..id = todo.id
    ..text = todo.text
    ..isComplete = todo.isComplete;
  }
}
