import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

// part 'db.g.dart';

enum Priority {
  must,
  should,
  maybe,
  notHaveTo,
}

class Writers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get ruby => text()();
}

class Novel extends Table {
  TextColumn get ncode => text()();
  IntColumn get ncodeInt => integer().nullable()();
  TextColumn get title => text()();
  TextColumn get writerNickname => text()();
  IntColumn get writer => integer()();
  TextColumn get story => text()();
  BoolColumn get isSerial => boolean()();
  IntColumn get maxEpisodeNum => integer()();

  @override
  Set<Column> get primaryKey => {ncode};
}

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 30)();
  TextColumn get body => text().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  IntColumn get priority => intEnum<Priority>()();
  IntColumn get category => integer().nullable()();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

class Schedules extends Table {
  DateTimeColumn get time => dateTime()();

  @override
  Set<Column> get primaryKey => {time};
}

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get todo => integer()();
  IntColumn get schedule => integer()();
  BoolColumn get dailyRepeat => boolean()();
  BoolColumn get weeklyRepeat => boolean()();
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }

@UseMoor(tables: [Todos, Categories, Schedules, Reminders])
class EnhanTodoDatabase {
// class EnhanTodoDatabase extends _$EnhanTodoDatabase {
  // EnhanTodoDatabase._internal() : super(_openConnection());
  //
  // factory EnhanTodoDatabase() => _enhanTodoDatabase;
  //
  // static final _enhanTodoDatabase = EnhanTodoDatabase._internal();
  //
  // @override
  // int get schemaVersion => 1;
  //
  // Future<List<Todo>> get todoList => select(todos).get();
  // Stream<List<Todo>> get todoListStream => (select(todos)
  //       ..orderBy([(todo) => OrderingTerm(expression: todo.priority)]))
  //     .watch();
  // Future<List<Category>> get categoryList => select(categories).get();
  // Future<List<Schedule>> get scheduleList => select(schedules).get();
  // Future<List<Reminder>> get reminderList => select(reminders).get();
  //
  // Future<int> createTodo(TodosCompanion todo) => into(todos).insert(todo);
  // Future updateTodo(Todo todo) => update(todos).replace(todo);
  // Future deleteTodo(int id) =>
  //     (delete(todos)..where((todo) => todo.id.equals(id))).go();
}
