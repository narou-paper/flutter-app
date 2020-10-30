import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

// part 'db.g.dart';

class Writers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get ruby => text().withLength(min: 1, max: 100)();
}

class Novels extends Table {
  TextColumn get ncode => text().withLength(min: 1, max: 10)();
  IntColumn get ncodeInt => integer().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 500)();
  TextColumn get writerNickname => text().withLength(min: 1, max: 100)();
  IntColumn get writer => integer()();
  TextColumn get story => text().nullable()();
  BoolColumn get isSerial => boolean()();
  IntColumn get maxEpisodeNum => integer()();

  @override
  Set<Column> get primaryKey => {ncode};
}

class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get novel => integer()();
  TextColumn get name => text().withLength(min: 1, max: 500)();
}

class Episodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get novel => integer()();
  IntColumn get number => integer()();
  IntColumn get chapter => integer().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 500).nullable()();
  TextColumn get foreword => text().nullable()();
  TextColumn get body => text()();
  TextColumn get afterword => text().nullable()();
  DateTimeColumn get postedAt => dateTime().nullable()();
  DateTimeColumn get fixedAt => dateTime().nullable()();
  IntColumn get illustCount => integer().withDefault(const Constant(0))();
}

class Illusts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uniqueId => text().withLength(min: 1, max: 20)();
  IntColumn get episode => integer()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get filePath => text().withLength(min: 1, max: 200)();
}

class KeyWords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
}

enum RequiredKeyWord {
  rating15,
  boysLove,
  girlsLove,
  dangerous,
  worldReincarnation,
  worldTransfer,
}

class NovelDetails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get novel => integer()();
  IntColumn get bigGenre => intEnum<BigGenre>()();
  IntColumn get genre => intEnum<Genre>()();
  DateTimeColumn get firstPublicationDate => dateTime()();
  DateTimeColumn get lastPublicationDate => dateTime()();
  IntColumn get length => integer()();
  BoolColumn get isStop => boolean()();
  IntColumn get writerDevice => intEnum<WriterDevice>()();
  IntColumn get totalPoint => integer()();
  IntColumn get dailyPoint => integer()();
  IntColumn get weeklyRatingPoint => integer()();
  IntColumn get monthlyRatingPoint => integer()();
  IntColumn get quarterRatingPoint => integer()();
  IntColumn get yearlyRatingPoint => integer()();
  IntColumn get bookmarkNum => integer()();
  IntColumn get impressionNum => integer()();
  IntColumn get reviewNum => integer()();
  IntColumn get allPoint => integer()();
  IntColumn get illustNum => integer()();
  IntColumn get talkingRowRate => integer()();
  DateTimeColumn get updatedAt => dateTime()();
}

enum BigGenre {
  love,
  fantasy,
  literature,
  sciFiction,
  other,
  none,
}

enum Genre {
  anotherWorldLove,
  realWorldLove,
  highFantasy,
  lowFantasy,
  pureLiterature,
  drama,
  history,
  mystery,
  horror,
  action,
  comedy,
  virtualRealityGame,
  universe,
  sciFiction,
  panic,
  fairyTale,
  poem,
  essay,
  replay,
  other,
  none,
}

enum WriterDevice {
  phoneOnly,
  laptopOnly,
  laptopAndPhone,
}

class NovelDetailKeyWords extends Table {
  IntColumn get novelDetail => integer()();
  IntColumn get keyword => integer()();
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }

@UseMoor(tables: [
  Writers,
  Novels,
  Chapters,
  Episodes,
  Illusts,
  KeyWords,
  NovelDetails,
  NovelDetailKeyWords
])
class NarouPaperDatabase {
// class NarouPaperDatabase extends _$NarouPaperDatabase {
  // NarouPaperDatabase._internal() : super(_openConnection());
  //
  // factory NarouPaperDatabase() => _narouPaperDatabase;
  //
  // static final _narouPaperDatabase = NarouPaperDatabase._internal();
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
