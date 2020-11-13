import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'db.g.dart';

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
  BoolColumn get isR18 => boolean()();
  BoolColumn get isSerial => boolean()();
  IntColumn get readEpisodeCount => integer().withDefault(const Constant(0))();
  IntColumn get maxEpisodeNum => integer()();

  @override
  Set<Column> get primaryKey => {ncode};
}

class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get novel => text()();
  IntColumn get number => integer()();
  TextColumn get name => text().withLength(min: 1, max: 500)();
}

class Episodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get novel => text()();
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
  TextColumn get novel => text()();
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

  @override
  Set<Column> get primaryKey => {novel};
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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  Writers,
  Novels,
  Chapters,
  Episodes,
  Illusts,
  KeyWords,
  NovelDetails,
  NovelDetailKeyWords,
])
class NarouDatabase extends _$NarouDatabase {
  NarouDatabase._internal() : super(_openConnection());

  factory NarouDatabase() => _narouPaperDatabase;

  static final _narouPaperDatabase = NarouDatabase._internal();

  @override
  int get schemaVersion => 1;

  // Future<List<Novel>> get novelList => select(novels).get();
  // Stream<List<Novel>> get novelListStream => (select(novels)
  //       ..join([
  //         innerJoin(
  //           novelDetails,
  //           novelDetails.novel.equalsExp(novels.ncode),
  //           useColumns: false,
  //         )
  //       ])
  //       ..orderBy([(novel) => OrderingTerm.desc(novelDetails.updatedAt)]))
  //     .watch();
  Stream<List<Novel>> get novelListStream => select(novels).watch();
  Stream<List<Episode>> episodeListStream(String ncode) =>
      (select(episodes)..where((episode) => episode.novel.equals(ncode)))
          .watch();

  Future<int> addNovel(NovelsCompanion novel) => into(novels).insert(novel);
  Future<int> addChapter(ChaptersCompanion chapter) =>
      into(chapters).insert(chapter);
  Future<int> addEpisode(EpisodesCompanion episode) =>
      into(episodes).insert(episode);
  // Future updateTodo(Todo todo) => update(todos).replace(todo);
  // Future deleteTodo(int id) =>
  //     (delete(todos)..where((todo) => todo.id.equals(id))).go();
}
