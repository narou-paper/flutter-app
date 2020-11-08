// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Writer extends DataClass implements Insertable<Writer> {
  final int id;
  final String name;
  final String ruby;
  Writer({@required this.id, @required this.name, @required this.ruby});
  factory Writer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Writer(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      ruby: stringType.mapFromDatabaseResponse(data['${effectivePrefix}ruby']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || ruby != null) {
      map['ruby'] = Variable<String>(ruby);
    }
    return map;
  }

  WritersCompanion toCompanion(bool nullToAbsent) {
    return WritersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      ruby: ruby == null && nullToAbsent ? const Value.absent() : Value(ruby),
    );
  }

  factory Writer.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Writer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ruby: serializer.fromJson<String>(json['ruby']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ruby': serializer.toJson<String>(ruby),
    };
  }

  Writer copyWith({int id, String name, String ruby}) => Writer(
        id: id ?? this.id,
        name: name ?? this.name,
        ruby: ruby ?? this.ruby,
      );
  @override
  String toString() {
    return (StringBuffer('Writer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ruby: $ruby')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, ruby.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Writer &&
          other.id == this.id &&
          other.name == this.name &&
          other.ruby == this.ruby);
}

class WritersCompanion extends UpdateCompanion<Writer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ruby;
  const WritersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ruby = const Value.absent(),
  });
  WritersCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String ruby,
  })  : name = Value(name),
        ruby = Value(ruby);
  static Insertable<Writer> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> ruby,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ruby != null) 'ruby': ruby,
    });
  }

  WritersCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> ruby}) {
    return WritersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ruby: ruby ?? this.ruby,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ruby.present) {
      map['ruby'] = Variable<String>(ruby.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WritersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ruby: $ruby')
          ..write(')'))
        .toString();
  }
}

class $WritersTable extends Writers with TableInfo<$WritersTable, Writer> {
  final GeneratedDatabase _db;
  final String _alias;
  $WritersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _rubyMeta = const VerificationMeta('ruby');
  GeneratedTextColumn _ruby;
  @override
  GeneratedTextColumn get ruby => _ruby ??= _constructRuby();
  GeneratedTextColumn _constructRuby() {
    return GeneratedTextColumn('ruby', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, ruby];
  @override
  $WritersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'writers';
  @override
  final String actualTableName = 'writers';
  @override
  VerificationContext validateIntegrity(Insertable<Writer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ruby')) {
      context.handle(
          _rubyMeta, ruby.isAcceptableOrUnknown(data['ruby'], _rubyMeta));
    } else if (isInserting) {
      context.missing(_rubyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Writer map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Writer.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WritersTable createAlias(String alias) {
    return $WritersTable(_db, alias);
  }
}

class Novel extends DataClass implements Insertable<Novel> {
  final String ncode;
  final int ncodeInt;
  final String title;
  final String writerNickname;
  final int writer;
  final String story;
  final bool isSerial;
  final int readEpisodeCount;
  final int maxEpisodeNum;
  Novel(
      {@required this.ncode,
      this.ncodeInt,
      @required this.title,
      @required this.writerNickname,
      @required this.writer,
      this.story,
      @required this.isSerial,
      @required this.readEpisodeCount,
      @required this.maxEpisodeNum});
  factory Novel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Novel(
      ncode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ncode']),
      ncodeInt:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}ncode_int']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      writerNickname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}writer_nickname']),
      writer: intType.mapFromDatabaseResponse(data['${effectivePrefix}writer']),
      story:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}story']),
      isSerial:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_serial']),
      readEpisodeCount: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}read_episode_count']),
      maxEpisodeNum: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_episode_num']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || ncode != null) {
      map['ncode'] = Variable<String>(ncode);
    }
    if (!nullToAbsent || ncodeInt != null) {
      map['ncode_int'] = Variable<int>(ncodeInt);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || writerNickname != null) {
      map['writer_nickname'] = Variable<String>(writerNickname);
    }
    if (!nullToAbsent || writer != null) {
      map['writer'] = Variable<int>(writer);
    }
    if (!nullToAbsent || story != null) {
      map['story'] = Variable<String>(story);
    }
    if (!nullToAbsent || isSerial != null) {
      map['is_serial'] = Variable<bool>(isSerial);
    }
    if (!nullToAbsent || readEpisodeCount != null) {
      map['read_episode_count'] = Variable<int>(readEpisodeCount);
    }
    if (!nullToAbsent || maxEpisodeNum != null) {
      map['max_episode_num'] = Variable<int>(maxEpisodeNum);
    }
    return map;
  }

  NovelsCompanion toCompanion(bool nullToAbsent) {
    return NovelsCompanion(
      ncode:
          ncode == null && nullToAbsent ? const Value.absent() : Value(ncode),
      ncodeInt: ncodeInt == null && nullToAbsent
          ? const Value.absent()
          : Value(ncodeInt),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      writerNickname: writerNickname == null && nullToAbsent
          ? const Value.absent()
          : Value(writerNickname),
      writer:
          writer == null && nullToAbsent ? const Value.absent() : Value(writer),
      story:
          story == null && nullToAbsent ? const Value.absent() : Value(story),
      isSerial: isSerial == null && nullToAbsent
          ? const Value.absent()
          : Value(isSerial),
      readEpisodeCount: readEpisodeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(readEpisodeCount),
      maxEpisodeNum: maxEpisodeNum == null && nullToAbsent
          ? const Value.absent()
          : Value(maxEpisodeNum),
    );
  }

  factory Novel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Novel(
      ncode: serializer.fromJson<String>(json['ncode']),
      ncodeInt: serializer.fromJson<int>(json['ncodeInt']),
      title: serializer.fromJson<String>(json['title']),
      writerNickname: serializer.fromJson<String>(json['writerNickname']),
      writer: serializer.fromJson<int>(json['writer']),
      story: serializer.fromJson<String>(json['story']),
      isSerial: serializer.fromJson<bool>(json['isSerial']),
      readEpisodeCount: serializer.fromJson<int>(json['readEpisodeCount']),
      maxEpisodeNum: serializer.fromJson<int>(json['maxEpisodeNum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ncode': serializer.toJson<String>(ncode),
      'ncodeInt': serializer.toJson<int>(ncodeInt),
      'title': serializer.toJson<String>(title),
      'writerNickname': serializer.toJson<String>(writerNickname),
      'writer': serializer.toJson<int>(writer),
      'story': serializer.toJson<String>(story),
      'isSerial': serializer.toJson<bool>(isSerial),
      'readEpisodeCount': serializer.toJson<int>(readEpisodeCount),
      'maxEpisodeNum': serializer.toJson<int>(maxEpisodeNum),
    };
  }

  Novel copyWith(
          {String ncode,
          int ncodeInt,
          String title,
          String writerNickname,
          int writer,
          String story,
          bool isSerial,
          int readEpisodeCount,
          int maxEpisodeNum}) =>
      Novel(
        ncode: ncode ?? this.ncode,
        ncodeInt: ncodeInt ?? this.ncodeInt,
        title: title ?? this.title,
        writerNickname: writerNickname ?? this.writerNickname,
        writer: writer ?? this.writer,
        story: story ?? this.story,
        isSerial: isSerial ?? this.isSerial,
        readEpisodeCount: readEpisodeCount ?? this.readEpisodeCount,
        maxEpisodeNum: maxEpisodeNum ?? this.maxEpisodeNum,
      );
  @override
  String toString() {
    return (StringBuffer('Novel(')
          ..write('ncode: $ncode, ')
          ..write('ncodeInt: $ncodeInt, ')
          ..write('title: $title, ')
          ..write('writerNickname: $writerNickname, ')
          ..write('writer: $writer, ')
          ..write('story: $story, ')
          ..write('isSerial: $isSerial, ')
          ..write('readEpisodeCount: $readEpisodeCount, ')
          ..write('maxEpisodeNum: $maxEpisodeNum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      ncode.hashCode,
      $mrjc(
          ncodeInt.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  writerNickname.hashCode,
                  $mrjc(
                      writer.hashCode,
                      $mrjc(
                          story.hashCode,
                          $mrjc(
                              isSerial.hashCode,
                              $mrjc(readEpisodeCount.hashCode,
                                  maxEpisodeNum.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Novel &&
          other.ncode == this.ncode &&
          other.ncodeInt == this.ncodeInt &&
          other.title == this.title &&
          other.writerNickname == this.writerNickname &&
          other.writer == this.writer &&
          other.story == this.story &&
          other.isSerial == this.isSerial &&
          other.readEpisodeCount == this.readEpisodeCount &&
          other.maxEpisodeNum == this.maxEpisodeNum);
}

class NovelsCompanion extends UpdateCompanion<Novel> {
  final Value<String> ncode;
  final Value<int> ncodeInt;
  final Value<String> title;
  final Value<String> writerNickname;
  final Value<int> writer;
  final Value<String> story;
  final Value<bool> isSerial;
  final Value<int> readEpisodeCount;
  final Value<int> maxEpisodeNum;
  const NovelsCompanion({
    this.ncode = const Value.absent(),
    this.ncodeInt = const Value.absent(),
    this.title = const Value.absent(),
    this.writerNickname = const Value.absent(),
    this.writer = const Value.absent(),
    this.story = const Value.absent(),
    this.isSerial = const Value.absent(),
    this.readEpisodeCount = const Value.absent(),
    this.maxEpisodeNum = const Value.absent(),
  });
  NovelsCompanion.insert({
    @required String ncode,
    this.ncodeInt = const Value.absent(),
    @required String title,
    @required String writerNickname,
    @required int writer,
    this.story = const Value.absent(),
    @required bool isSerial,
    this.readEpisodeCount = const Value.absent(),
    @required int maxEpisodeNum,
  })  : ncode = Value(ncode),
        title = Value(title),
        writerNickname = Value(writerNickname),
        writer = Value(writer),
        isSerial = Value(isSerial),
        maxEpisodeNum = Value(maxEpisodeNum);
  static Insertable<Novel> custom({
    Expression<String> ncode,
    Expression<int> ncodeInt,
    Expression<String> title,
    Expression<String> writerNickname,
    Expression<int> writer,
    Expression<String> story,
    Expression<bool> isSerial,
    Expression<int> readEpisodeCount,
    Expression<int> maxEpisodeNum,
  }) {
    return RawValuesInsertable({
      if (ncode != null) 'ncode': ncode,
      if (ncodeInt != null) 'ncode_int': ncodeInt,
      if (title != null) 'title': title,
      if (writerNickname != null) 'writer_nickname': writerNickname,
      if (writer != null) 'writer': writer,
      if (story != null) 'story': story,
      if (isSerial != null) 'is_serial': isSerial,
      if (readEpisodeCount != null) 'read_episode_count': readEpisodeCount,
      if (maxEpisodeNum != null) 'max_episode_num': maxEpisodeNum,
    });
  }

  NovelsCompanion copyWith(
      {Value<String> ncode,
      Value<int> ncodeInt,
      Value<String> title,
      Value<String> writerNickname,
      Value<int> writer,
      Value<String> story,
      Value<bool> isSerial,
      Value<int> readEpisodeCount,
      Value<int> maxEpisodeNum}) {
    return NovelsCompanion(
      ncode: ncode ?? this.ncode,
      ncodeInt: ncodeInt ?? this.ncodeInt,
      title: title ?? this.title,
      writerNickname: writerNickname ?? this.writerNickname,
      writer: writer ?? this.writer,
      story: story ?? this.story,
      isSerial: isSerial ?? this.isSerial,
      readEpisodeCount: readEpisodeCount ?? this.readEpisodeCount,
      maxEpisodeNum: maxEpisodeNum ?? this.maxEpisodeNum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ncode.present) {
      map['ncode'] = Variable<String>(ncode.value);
    }
    if (ncodeInt.present) {
      map['ncode_int'] = Variable<int>(ncodeInt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (writerNickname.present) {
      map['writer_nickname'] = Variable<String>(writerNickname.value);
    }
    if (writer.present) {
      map['writer'] = Variable<int>(writer.value);
    }
    if (story.present) {
      map['story'] = Variable<String>(story.value);
    }
    if (isSerial.present) {
      map['is_serial'] = Variable<bool>(isSerial.value);
    }
    if (readEpisodeCount.present) {
      map['read_episode_count'] = Variable<int>(readEpisodeCount.value);
    }
    if (maxEpisodeNum.present) {
      map['max_episode_num'] = Variable<int>(maxEpisodeNum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NovelsCompanion(')
          ..write('ncode: $ncode, ')
          ..write('ncodeInt: $ncodeInt, ')
          ..write('title: $title, ')
          ..write('writerNickname: $writerNickname, ')
          ..write('writer: $writer, ')
          ..write('story: $story, ')
          ..write('isSerial: $isSerial, ')
          ..write('readEpisodeCount: $readEpisodeCount, ')
          ..write('maxEpisodeNum: $maxEpisodeNum')
          ..write(')'))
        .toString();
  }
}

class $NovelsTable extends Novels with TableInfo<$NovelsTable, Novel> {
  final GeneratedDatabase _db;
  final String _alias;
  $NovelsTable(this._db, [this._alias]);
  final VerificationMeta _ncodeMeta = const VerificationMeta('ncode');
  GeneratedTextColumn _ncode;
  @override
  GeneratedTextColumn get ncode => _ncode ??= _constructNcode();
  GeneratedTextColumn _constructNcode() {
    return GeneratedTextColumn('ncode', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _ncodeIntMeta = const VerificationMeta('ncodeInt');
  GeneratedIntColumn _ncodeInt;
  @override
  GeneratedIntColumn get ncodeInt => _ncodeInt ??= _constructNcodeInt();
  GeneratedIntColumn _constructNcodeInt() {
    return GeneratedIntColumn(
      'ncode_int',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 500);
  }

  final VerificationMeta _writerNicknameMeta =
      const VerificationMeta('writerNickname');
  GeneratedTextColumn _writerNickname;
  @override
  GeneratedTextColumn get writerNickname =>
      _writerNickname ??= _constructWriterNickname();
  GeneratedTextColumn _constructWriterNickname() {
    return GeneratedTextColumn('writer_nickname', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _writerMeta = const VerificationMeta('writer');
  GeneratedIntColumn _writer;
  @override
  GeneratedIntColumn get writer => _writer ??= _constructWriter();
  GeneratedIntColumn _constructWriter() {
    return GeneratedIntColumn(
      'writer',
      $tableName,
      false,
    );
  }

  final VerificationMeta _storyMeta = const VerificationMeta('story');
  GeneratedTextColumn _story;
  @override
  GeneratedTextColumn get story => _story ??= _constructStory();
  GeneratedTextColumn _constructStory() {
    return GeneratedTextColumn(
      'story',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isSerialMeta = const VerificationMeta('isSerial');
  GeneratedBoolColumn _isSerial;
  @override
  GeneratedBoolColumn get isSerial => _isSerial ??= _constructIsSerial();
  GeneratedBoolColumn _constructIsSerial() {
    return GeneratedBoolColumn(
      'is_serial',
      $tableName,
      false,
    );
  }

  final VerificationMeta _readEpisodeCountMeta =
      const VerificationMeta('readEpisodeCount');
  GeneratedIntColumn _readEpisodeCount;
  @override
  GeneratedIntColumn get readEpisodeCount =>
      _readEpisodeCount ??= _constructReadEpisodeCount();
  GeneratedIntColumn _constructReadEpisodeCount() {
    return GeneratedIntColumn('read_episode_count', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _maxEpisodeNumMeta =
      const VerificationMeta('maxEpisodeNum');
  GeneratedIntColumn _maxEpisodeNum;
  @override
  GeneratedIntColumn get maxEpisodeNum =>
      _maxEpisodeNum ??= _constructMaxEpisodeNum();
  GeneratedIntColumn _constructMaxEpisodeNum() {
    return GeneratedIntColumn(
      'max_episode_num',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        ncode,
        ncodeInt,
        title,
        writerNickname,
        writer,
        story,
        isSerial,
        readEpisodeCount,
        maxEpisodeNum
      ];
  @override
  $NovelsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'novels';
  @override
  final String actualTableName = 'novels';
  @override
  VerificationContext validateIntegrity(Insertable<Novel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ncode')) {
      context.handle(
          _ncodeMeta, ncode.isAcceptableOrUnknown(data['ncode'], _ncodeMeta));
    } else if (isInserting) {
      context.missing(_ncodeMeta);
    }
    if (data.containsKey('ncode_int')) {
      context.handle(_ncodeIntMeta,
          ncodeInt.isAcceptableOrUnknown(data['ncode_int'], _ncodeIntMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('writer_nickname')) {
      context.handle(
          _writerNicknameMeta,
          writerNickname.isAcceptableOrUnknown(
              data['writer_nickname'], _writerNicknameMeta));
    } else if (isInserting) {
      context.missing(_writerNicknameMeta);
    }
    if (data.containsKey('writer')) {
      context.handle(_writerMeta,
          writer.isAcceptableOrUnknown(data['writer'], _writerMeta));
    } else if (isInserting) {
      context.missing(_writerMeta);
    }
    if (data.containsKey('story')) {
      context.handle(
          _storyMeta, story.isAcceptableOrUnknown(data['story'], _storyMeta));
    }
    if (data.containsKey('is_serial')) {
      context.handle(_isSerialMeta,
          isSerial.isAcceptableOrUnknown(data['is_serial'], _isSerialMeta));
    } else if (isInserting) {
      context.missing(_isSerialMeta);
    }
    if (data.containsKey('read_episode_count')) {
      context.handle(
          _readEpisodeCountMeta,
          readEpisodeCount.isAcceptableOrUnknown(
              data['read_episode_count'], _readEpisodeCountMeta));
    }
    if (data.containsKey('max_episode_num')) {
      context.handle(
          _maxEpisodeNumMeta,
          maxEpisodeNum.isAcceptableOrUnknown(
              data['max_episode_num'], _maxEpisodeNumMeta));
    } else if (isInserting) {
      context.missing(_maxEpisodeNumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ncode};
  @override
  Novel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Novel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NovelsTable createAlias(String alias) {
    return $NovelsTable(_db, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int novel;
  final String name;
  Chapter({@required this.id, @required this.novel, @required this.name});
  factory Chapter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Chapter(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      novel: intType.mapFromDatabaseResponse(data['${effectivePrefix}novel']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || novel != null) {
      map['novel'] = Variable<int>(novel);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      novel:
          novel == null && nullToAbsent ? const Value.absent() : Value(novel),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['id']),
      novel: serializer.fromJson<int>(json['novel']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'novel': serializer.toJson<int>(novel),
      'name': serializer.toJson<String>(name),
    };
  }

  Chapter copyWith({int id, int novel, String name}) => Chapter(
        id: id ?? this.id,
        novel: novel ?? this.novel,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('novel: $novel, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(novel.hashCode, name.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.novel == this.novel &&
          other.name == this.name);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> novel;
  final Value<String> name;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.novel = const Value.absent(),
    this.name = const Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const Value.absent(),
    @required int novel,
    @required String name,
  })  : novel = Value(novel),
        name = Value(name);
  static Insertable<Chapter> custom({
    Expression<int> id,
    Expression<int> novel,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (novel != null) 'novel': novel,
      if (name != null) 'name': name,
    });
  }

  ChaptersCompanion copyWith(
      {Value<int> id, Value<int> novel, Value<String> name}) {
    return ChaptersCompanion(
      id: id ?? this.id,
      novel: novel ?? this.novel,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (novel.present) {
      map['novel'] = Variable<int>(novel.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('novel: $novel, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChaptersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _novelMeta = const VerificationMeta('novel');
  GeneratedIntColumn _novel;
  @override
  GeneratedIntColumn get novel => _novel ??= _constructNovel();
  GeneratedIntColumn _constructNovel() {
    return GeneratedIntColumn(
      'novel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 500);
  }

  @override
  List<GeneratedColumn> get $columns => [id, novel, name];
  @override
  $ChaptersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chapters';
  @override
  final String actualTableName = 'chapters';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('novel')) {
      context.handle(
          _novelMeta, novel.isAcceptableOrUnknown(data['novel'], _novelMeta));
    } else if (isInserting) {
      context.missing(_novelMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Chapter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(_db, alias);
  }
}

class Episode extends DataClass implements Insertable<Episode> {
  final int id;
  final int novel;
  final int number;
  final int chapter;
  final String title;
  final String foreword;
  final String body;
  final String afterword;
  final DateTime postedAt;
  final DateTime fixedAt;
  final int illustCount;
  Episode(
      {@required this.id,
      @required this.novel,
      @required this.number,
      this.chapter,
      this.title,
      this.foreword,
      @required this.body,
      this.afterword,
      this.postedAt,
      this.fixedAt,
      @required this.illustCount});
  factory Episode.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Episode(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      novel: intType.mapFromDatabaseResponse(data['${effectivePrefix}novel']),
      number: intType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      chapter:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}chapter']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      foreword: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}foreword']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
      afterword: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}afterword']),
      postedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}posted_at']),
      fixedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fixed_at']),
      illustCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}illust_count']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || novel != null) {
      map['novel'] = Variable<int>(novel);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    if (!nullToAbsent || chapter != null) {
      map['chapter'] = Variable<int>(chapter);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || foreword != null) {
      map['foreword'] = Variable<String>(foreword);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || afterword != null) {
      map['afterword'] = Variable<String>(afterword);
    }
    if (!nullToAbsent || postedAt != null) {
      map['posted_at'] = Variable<DateTime>(postedAt);
    }
    if (!nullToAbsent || fixedAt != null) {
      map['fixed_at'] = Variable<DateTime>(fixedAt);
    }
    if (!nullToAbsent || illustCount != null) {
      map['illust_count'] = Variable<int>(illustCount);
    }
    return map;
  }

  EpisodesCompanion toCompanion(bool nullToAbsent) {
    return EpisodesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      novel:
          novel == null && nullToAbsent ? const Value.absent() : Value(novel),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      chapter: chapter == null && nullToAbsent
          ? const Value.absent()
          : Value(chapter),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      foreword: foreword == null && nullToAbsent
          ? const Value.absent()
          : Value(foreword),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      afterword: afterword == null && nullToAbsent
          ? const Value.absent()
          : Value(afterword),
      postedAt: postedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(postedAt),
      fixedAt: fixedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedAt),
      illustCount: illustCount == null && nullToAbsent
          ? const Value.absent()
          : Value(illustCount),
    );
  }

  factory Episode.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Episode(
      id: serializer.fromJson<int>(json['id']),
      novel: serializer.fromJson<int>(json['novel']),
      number: serializer.fromJson<int>(json['number']),
      chapter: serializer.fromJson<int>(json['chapter']),
      title: serializer.fromJson<String>(json['title']),
      foreword: serializer.fromJson<String>(json['foreword']),
      body: serializer.fromJson<String>(json['body']),
      afterword: serializer.fromJson<String>(json['afterword']),
      postedAt: serializer.fromJson<DateTime>(json['postedAt']),
      fixedAt: serializer.fromJson<DateTime>(json['fixedAt']),
      illustCount: serializer.fromJson<int>(json['illustCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'novel': serializer.toJson<int>(novel),
      'number': serializer.toJson<int>(number),
      'chapter': serializer.toJson<int>(chapter),
      'title': serializer.toJson<String>(title),
      'foreword': serializer.toJson<String>(foreword),
      'body': serializer.toJson<String>(body),
      'afterword': serializer.toJson<String>(afterword),
      'postedAt': serializer.toJson<DateTime>(postedAt),
      'fixedAt': serializer.toJson<DateTime>(fixedAt),
      'illustCount': serializer.toJson<int>(illustCount),
    };
  }

  Episode copyWith(
          {int id,
          int novel,
          int number,
          int chapter,
          String title,
          String foreword,
          String body,
          String afterword,
          DateTime postedAt,
          DateTime fixedAt,
          int illustCount}) =>
      Episode(
        id: id ?? this.id,
        novel: novel ?? this.novel,
        number: number ?? this.number,
        chapter: chapter ?? this.chapter,
        title: title ?? this.title,
        foreword: foreword ?? this.foreword,
        body: body ?? this.body,
        afterword: afterword ?? this.afterword,
        postedAt: postedAt ?? this.postedAt,
        fixedAt: fixedAt ?? this.fixedAt,
        illustCount: illustCount ?? this.illustCount,
      );
  @override
  String toString() {
    return (StringBuffer('Episode(')
          ..write('id: $id, ')
          ..write('novel: $novel, ')
          ..write('number: $number, ')
          ..write('chapter: $chapter, ')
          ..write('title: $title, ')
          ..write('foreword: $foreword, ')
          ..write('body: $body, ')
          ..write('afterword: $afterword, ')
          ..write('postedAt: $postedAt, ')
          ..write('fixedAt: $fixedAt, ')
          ..write('illustCount: $illustCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          novel.hashCode,
          $mrjc(
              number.hashCode,
              $mrjc(
                  chapter.hashCode,
                  $mrjc(
                      title.hashCode,
                      $mrjc(
                          foreword.hashCode,
                          $mrjc(
                              body.hashCode,
                              $mrjc(
                                  afterword.hashCode,
                                  $mrjc(
                                      postedAt.hashCode,
                                      $mrjc(fixedAt.hashCode,
                                          illustCount.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Episode &&
          other.id == this.id &&
          other.novel == this.novel &&
          other.number == this.number &&
          other.chapter == this.chapter &&
          other.title == this.title &&
          other.foreword == this.foreword &&
          other.body == this.body &&
          other.afterword == this.afterword &&
          other.postedAt == this.postedAt &&
          other.fixedAt == this.fixedAt &&
          other.illustCount == this.illustCount);
}

class EpisodesCompanion extends UpdateCompanion<Episode> {
  final Value<int> id;
  final Value<int> novel;
  final Value<int> number;
  final Value<int> chapter;
  final Value<String> title;
  final Value<String> foreword;
  final Value<String> body;
  final Value<String> afterword;
  final Value<DateTime> postedAt;
  final Value<DateTime> fixedAt;
  final Value<int> illustCount;
  const EpisodesCompanion({
    this.id = const Value.absent(),
    this.novel = const Value.absent(),
    this.number = const Value.absent(),
    this.chapter = const Value.absent(),
    this.title = const Value.absent(),
    this.foreword = const Value.absent(),
    this.body = const Value.absent(),
    this.afterword = const Value.absent(),
    this.postedAt = const Value.absent(),
    this.fixedAt = const Value.absent(),
    this.illustCount = const Value.absent(),
  });
  EpisodesCompanion.insert({
    this.id = const Value.absent(),
    @required int novel,
    @required int number,
    this.chapter = const Value.absent(),
    this.title = const Value.absent(),
    this.foreword = const Value.absent(),
    @required String body,
    this.afterword = const Value.absent(),
    this.postedAt = const Value.absent(),
    this.fixedAt = const Value.absent(),
    this.illustCount = const Value.absent(),
  })  : novel = Value(novel),
        number = Value(number),
        body = Value(body);
  static Insertable<Episode> custom({
    Expression<int> id,
    Expression<int> novel,
    Expression<int> number,
    Expression<int> chapter,
    Expression<String> title,
    Expression<String> foreword,
    Expression<String> body,
    Expression<String> afterword,
    Expression<DateTime> postedAt,
    Expression<DateTime> fixedAt,
    Expression<int> illustCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (novel != null) 'novel': novel,
      if (number != null) 'number': number,
      if (chapter != null) 'chapter': chapter,
      if (title != null) 'title': title,
      if (foreword != null) 'foreword': foreword,
      if (body != null) 'body': body,
      if (afterword != null) 'afterword': afterword,
      if (postedAt != null) 'posted_at': postedAt,
      if (fixedAt != null) 'fixed_at': fixedAt,
      if (illustCount != null) 'illust_count': illustCount,
    });
  }

  EpisodesCompanion copyWith(
      {Value<int> id,
      Value<int> novel,
      Value<int> number,
      Value<int> chapter,
      Value<String> title,
      Value<String> foreword,
      Value<String> body,
      Value<String> afterword,
      Value<DateTime> postedAt,
      Value<DateTime> fixedAt,
      Value<int> illustCount}) {
    return EpisodesCompanion(
      id: id ?? this.id,
      novel: novel ?? this.novel,
      number: number ?? this.number,
      chapter: chapter ?? this.chapter,
      title: title ?? this.title,
      foreword: foreword ?? this.foreword,
      body: body ?? this.body,
      afterword: afterword ?? this.afterword,
      postedAt: postedAt ?? this.postedAt,
      fixedAt: fixedAt ?? this.fixedAt,
      illustCount: illustCount ?? this.illustCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (novel.present) {
      map['novel'] = Variable<int>(novel.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (chapter.present) {
      map['chapter'] = Variable<int>(chapter.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (foreword.present) {
      map['foreword'] = Variable<String>(foreword.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (afterword.present) {
      map['afterword'] = Variable<String>(afterword.value);
    }
    if (postedAt.present) {
      map['posted_at'] = Variable<DateTime>(postedAt.value);
    }
    if (fixedAt.present) {
      map['fixed_at'] = Variable<DateTime>(fixedAt.value);
    }
    if (illustCount.present) {
      map['illust_count'] = Variable<int>(illustCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodesCompanion(')
          ..write('id: $id, ')
          ..write('novel: $novel, ')
          ..write('number: $number, ')
          ..write('chapter: $chapter, ')
          ..write('title: $title, ')
          ..write('foreword: $foreword, ')
          ..write('body: $body, ')
          ..write('afterword: $afterword, ')
          ..write('postedAt: $postedAt, ')
          ..write('fixedAt: $fixedAt, ')
          ..write('illustCount: $illustCount')
          ..write(')'))
        .toString();
  }
}

class $EpisodesTable extends Episodes with TableInfo<$EpisodesTable, Episode> {
  final GeneratedDatabase _db;
  final String _alias;
  $EpisodesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _novelMeta = const VerificationMeta('novel');
  GeneratedIntColumn _novel;
  @override
  GeneratedIntColumn get novel => _novel ??= _constructNovel();
  GeneratedIntColumn _constructNovel() {
    return GeneratedIntColumn(
      'novel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedIntColumn _number;
  @override
  GeneratedIntColumn get number => _number ??= _constructNumber();
  GeneratedIntColumn _constructNumber() {
    return GeneratedIntColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chapterMeta = const VerificationMeta('chapter');
  GeneratedIntColumn _chapter;
  @override
  GeneratedIntColumn get chapter => _chapter ??= _constructChapter();
  GeneratedIntColumn _constructChapter() {
    return GeneratedIntColumn(
      'chapter',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, true,
        minTextLength: 1, maxTextLength: 500);
  }

  final VerificationMeta _forewordMeta = const VerificationMeta('foreword');
  GeneratedTextColumn _foreword;
  @override
  GeneratedTextColumn get foreword => _foreword ??= _constructForeword();
  GeneratedTextColumn _constructForeword() {
    return GeneratedTextColumn(
      'foreword',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _afterwordMeta = const VerificationMeta('afterword');
  GeneratedTextColumn _afterword;
  @override
  GeneratedTextColumn get afterword => _afterword ??= _constructAfterword();
  GeneratedTextColumn _constructAfterword() {
    return GeneratedTextColumn(
      'afterword',
      $tableName,
      true,
    );
  }

  final VerificationMeta _postedAtMeta = const VerificationMeta('postedAt');
  GeneratedDateTimeColumn _postedAt;
  @override
  GeneratedDateTimeColumn get postedAt => _postedAt ??= _constructPostedAt();
  GeneratedDateTimeColumn _constructPostedAt() {
    return GeneratedDateTimeColumn(
      'posted_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fixedAtMeta = const VerificationMeta('fixedAt');
  GeneratedDateTimeColumn _fixedAt;
  @override
  GeneratedDateTimeColumn get fixedAt => _fixedAt ??= _constructFixedAt();
  GeneratedDateTimeColumn _constructFixedAt() {
    return GeneratedDateTimeColumn(
      'fixed_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _illustCountMeta =
      const VerificationMeta('illustCount');
  GeneratedIntColumn _illustCount;
  @override
  GeneratedIntColumn get illustCount =>
      _illustCount ??= _constructIllustCount();
  GeneratedIntColumn _constructIllustCount() {
    return GeneratedIntColumn('illust_count', $tableName, false,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        novel,
        number,
        chapter,
        title,
        foreword,
        body,
        afterword,
        postedAt,
        fixedAt,
        illustCount
      ];
  @override
  $EpisodesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'episodes';
  @override
  final String actualTableName = 'episodes';
  @override
  VerificationContext validateIntegrity(Insertable<Episode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('novel')) {
      context.handle(
          _novelMeta, novel.isAcceptableOrUnknown(data['novel'], _novelMeta));
    } else if (isInserting) {
      context.missing(_novelMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('chapter')) {
      context.handle(_chapterMeta,
          chapter.isAcceptableOrUnknown(data['chapter'], _chapterMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    }
    if (data.containsKey('foreword')) {
      context.handle(_forewordMeta,
          foreword.isAcceptableOrUnknown(data['foreword'], _forewordMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body'], _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('afterword')) {
      context.handle(_afterwordMeta,
          afterword.isAcceptableOrUnknown(data['afterword'], _afterwordMeta));
    }
    if (data.containsKey('posted_at')) {
      context.handle(_postedAtMeta,
          postedAt.isAcceptableOrUnknown(data['posted_at'], _postedAtMeta));
    }
    if (data.containsKey('fixed_at')) {
      context.handle(_fixedAtMeta,
          fixedAt.isAcceptableOrUnknown(data['fixed_at'], _fixedAtMeta));
    }
    if (data.containsKey('illust_count')) {
      context.handle(
          _illustCountMeta,
          illustCount.isAcceptableOrUnknown(
              data['illust_count'], _illustCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Episode map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Episode.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EpisodesTable createAlias(String alias) {
    return $EpisodesTable(_db, alias);
  }
}

class Illust extends DataClass implements Insertable<Illust> {
  final int id;
  final String uniqueId;
  final int episode;
  final String title;
  final String filePath;
  Illust(
      {@required this.id,
      @required this.uniqueId,
      @required this.episode,
      @required this.title,
      @required this.filePath});
  factory Illust.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Illust(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      uniqueId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}unique_id']),
      episode:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}episode']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      filePath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}file_path']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || uniqueId != null) {
      map['unique_id'] = Variable<String>(uniqueId);
    }
    if (!nullToAbsent || episode != null) {
      map['episode'] = Variable<int>(episode);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    return map;
  }

  IllustsCompanion toCompanion(bool nullToAbsent) {
    return IllustsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      uniqueId: uniqueId == null && nullToAbsent
          ? const Value.absent()
          : Value(uniqueId),
      episode: episode == null && nullToAbsent
          ? const Value.absent()
          : Value(episode),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
    );
  }

  factory Illust.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Illust(
      id: serializer.fromJson<int>(json['id']),
      uniqueId: serializer.fromJson<String>(json['uniqueId']),
      episode: serializer.fromJson<int>(json['episode']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uniqueId': serializer.toJson<String>(uniqueId),
      'episode': serializer.toJson<int>(episode),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String>(filePath),
    };
  }

  Illust copyWith(
          {int id,
          String uniqueId,
          int episode,
          String title,
          String filePath}) =>
      Illust(
        id: id ?? this.id,
        uniqueId: uniqueId ?? this.uniqueId,
        episode: episode ?? this.episode,
        title: title ?? this.title,
        filePath: filePath ?? this.filePath,
      );
  @override
  String toString() {
    return (StringBuffer('Illust(')
          ..write('id: $id, ')
          ..write('uniqueId: $uniqueId, ')
          ..write('episode: $episode, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(uniqueId.hashCode,
          $mrjc(episode.hashCode, $mrjc(title.hashCode, filePath.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Illust &&
          other.id == this.id &&
          other.uniqueId == this.uniqueId &&
          other.episode == this.episode &&
          other.title == this.title &&
          other.filePath == this.filePath);
}

class IllustsCompanion extends UpdateCompanion<Illust> {
  final Value<int> id;
  final Value<String> uniqueId;
  final Value<int> episode;
  final Value<String> title;
  final Value<String> filePath;
  const IllustsCompanion({
    this.id = const Value.absent(),
    this.uniqueId = const Value.absent(),
    this.episode = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
  });
  IllustsCompanion.insert({
    this.id = const Value.absent(),
    @required String uniqueId,
    @required int episode,
    @required String title,
    @required String filePath,
  })  : uniqueId = Value(uniqueId),
        episode = Value(episode),
        title = Value(title),
        filePath = Value(filePath);
  static Insertable<Illust> custom({
    Expression<int> id,
    Expression<String> uniqueId,
    Expression<int> episode,
    Expression<String> title,
    Expression<String> filePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uniqueId != null) 'unique_id': uniqueId,
      if (episode != null) 'episode': episode,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
    });
  }

  IllustsCompanion copyWith(
      {Value<int> id,
      Value<String> uniqueId,
      Value<int> episode,
      Value<String> title,
      Value<String> filePath}) {
    return IllustsCompanion(
      id: id ?? this.id,
      uniqueId: uniqueId ?? this.uniqueId,
      episode: episode ?? this.episode,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uniqueId.present) {
      map['unique_id'] = Variable<String>(uniqueId.value);
    }
    if (episode.present) {
      map['episode'] = Variable<int>(episode.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IllustsCompanion(')
          ..write('id: $id, ')
          ..write('uniqueId: $uniqueId, ')
          ..write('episode: $episode, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }
}

class $IllustsTable extends Illusts with TableInfo<$IllustsTable, Illust> {
  final GeneratedDatabase _db;
  final String _alias;
  $IllustsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uniqueIdMeta = const VerificationMeta('uniqueId');
  GeneratedTextColumn _uniqueId;
  @override
  GeneratedTextColumn get uniqueId => _uniqueId ??= _constructUniqueId();
  GeneratedTextColumn _constructUniqueId() {
    return GeneratedTextColumn('unique_id', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _episodeMeta = const VerificationMeta('episode');
  GeneratedIntColumn _episode;
  @override
  GeneratedIntColumn get episode => _episode ??= _constructEpisode();
  GeneratedIntColumn _constructEpisode() {
    return GeneratedIntColumn(
      'episode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _filePathMeta = const VerificationMeta('filePath');
  GeneratedTextColumn _filePath;
  @override
  GeneratedTextColumn get filePath => _filePath ??= _constructFilePath();
  GeneratedTextColumn _constructFilePath() {
    return GeneratedTextColumn('file_path', $tableName, false,
        minTextLength: 1, maxTextLength: 200);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, uniqueId, episode, title, filePath];
  @override
  $IllustsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'illusts';
  @override
  final String actualTableName = 'illusts';
  @override
  VerificationContext validateIntegrity(Insertable<Illust> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('unique_id')) {
      context.handle(_uniqueIdMeta,
          uniqueId.isAcceptableOrUnknown(data['unique_id'], _uniqueIdMeta));
    } else if (isInserting) {
      context.missing(_uniqueIdMeta);
    }
    if (data.containsKey('episode')) {
      context.handle(_episodeMeta,
          episode.isAcceptableOrUnknown(data['episode'], _episodeMeta));
    } else if (isInserting) {
      context.missing(_episodeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path'], _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Illust map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Illust.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $IllustsTable createAlias(String alias) {
    return $IllustsTable(_db, alias);
  }
}

class KeyWord extends DataClass implements Insertable<KeyWord> {
  final int id;
  final String name;
  KeyWord({@required this.id, @required this.name});
  factory KeyWord.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return KeyWord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  KeyWordsCompanion toCompanion(bool nullToAbsent) {
    return KeyWordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory KeyWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return KeyWord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  KeyWord copyWith({int id, String name}) => KeyWord(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('KeyWord(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is KeyWord && other.id == this.id && other.name == this.name);
}

class KeyWordsCompanion extends UpdateCompanion<KeyWord> {
  final Value<int> id;
  final Value<String> name;
  const KeyWordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  KeyWordsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<KeyWord> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  KeyWordsCompanion copyWith({Value<int> id, Value<String> name}) {
    return KeyWordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyWordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $KeyWordsTable extends KeyWords with TableInfo<$KeyWordsTable, KeyWord> {
  final GeneratedDatabase _db;
  final String _alias;
  $KeyWordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $KeyWordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'key_words';
  @override
  final String actualTableName = 'key_words';
  @override
  VerificationContext validateIntegrity(Insertable<KeyWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KeyWord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return KeyWord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $KeyWordsTable createAlias(String alias) {
    return $KeyWordsTable(_db, alias);
  }
}

class NovelDetail extends DataClass implements Insertable<NovelDetail> {
  final String novel;
  final BigGenre bigGenre;
  final Genre genre;
  final DateTime firstPublicationDate;
  final DateTime lastPublicationDate;
  final int length;
  final bool isStop;
  final WriterDevice writerDevice;
  final int totalPoint;
  final int dailyPoint;
  final int weeklyRatingPoint;
  final int monthlyRatingPoint;
  final int quarterRatingPoint;
  final int yearlyRatingPoint;
  final int bookmarkNum;
  final int impressionNum;
  final int reviewNum;
  final int allPoint;
  final int illustNum;
  final int talkingRowRate;
  final DateTime updatedAt;
  NovelDetail(
      {@required this.novel,
      @required this.bigGenre,
      @required this.genre,
      @required this.firstPublicationDate,
      @required this.lastPublicationDate,
      @required this.length,
      @required this.isStop,
      @required this.writerDevice,
      @required this.totalPoint,
      @required this.dailyPoint,
      @required this.weeklyRatingPoint,
      @required this.monthlyRatingPoint,
      @required this.quarterRatingPoint,
      @required this.yearlyRatingPoint,
      @required this.bookmarkNum,
      @required this.impressionNum,
      @required this.reviewNum,
      @required this.allPoint,
      @required this.illustNum,
      @required this.talkingRowRate,
      @required this.updatedAt});
  factory NovelDetail.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return NovelDetail(
      novel:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}novel']),
      bigGenre: $NovelDetailsTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}big_genre'])),
      genre: $NovelDetailsTable.$converter1.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}genre'])),
      firstPublicationDate: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}first_publication_date']),
      lastPublicationDate: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}last_publication_date']),
      length: intType.mapFromDatabaseResponse(data['${effectivePrefix}length']),
      isStop:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_stop']),
      writerDevice: $NovelDetailsTable.$converter2.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}writer_device'])),
      totalPoint: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_point']),
      dailyPoint: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}daily_point']),
      weeklyRatingPoint: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}weekly_rating_point']),
      monthlyRatingPoint: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}monthly_rating_point']),
      quarterRatingPoint: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quarter_rating_point']),
      yearlyRatingPoint: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}yearly_rating_point']),
      bookmarkNum: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bookmark_num']),
      impressionNum: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}impression_num']),
      reviewNum:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}review_num']),
      allPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}all_point']),
      illustNum:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}illust_num']),
      talkingRowRate: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}talking_row_rate']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || novel != null) {
      map['novel'] = Variable<String>(novel);
    }
    if (!nullToAbsent || bigGenre != null) {
      final converter = $NovelDetailsTable.$converter0;
      map['big_genre'] = Variable<int>(converter.mapToSql(bigGenre));
    }
    if (!nullToAbsent || genre != null) {
      final converter = $NovelDetailsTable.$converter1;
      map['genre'] = Variable<int>(converter.mapToSql(genre));
    }
    if (!nullToAbsent || firstPublicationDate != null) {
      map['first_publication_date'] = Variable<DateTime>(firstPublicationDate);
    }
    if (!nullToAbsent || lastPublicationDate != null) {
      map['last_publication_date'] = Variable<DateTime>(lastPublicationDate);
    }
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<int>(length);
    }
    if (!nullToAbsent || isStop != null) {
      map['is_stop'] = Variable<bool>(isStop);
    }
    if (!nullToAbsent || writerDevice != null) {
      final converter = $NovelDetailsTable.$converter2;
      map['writer_device'] = Variable<int>(converter.mapToSql(writerDevice));
    }
    if (!nullToAbsent || totalPoint != null) {
      map['total_point'] = Variable<int>(totalPoint);
    }
    if (!nullToAbsent || dailyPoint != null) {
      map['daily_point'] = Variable<int>(dailyPoint);
    }
    if (!nullToAbsent || weeklyRatingPoint != null) {
      map['weekly_rating_point'] = Variable<int>(weeklyRatingPoint);
    }
    if (!nullToAbsent || monthlyRatingPoint != null) {
      map['monthly_rating_point'] = Variable<int>(monthlyRatingPoint);
    }
    if (!nullToAbsent || quarterRatingPoint != null) {
      map['quarter_rating_point'] = Variable<int>(quarterRatingPoint);
    }
    if (!nullToAbsent || yearlyRatingPoint != null) {
      map['yearly_rating_point'] = Variable<int>(yearlyRatingPoint);
    }
    if (!nullToAbsent || bookmarkNum != null) {
      map['bookmark_num'] = Variable<int>(bookmarkNum);
    }
    if (!nullToAbsent || impressionNum != null) {
      map['impression_num'] = Variable<int>(impressionNum);
    }
    if (!nullToAbsent || reviewNum != null) {
      map['review_num'] = Variable<int>(reviewNum);
    }
    if (!nullToAbsent || allPoint != null) {
      map['all_point'] = Variable<int>(allPoint);
    }
    if (!nullToAbsent || illustNum != null) {
      map['illust_num'] = Variable<int>(illustNum);
    }
    if (!nullToAbsent || talkingRowRate != null) {
      map['talking_row_rate'] = Variable<int>(talkingRowRate);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  NovelDetailsCompanion toCompanion(bool nullToAbsent) {
    return NovelDetailsCompanion(
      novel:
          novel == null && nullToAbsent ? const Value.absent() : Value(novel),
      bigGenre: bigGenre == null && nullToAbsent
          ? const Value.absent()
          : Value(bigGenre),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      firstPublicationDate: firstPublicationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(firstPublicationDate),
      lastPublicationDate: lastPublicationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPublicationDate),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
      isStop:
          isStop == null && nullToAbsent ? const Value.absent() : Value(isStop),
      writerDevice: writerDevice == null && nullToAbsent
          ? const Value.absent()
          : Value(writerDevice),
      totalPoint: totalPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPoint),
      dailyPoint: dailyPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyPoint),
      weeklyRatingPoint: weeklyRatingPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(weeklyRatingPoint),
      monthlyRatingPoint: monthlyRatingPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(monthlyRatingPoint),
      quarterRatingPoint: quarterRatingPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(quarterRatingPoint),
      yearlyRatingPoint: yearlyRatingPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(yearlyRatingPoint),
      bookmarkNum: bookmarkNum == null && nullToAbsent
          ? const Value.absent()
          : Value(bookmarkNum),
      impressionNum: impressionNum == null && nullToAbsent
          ? const Value.absent()
          : Value(impressionNum),
      reviewNum: reviewNum == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewNum),
      allPoint: allPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(allPoint),
      illustNum: illustNum == null && nullToAbsent
          ? const Value.absent()
          : Value(illustNum),
      talkingRowRate: talkingRowRate == null && nullToAbsent
          ? const Value.absent()
          : Value(talkingRowRate),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory NovelDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NovelDetail(
      novel: serializer.fromJson<String>(json['novel']),
      bigGenre: serializer.fromJson<BigGenre>(json['bigGenre']),
      genre: serializer.fromJson<Genre>(json['genre']),
      firstPublicationDate:
          serializer.fromJson<DateTime>(json['firstPublicationDate']),
      lastPublicationDate:
          serializer.fromJson<DateTime>(json['lastPublicationDate']),
      length: serializer.fromJson<int>(json['length']),
      isStop: serializer.fromJson<bool>(json['isStop']),
      writerDevice: serializer.fromJson<WriterDevice>(json['writerDevice']),
      totalPoint: serializer.fromJson<int>(json['totalPoint']),
      dailyPoint: serializer.fromJson<int>(json['dailyPoint']),
      weeklyRatingPoint: serializer.fromJson<int>(json['weeklyRatingPoint']),
      monthlyRatingPoint: serializer.fromJson<int>(json['monthlyRatingPoint']),
      quarterRatingPoint: serializer.fromJson<int>(json['quarterRatingPoint']),
      yearlyRatingPoint: serializer.fromJson<int>(json['yearlyRatingPoint']),
      bookmarkNum: serializer.fromJson<int>(json['bookmarkNum']),
      impressionNum: serializer.fromJson<int>(json['impressionNum']),
      reviewNum: serializer.fromJson<int>(json['reviewNum']),
      allPoint: serializer.fromJson<int>(json['allPoint']),
      illustNum: serializer.fromJson<int>(json['illustNum']),
      talkingRowRate: serializer.fromJson<int>(json['talkingRowRate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'novel': serializer.toJson<String>(novel),
      'bigGenre': serializer.toJson<BigGenre>(bigGenre),
      'genre': serializer.toJson<Genre>(genre),
      'firstPublicationDate': serializer.toJson<DateTime>(firstPublicationDate),
      'lastPublicationDate': serializer.toJson<DateTime>(lastPublicationDate),
      'length': serializer.toJson<int>(length),
      'isStop': serializer.toJson<bool>(isStop),
      'writerDevice': serializer.toJson<WriterDevice>(writerDevice),
      'totalPoint': serializer.toJson<int>(totalPoint),
      'dailyPoint': serializer.toJson<int>(dailyPoint),
      'weeklyRatingPoint': serializer.toJson<int>(weeklyRatingPoint),
      'monthlyRatingPoint': serializer.toJson<int>(monthlyRatingPoint),
      'quarterRatingPoint': serializer.toJson<int>(quarterRatingPoint),
      'yearlyRatingPoint': serializer.toJson<int>(yearlyRatingPoint),
      'bookmarkNum': serializer.toJson<int>(bookmarkNum),
      'impressionNum': serializer.toJson<int>(impressionNum),
      'reviewNum': serializer.toJson<int>(reviewNum),
      'allPoint': serializer.toJson<int>(allPoint),
      'illustNum': serializer.toJson<int>(illustNum),
      'talkingRowRate': serializer.toJson<int>(talkingRowRate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NovelDetail copyWith(
          {String novel,
          BigGenre bigGenre,
          Genre genre,
          DateTime firstPublicationDate,
          DateTime lastPublicationDate,
          int length,
          bool isStop,
          WriterDevice writerDevice,
          int totalPoint,
          int dailyPoint,
          int weeklyRatingPoint,
          int monthlyRatingPoint,
          int quarterRatingPoint,
          int yearlyRatingPoint,
          int bookmarkNum,
          int impressionNum,
          int reviewNum,
          int allPoint,
          int illustNum,
          int talkingRowRate,
          DateTime updatedAt}) =>
      NovelDetail(
        novel: novel ?? this.novel,
        bigGenre: bigGenre ?? this.bigGenre,
        genre: genre ?? this.genre,
        firstPublicationDate: firstPublicationDate ?? this.firstPublicationDate,
        lastPublicationDate: lastPublicationDate ?? this.lastPublicationDate,
        length: length ?? this.length,
        isStop: isStop ?? this.isStop,
        writerDevice: writerDevice ?? this.writerDevice,
        totalPoint: totalPoint ?? this.totalPoint,
        dailyPoint: dailyPoint ?? this.dailyPoint,
        weeklyRatingPoint: weeklyRatingPoint ?? this.weeklyRatingPoint,
        monthlyRatingPoint: monthlyRatingPoint ?? this.monthlyRatingPoint,
        quarterRatingPoint: quarterRatingPoint ?? this.quarterRatingPoint,
        yearlyRatingPoint: yearlyRatingPoint ?? this.yearlyRatingPoint,
        bookmarkNum: bookmarkNum ?? this.bookmarkNum,
        impressionNum: impressionNum ?? this.impressionNum,
        reviewNum: reviewNum ?? this.reviewNum,
        allPoint: allPoint ?? this.allPoint,
        illustNum: illustNum ?? this.illustNum,
        talkingRowRate: talkingRowRate ?? this.talkingRowRate,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NovelDetail(')
          ..write('novel: $novel, ')
          ..write('bigGenre: $bigGenre, ')
          ..write('genre: $genre, ')
          ..write('firstPublicationDate: $firstPublicationDate, ')
          ..write('lastPublicationDate: $lastPublicationDate, ')
          ..write('length: $length, ')
          ..write('isStop: $isStop, ')
          ..write('writerDevice: $writerDevice, ')
          ..write('totalPoint: $totalPoint, ')
          ..write('dailyPoint: $dailyPoint, ')
          ..write('weeklyRatingPoint: $weeklyRatingPoint, ')
          ..write('monthlyRatingPoint: $monthlyRatingPoint, ')
          ..write('quarterRatingPoint: $quarterRatingPoint, ')
          ..write('yearlyRatingPoint: $yearlyRatingPoint, ')
          ..write('bookmarkNum: $bookmarkNum, ')
          ..write('impressionNum: $impressionNum, ')
          ..write('reviewNum: $reviewNum, ')
          ..write('allPoint: $allPoint, ')
          ..write('illustNum: $illustNum, ')
          ..write('talkingRowRate: $talkingRowRate, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      novel.hashCode,
      $mrjc(
          bigGenre.hashCode,
          $mrjc(
              genre.hashCode,
              $mrjc(
                  firstPublicationDate.hashCode,
                  $mrjc(
                      lastPublicationDate.hashCode,
                      $mrjc(
                          length.hashCode,
                          $mrjc(
                              isStop.hashCode,
                              $mrjc(
                                  writerDevice.hashCode,
                                  $mrjc(
                                      totalPoint.hashCode,
                                      $mrjc(
                                          dailyPoint.hashCode,
                                          $mrjc(
                                              weeklyRatingPoint.hashCode,
                                              $mrjc(
                                                  monthlyRatingPoint.hashCode,
                                                  $mrjc(
                                                      quarterRatingPoint
                                                          .hashCode,
                                                      $mrjc(
                                                          yearlyRatingPoint
                                                              .hashCode,
                                                          $mrjc(
                                                              bookmarkNum
                                                                  .hashCode,
                                                              $mrjc(
                                                                  impressionNum
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      reviewNum
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          allPoint
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              illustNum.hashCode,
                                                                              $mrjc(talkingRowRate.hashCode, updatedAt.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NovelDetail &&
          other.novel == this.novel &&
          other.bigGenre == this.bigGenre &&
          other.genre == this.genre &&
          other.firstPublicationDate == this.firstPublicationDate &&
          other.lastPublicationDate == this.lastPublicationDate &&
          other.length == this.length &&
          other.isStop == this.isStop &&
          other.writerDevice == this.writerDevice &&
          other.totalPoint == this.totalPoint &&
          other.dailyPoint == this.dailyPoint &&
          other.weeklyRatingPoint == this.weeklyRatingPoint &&
          other.monthlyRatingPoint == this.monthlyRatingPoint &&
          other.quarterRatingPoint == this.quarterRatingPoint &&
          other.yearlyRatingPoint == this.yearlyRatingPoint &&
          other.bookmarkNum == this.bookmarkNum &&
          other.impressionNum == this.impressionNum &&
          other.reviewNum == this.reviewNum &&
          other.allPoint == this.allPoint &&
          other.illustNum == this.illustNum &&
          other.talkingRowRate == this.talkingRowRate &&
          other.updatedAt == this.updatedAt);
}

class NovelDetailsCompanion extends UpdateCompanion<NovelDetail> {
  final Value<String> novel;
  final Value<BigGenre> bigGenre;
  final Value<Genre> genre;
  final Value<DateTime> firstPublicationDate;
  final Value<DateTime> lastPublicationDate;
  final Value<int> length;
  final Value<bool> isStop;
  final Value<WriterDevice> writerDevice;
  final Value<int> totalPoint;
  final Value<int> dailyPoint;
  final Value<int> weeklyRatingPoint;
  final Value<int> monthlyRatingPoint;
  final Value<int> quarterRatingPoint;
  final Value<int> yearlyRatingPoint;
  final Value<int> bookmarkNum;
  final Value<int> impressionNum;
  final Value<int> reviewNum;
  final Value<int> allPoint;
  final Value<int> illustNum;
  final Value<int> talkingRowRate;
  final Value<DateTime> updatedAt;
  const NovelDetailsCompanion({
    this.novel = const Value.absent(),
    this.bigGenre = const Value.absent(),
    this.genre = const Value.absent(),
    this.firstPublicationDate = const Value.absent(),
    this.lastPublicationDate = const Value.absent(),
    this.length = const Value.absent(),
    this.isStop = const Value.absent(),
    this.writerDevice = const Value.absent(),
    this.totalPoint = const Value.absent(),
    this.dailyPoint = const Value.absent(),
    this.weeklyRatingPoint = const Value.absent(),
    this.monthlyRatingPoint = const Value.absent(),
    this.quarterRatingPoint = const Value.absent(),
    this.yearlyRatingPoint = const Value.absent(),
    this.bookmarkNum = const Value.absent(),
    this.impressionNum = const Value.absent(),
    this.reviewNum = const Value.absent(),
    this.allPoint = const Value.absent(),
    this.illustNum = const Value.absent(),
    this.talkingRowRate = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NovelDetailsCompanion.insert({
    @required String novel,
    @required BigGenre bigGenre,
    @required Genre genre,
    @required DateTime firstPublicationDate,
    @required DateTime lastPublicationDate,
    @required int length,
    @required bool isStop,
    @required WriterDevice writerDevice,
    @required int totalPoint,
    @required int dailyPoint,
    @required int weeklyRatingPoint,
    @required int monthlyRatingPoint,
    @required int quarterRatingPoint,
    @required int yearlyRatingPoint,
    @required int bookmarkNum,
    @required int impressionNum,
    @required int reviewNum,
    @required int allPoint,
    @required int illustNum,
    @required int talkingRowRate,
    @required DateTime updatedAt,
  })  : novel = Value(novel),
        bigGenre = Value(bigGenre),
        genre = Value(genre),
        firstPublicationDate = Value(firstPublicationDate),
        lastPublicationDate = Value(lastPublicationDate),
        length = Value(length),
        isStop = Value(isStop),
        writerDevice = Value(writerDevice),
        totalPoint = Value(totalPoint),
        dailyPoint = Value(dailyPoint),
        weeklyRatingPoint = Value(weeklyRatingPoint),
        monthlyRatingPoint = Value(monthlyRatingPoint),
        quarterRatingPoint = Value(quarterRatingPoint),
        yearlyRatingPoint = Value(yearlyRatingPoint),
        bookmarkNum = Value(bookmarkNum),
        impressionNum = Value(impressionNum),
        reviewNum = Value(reviewNum),
        allPoint = Value(allPoint),
        illustNum = Value(illustNum),
        talkingRowRate = Value(talkingRowRate),
        updatedAt = Value(updatedAt);
  static Insertable<NovelDetail> custom({
    Expression<String> novel,
    Expression<int> bigGenre,
    Expression<int> genre,
    Expression<DateTime> firstPublicationDate,
    Expression<DateTime> lastPublicationDate,
    Expression<int> length,
    Expression<bool> isStop,
    Expression<int> writerDevice,
    Expression<int> totalPoint,
    Expression<int> dailyPoint,
    Expression<int> weeklyRatingPoint,
    Expression<int> monthlyRatingPoint,
    Expression<int> quarterRatingPoint,
    Expression<int> yearlyRatingPoint,
    Expression<int> bookmarkNum,
    Expression<int> impressionNum,
    Expression<int> reviewNum,
    Expression<int> allPoint,
    Expression<int> illustNum,
    Expression<int> talkingRowRate,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (novel != null) 'novel': novel,
      if (bigGenre != null) 'big_genre': bigGenre,
      if (genre != null) 'genre': genre,
      if (firstPublicationDate != null)
        'first_publication_date': firstPublicationDate,
      if (lastPublicationDate != null)
        'last_publication_date': lastPublicationDate,
      if (length != null) 'length': length,
      if (isStop != null) 'is_stop': isStop,
      if (writerDevice != null) 'writer_device': writerDevice,
      if (totalPoint != null) 'total_point': totalPoint,
      if (dailyPoint != null) 'daily_point': dailyPoint,
      if (weeklyRatingPoint != null) 'weekly_rating_point': weeklyRatingPoint,
      if (monthlyRatingPoint != null)
        'monthly_rating_point': monthlyRatingPoint,
      if (quarterRatingPoint != null)
        'quarter_rating_point': quarterRatingPoint,
      if (yearlyRatingPoint != null) 'yearly_rating_point': yearlyRatingPoint,
      if (bookmarkNum != null) 'bookmark_num': bookmarkNum,
      if (impressionNum != null) 'impression_num': impressionNum,
      if (reviewNum != null) 'review_num': reviewNum,
      if (allPoint != null) 'all_point': allPoint,
      if (illustNum != null) 'illust_num': illustNum,
      if (talkingRowRate != null) 'talking_row_rate': talkingRowRate,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NovelDetailsCompanion copyWith(
      {Value<String> novel,
      Value<BigGenre> bigGenre,
      Value<Genre> genre,
      Value<DateTime> firstPublicationDate,
      Value<DateTime> lastPublicationDate,
      Value<int> length,
      Value<bool> isStop,
      Value<WriterDevice> writerDevice,
      Value<int> totalPoint,
      Value<int> dailyPoint,
      Value<int> weeklyRatingPoint,
      Value<int> monthlyRatingPoint,
      Value<int> quarterRatingPoint,
      Value<int> yearlyRatingPoint,
      Value<int> bookmarkNum,
      Value<int> impressionNum,
      Value<int> reviewNum,
      Value<int> allPoint,
      Value<int> illustNum,
      Value<int> talkingRowRate,
      Value<DateTime> updatedAt}) {
    return NovelDetailsCompanion(
      novel: novel ?? this.novel,
      bigGenre: bigGenre ?? this.bigGenre,
      genre: genre ?? this.genre,
      firstPublicationDate: firstPublicationDate ?? this.firstPublicationDate,
      lastPublicationDate: lastPublicationDate ?? this.lastPublicationDate,
      length: length ?? this.length,
      isStop: isStop ?? this.isStop,
      writerDevice: writerDevice ?? this.writerDevice,
      totalPoint: totalPoint ?? this.totalPoint,
      dailyPoint: dailyPoint ?? this.dailyPoint,
      weeklyRatingPoint: weeklyRatingPoint ?? this.weeklyRatingPoint,
      monthlyRatingPoint: monthlyRatingPoint ?? this.monthlyRatingPoint,
      quarterRatingPoint: quarterRatingPoint ?? this.quarterRatingPoint,
      yearlyRatingPoint: yearlyRatingPoint ?? this.yearlyRatingPoint,
      bookmarkNum: bookmarkNum ?? this.bookmarkNum,
      impressionNum: impressionNum ?? this.impressionNum,
      reviewNum: reviewNum ?? this.reviewNum,
      allPoint: allPoint ?? this.allPoint,
      illustNum: illustNum ?? this.illustNum,
      talkingRowRate: talkingRowRate ?? this.talkingRowRate,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (novel.present) {
      map['novel'] = Variable<String>(novel.value);
    }
    if (bigGenre.present) {
      final converter = $NovelDetailsTable.$converter0;
      map['big_genre'] = Variable<int>(converter.mapToSql(bigGenre.value));
    }
    if (genre.present) {
      final converter = $NovelDetailsTable.$converter1;
      map['genre'] = Variable<int>(converter.mapToSql(genre.value));
    }
    if (firstPublicationDate.present) {
      map['first_publication_date'] =
          Variable<DateTime>(firstPublicationDate.value);
    }
    if (lastPublicationDate.present) {
      map['last_publication_date'] =
          Variable<DateTime>(lastPublicationDate.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    if (isStop.present) {
      map['is_stop'] = Variable<bool>(isStop.value);
    }
    if (writerDevice.present) {
      final converter = $NovelDetailsTable.$converter2;
      map['writer_device'] =
          Variable<int>(converter.mapToSql(writerDevice.value));
    }
    if (totalPoint.present) {
      map['total_point'] = Variable<int>(totalPoint.value);
    }
    if (dailyPoint.present) {
      map['daily_point'] = Variable<int>(dailyPoint.value);
    }
    if (weeklyRatingPoint.present) {
      map['weekly_rating_point'] = Variable<int>(weeklyRatingPoint.value);
    }
    if (monthlyRatingPoint.present) {
      map['monthly_rating_point'] = Variable<int>(monthlyRatingPoint.value);
    }
    if (quarterRatingPoint.present) {
      map['quarter_rating_point'] = Variable<int>(quarterRatingPoint.value);
    }
    if (yearlyRatingPoint.present) {
      map['yearly_rating_point'] = Variable<int>(yearlyRatingPoint.value);
    }
    if (bookmarkNum.present) {
      map['bookmark_num'] = Variable<int>(bookmarkNum.value);
    }
    if (impressionNum.present) {
      map['impression_num'] = Variable<int>(impressionNum.value);
    }
    if (reviewNum.present) {
      map['review_num'] = Variable<int>(reviewNum.value);
    }
    if (allPoint.present) {
      map['all_point'] = Variable<int>(allPoint.value);
    }
    if (illustNum.present) {
      map['illust_num'] = Variable<int>(illustNum.value);
    }
    if (talkingRowRate.present) {
      map['talking_row_rate'] = Variable<int>(talkingRowRate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NovelDetailsCompanion(')
          ..write('novel: $novel, ')
          ..write('bigGenre: $bigGenre, ')
          ..write('genre: $genre, ')
          ..write('firstPublicationDate: $firstPublicationDate, ')
          ..write('lastPublicationDate: $lastPublicationDate, ')
          ..write('length: $length, ')
          ..write('isStop: $isStop, ')
          ..write('writerDevice: $writerDevice, ')
          ..write('totalPoint: $totalPoint, ')
          ..write('dailyPoint: $dailyPoint, ')
          ..write('weeklyRatingPoint: $weeklyRatingPoint, ')
          ..write('monthlyRatingPoint: $monthlyRatingPoint, ')
          ..write('quarterRatingPoint: $quarterRatingPoint, ')
          ..write('yearlyRatingPoint: $yearlyRatingPoint, ')
          ..write('bookmarkNum: $bookmarkNum, ')
          ..write('impressionNum: $impressionNum, ')
          ..write('reviewNum: $reviewNum, ')
          ..write('allPoint: $allPoint, ')
          ..write('illustNum: $illustNum, ')
          ..write('talkingRowRate: $talkingRowRate, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NovelDetailsTable extends NovelDetails
    with TableInfo<$NovelDetailsTable, NovelDetail> {
  final GeneratedDatabase _db;
  final String _alias;
  $NovelDetailsTable(this._db, [this._alias]);
  final VerificationMeta _novelMeta = const VerificationMeta('novel');
  GeneratedTextColumn _novel;
  @override
  GeneratedTextColumn get novel => _novel ??= _constructNovel();
  GeneratedTextColumn _constructNovel() {
    return GeneratedTextColumn('novel', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _bigGenreMeta = const VerificationMeta('bigGenre');
  GeneratedIntColumn _bigGenre;
  @override
  GeneratedIntColumn get bigGenre => _bigGenre ??= _constructBigGenre();
  GeneratedIntColumn _constructBigGenre() {
    return GeneratedIntColumn(
      'big_genre',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  GeneratedIntColumn _genre;
  @override
  GeneratedIntColumn get genre => _genre ??= _constructGenre();
  GeneratedIntColumn _constructGenre() {
    return GeneratedIntColumn(
      'genre',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstPublicationDateMeta =
      const VerificationMeta('firstPublicationDate');
  GeneratedDateTimeColumn _firstPublicationDate;
  @override
  GeneratedDateTimeColumn get firstPublicationDate =>
      _firstPublicationDate ??= _constructFirstPublicationDate();
  GeneratedDateTimeColumn _constructFirstPublicationDate() {
    return GeneratedDateTimeColumn(
      'first_publication_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastPublicationDateMeta =
      const VerificationMeta('lastPublicationDate');
  GeneratedDateTimeColumn _lastPublicationDate;
  @override
  GeneratedDateTimeColumn get lastPublicationDate =>
      _lastPublicationDate ??= _constructLastPublicationDate();
  GeneratedDateTimeColumn _constructLastPublicationDate() {
    return GeneratedDateTimeColumn(
      'last_publication_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lengthMeta = const VerificationMeta('length');
  GeneratedIntColumn _length;
  @override
  GeneratedIntColumn get length => _length ??= _constructLength();
  GeneratedIntColumn _constructLength() {
    return GeneratedIntColumn(
      'length',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isStopMeta = const VerificationMeta('isStop');
  GeneratedBoolColumn _isStop;
  @override
  GeneratedBoolColumn get isStop => _isStop ??= _constructIsStop();
  GeneratedBoolColumn _constructIsStop() {
    return GeneratedBoolColumn(
      'is_stop',
      $tableName,
      false,
    );
  }

  final VerificationMeta _writerDeviceMeta =
      const VerificationMeta('writerDevice');
  GeneratedIntColumn _writerDevice;
  @override
  GeneratedIntColumn get writerDevice =>
      _writerDevice ??= _constructWriterDevice();
  GeneratedIntColumn _constructWriterDevice() {
    return GeneratedIntColumn(
      'writer_device',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalPointMeta = const VerificationMeta('totalPoint');
  GeneratedIntColumn _totalPoint;
  @override
  GeneratedIntColumn get totalPoint => _totalPoint ??= _constructTotalPoint();
  GeneratedIntColumn _constructTotalPoint() {
    return GeneratedIntColumn(
      'total_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dailyPointMeta = const VerificationMeta('dailyPoint');
  GeneratedIntColumn _dailyPoint;
  @override
  GeneratedIntColumn get dailyPoint => _dailyPoint ??= _constructDailyPoint();
  GeneratedIntColumn _constructDailyPoint() {
    return GeneratedIntColumn(
      'daily_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weeklyRatingPointMeta =
      const VerificationMeta('weeklyRatingPoint');
  GeneratedIntColumn _weeklyRatingPoint;
  @override
  GeneratedIntColumn get weeklyRatingPoint =>
      _weeklyRatingPoint ??= _constructWeeklyRatingPoint();
  GeneratedIntColumn _constructWeeklyRatingPoint() {
    return GeneratedIntColumn(
      'weekly_rating_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthlyRatingPointMeta =
      const VerificationMeta('monthlyRatingPoint');
  GeneratedIntColumn _monthlyRatingPoint;
  @override
  GeneratedIntColumn get monthlyRatingPoint =>
      _monthlyRatingPoint ??= _constructMonthlyRatingPoint();
  GeneratedIntColumn _constructMonthlyRatingPoint() {
    return GeneratedIntColumn(
      'monthly_rating_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quarterRatingPointMeta =
      const VerificationMeta('quarterRatingPoint');
  GeneratedIntColumn _quarterRatingPoint;
  @override
  GeneratedIntColumn get quarterRatingPoint =>
      _quarterRatingPoint ??= _constructQuarterRatingPoint();
  GeneratedIntColumn _constructQuarterRatingPoint() {
    return GeneratedIntColumn(
      'quarter_rating_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearlyRatingPointMeta =
      const VerificationMeta('yearlyRatingPoint');
  GeneratedIntColumn _yearlyRatingPoint;
  @override
  GeneratedIntColumn get yearlyRatingPoint =>
      _yearlyRatingPoint ??= _constructYearlyRatingPoint();
  GeneratedIntColumn _constructYearlyRatingPoint() {
    return GeneratedIntColumn(
      'yearly_rating_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bookmarkNumMeta =
      const VerificationMeta('bookmarkNum');
  GeneratedIntColumn _bookmarkNum;
  @override
  GeneratedIntColumn get bookmarkNum =>
      _bookmarkNum ??= _constructBookmarkNum();
  GeneratedIntColumn _constructBookmarkNum() {
    return GeneratedIntColumn(
      'bookmark_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _impressionNumMeta =
      const VerificationMeta('impressionNum');
  GeneratedIntColumn _impressionNum;
  @override
  GeneratedIntColumn get impressionNum =>
      _impressionNum ??= _constructImpressionNum();
  GeneratedIntColumn _constructImpressionNum() {
    return GeneratedIntColumn(
      'impression_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reviewNumMeta = const VerificationMeta('reviewNum');
  GeneratedIntColumn _reviewNum;
  @override
  GeneratedIntColumn get reviewNum => _reviewNum ??= _constructReviewNum();
  GeneratedIntColumn _constructReviewNum() {
    return GeneratedIntColumn(
      'review_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _allPointMeta = const VerificationMeta('allPoint');
  GeneratedIntColumn _allPoint;
  @override
  GeneratedIntColumn get allPoint => _allPoint ??= _constructAllPoint();
  GeneratedIntColumn _constructAllPoint() {
    return GeneratedIntColumn(
      'all_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _illustNumMeta = const VerificationMeta('illustNum');
  GeneratedIntColumn _illustNum;
  @override
  GeneratedIntColumn get illustNum => _illustNum ??= _constructIllustNum();
  GeneratedIntColumn _constructIllustNum() {
    return GeneratedIntColumn(
      'illust_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _talkingRowRateMeta =
      const VerificationMeta('talkingRowRate');
  GeneratedIntColumn _talkingRowRate;
  @override
  GeneratedIntColumn get talkingRowRate =>
      _talkingRowRate ??= _constructTalkingRowRate();
  GeneratedIntColumn _constructTalkingRowRate() {
    return GeneratedIntColumn(
      'talking_row_rate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        novel,
        bigGenre,
        genre,
        firstPublicationDate,
        lastPublicationDate,
        length,
        isStop,
        writerDevice,
        totalPoint,
        dailyPoint,
        weeklyRatingPoint,
        monthlyRatingPoint,
        quarterRatingPoint,
        yearlyRatingPoint,
        bookmarkNum,
        impressionNum,
        reviewNum,
        allPoint,
        illustNum,
        talkingRowRate,
        updatedAt
      ];
  @override
  $NovelDetailsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'novel_details';
  @override
  final String actualTableName = 'novel_details';
  @override
  VerificationContext validateIntegrity(Insertable<NovelDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('novel')) {
      context.handle(
          _novelMeta, novel.isAcceptableOrUnknown(data['novel'], _novelMeta));
    } else if (isInserting) {
      context.missing(_novelMeta);
    }
    context.handle(_bigGenreMeta, const VerificationResult.success());
    context.handle(_genreMeta, const VerificationResult.success());
    if (data.containsKey('first_publication_date')) {
      context.handle(
          _firstPublicationDateMeta,
          firstPublicationDate.isAcceptableOrUnknown(
              data['first_publication_date'], _firstPublicationDateMeta));
    } else if (isInserting) {
      context.missing(_firstPublicationDateMeta);
    }
    if (data.containsKey('last_publication_date')) {
      context.handle(
          _lastPublicationDateMeta,
          lastPublicationDate.isAcceptableOrUnknown(
              data['last_publication_date'], _lastPublicationDateMeta));
    } else if (isInserting) {
      context.missing(_lastPublicationDateMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length'], _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    if (data.containsKey('is_stop')) {
      context.handle(_isStopMeta,
          isStop.isAcceptableOrUnknown(data['is_stop'], _isStopMeta));
    } else if (isInserting) {
      context.missing(_isStopMeta);
    }
    context.handle(_writerDeviceMeta, const VerificationResult.success());
    if (data.containsKey('total_point')) {
      context.handle(
          _totalPointMeta,
          totalPoint.isAcceptableOrUnknown(
              data['total_point'], _totalPointMeta));
    } else if (isInserting) {
      context.missing(_totalPointMeta);
    }
    if (data.containsKey('daily_point')) {
      context.handle(
          _dailyPointMeta,
          dailyPoint.isAcceptableOrUnknown(
              data['daily_point'], _dailyPointMeta));
    } else if (isInserting) {
      context.missing(_dailyPointMeta);
    }
    if (data.containsKey('weekly_rating_point')) {
      context.handle(
          _weeklyRatingPointMeta,
          weeklyRatingPoint.isAcceptableOrUnknown(
              data['weekly_rating_point'], _weeklyRatingPointMeta));
    } else if (isInserting) {
      context.missing(_weeklyRatingPointMeta);
    }
    if (data.containsKey('monthly_rating_point')) {
      context.handle(
          _monthlyRatingPointMeta,
          monthlyRatingPoint.isAcceptableOrUnknown(
              data['monthly_rating_point'], _monthlyRatingPointMeta));
    } else if (isInserting) {
      context.missing(_monthlyRatingPointMeta);
    }
    if (data.containsKey('quarter_rating_point')) {
      context.handle(
          _quarterRatingPointMeta,
          quarterRatingPoint.isAcceptableOrUnknown(
              data['quarter_rating_point'], _quarterRatingPointMeta));
    } else if (isInserting) {
      context.missing(_quarterRatingPointMeta);
    }
    if (data.containsKey('yearly_rating_point')) {
      context.handle(
          _yearlyRatingPointMeta,
          yearlyRatingPoint.isAcceptableOrUnknown(
              data['yearly_rating_point'], _yearlyRatingPointMeta));
    } else if (isInserting) {
      context.missing(_yearlyRatingPointMeta);
    }
    if (data.containsKey('bookmark_num')) {
      context.handle(
          _bookmarkNumMeta,
          bookmarkNum.isAcceptableOrUnknown(
              data['bookmark_num'], _bookmarkNumMeta));
    } else if (isInserting) {
      context.missing(_bookmarkNumMeta);
    }
    if (data.containsKey('impression_num')) {
      context.handle(
          _impressionNumMeta,
          impressionNum.isAcceptableOrUnknown(
              data['impression_num'], _impressionNumMeta));
    } else if (isInserting) {
      context.missing(_impressionNumMeta);
    }
    if (data.containsKey('review_num')) {
      context.handle(_reviewNumMeta,
          reviewNum.isAcceptableOrUnknown(data['review_num'], _reviewNumMeta));
    } else if (isInserting) {
      context.missing(_reviewNumMeta);
    }
    if (data.containsKey('all_point')) {
      context.handle(_allPointMeta,
          allPoint.isAcceptableOrUnknown(data['all_point'], _allPointMeta));
    } else if (isInserting) {
      context.missing(_allPointMeta);
    }
    if (data.containsKey('illust_num')) {
      context.handle(_illustNumMeta,
          illustNum.isAcceptableOrUnknown(data['illust_num'], _illustNumMeta));
    } else if (isInserting) {
      context.missing(_illustNumMeta);
    }
    if (data.containsKey('talking_row_rate')) {
      context.handle(
          _talkingRowRateMeta,
          talkingRowRate.isAcceptableOrUnknown(
              data['talking_row_rate'], _talkingRowRateMeta));
    } else if (isInserting) {
      context.missing(_talkingRowRateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {novel};
  @override
  NovelDetail map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NovelDetail.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NovelDetailsTable createAlias(String alias) {
    return $NovelDetailsTable(_db, alias);
  }

  static TypeConverter<BigGenre, int> $converter0 =
      const EnumIndexConverter<BigGenre>(BigGenre.values);
  static TypeConverter<Genre, int> $converter1 =
      const EnumIndexConverter<Genre>(Genre.values);
  static TypeConverter<WriterDevice, int> $converter2 =
      const EnumIndexConverter<WriterDevice>(WriterDevice.values);
}

class NovelDetailKeyWord extends DataClass
    implements Insertable<NovelDetailKeyWord> {
  final int novelDetail;
  final int keyword;
  NovelDetailKeyWord({@required this.novelDetail, @required this.keyword});
  factory NovelDetailKeyWord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return NovelDetailKeyWord(
      novelDetail: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}novel_detail']),
      keyword:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}keyword']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || novelDetail != null) {
      map['novel_detail'] = Variable<int>(novelDetail);
    }
    if (!nullToAbsent || keyword != null) {
      map['keyword'] = Variable<int>(keyword);
    }
    return map;
  }

  NovelDetailKeyWordsCompanion toCompanion(bool nullToAbsent) {
    return NovelDetailKeyWordsCompanion(
      novelDetail: novelDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(novelDetail),
      keyword: keyword == null && nullToAbsent
          ? const Value.absent()
          : Value(keyword),
    );
  }

  factory NovelDetailKeyWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NovelDetailKeyWord(
      novelDetail: serializer.fromJson<int>(json['novelDetail']),
      keyword: serializer.fromJson<int>(json['keyword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'novelDetail': serializer.toJson<int>(novelDetail),
      'keyword': serializer.toJson<int>(keyword),
    };
  }

  NovelDetailKeyWord copyWith({int novelDetail, int keyword}) =>
      NovelDetailKeyWord(
        novelDetail: novelDetail ?? this.novelDetail,
        keyword: keyword ?? this.keyword,
      );
  @override
  String toString() {
    return (StringBuffer('NovelDetailKeyWord(')
          ..write('novelDetail: $novelDetail, ')
          ..write('keyword: $keyword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(novelDetail.hashCode, keyword.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NovelDetailKeyWord &&
          other.novelDetail == this.novelDetail &&
          other.keyword == this.keyword);
}

class NovelDetailKeyWordsCompanion extends UpdateCompanion<NovelDetailKeyWord> {
  final Value<int> novelDetail;
  final Value<int> keyword;
  const NovelDetailKeyWordsCompanion({
    this.novelDetail = const Value.absent(),
    this.keyword = const Value.absent(),
  });
  NovelDetailKeyWordsCompanion.insert({
    @required int novelDetail,
    @required int keyword,
  })  : novelDetail = Value(novelDetail),
        keyword = Value(keyword);
  static Insertable<NovelDetailKeyWord> custom({
    Expression<int> novelDetail,
    Expression<int> keyword,
  }) {
    return RawValuesInsertable({
      if (novelDetail != null) 'novel_detail': novelDetail,
      if (keyword != null) 'keyword': keyword,
    });
  }

  NovelDetailKeyWordsCompanion copyWith(
      {Value<int> novelDetail, Value<int> keyword}) {
    return NovelDetailKeyWordsCompanion(
      novelDetail: novelDetail ?? this.novelDetail,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (novelDetail.present) {
      map['novel_detail'] = Variable<int>(novelDetail.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<int>(keyword.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NovelDetailKeyWordsCompanion(')
          ..write('novelDetail: $novelDetail, ')
          ..write('keyword: $keyword')
          ..write(')'))
        .toString();
  }
}

class $NovelDetailKeyWordsTable extends NovelDetailKeyWords
    with TableInfo<$NovelDetailKeyWordsTable, NovelDetailKeyWord> {
  final GeneratedDatabase _db;
  final String _alias;
  $NovelDetailKeyWordsTable(this._db, [this._alias]);
  final VerificationMeta _novelDetailMeta =
      const VerificationMeta('novelDetail');
  GeneratedIntColumn _novelDetail;
  @override
  GeneratedIntColumn get novelDetail =>
      _novelDetail ??= _constructNovelDetail();
  GeneratedIntColumn _constructNovelDetail() {
    return GeneratedIntColumn(
      'novel_detail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _keywordMeta = const VerificationMeta('keyword');
  GeneratedIntColumn _keyword;
  @override
  GeneratedIntColumn get keyword => _keyword ??= _constructKeyword();
  GeneratedIntColumn _constructKeyword() {
    return GeneratedIntColumn(
      'keyword',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [novelDetail, keyword];
  @override
  $NovelDetailKeyWordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'novel_detail_key_words';
  @override
  final String actualTableName = 'novel_detail_key_words';
  @override
  VerificationContext validateIntegrity(Insertable<NovelDetailKeyWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('novel_detail')) {
      context.handle(
          _novelDetailMeta,
          novelDetail.isAcceptableOrUnknown(
              data['novel_detail'], _novelDetailMeta));
    } else if (isInserting) {
      context.missing(_novelDetailMeta);
    }
    if (data.containsKey('keyword')) {
      context.handle(_keywordMeta,
          keyword.isAcceptableOrUnknown(data['keyword'], _keywordMeta));
    } else if (isInserting) {
      context.missing(_keywordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NovelDetailKeyWord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NovelDetailKeyWord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NovelDetailKeyWordsTable createAlias(String alias) {
    return $NovelDetailKeyWordsTable(_db, alias);
  }
}

abstract class _$NarouDatabase extends GeneratedDatabase {
  _$NarouDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WritersTable _writers;
  $WritersTable get writers => _writers ??= $WritersTable(this);
  $NovelsTable _novels;
  $NovelsTable get novels => _novels ??= $NovelsTable(this);
  $ChaptersTable _chapters;
  $ChaptersTable get chapters => _chapters ??= $ChaptersTable(this);
  $EpisodesTable _episodes;
  $EpisodesTable get episodes => _episodes ??= $EpisodesTable(this);
  $IllustsTable _illusts;
  $IllustsTable get illusts => _illusts ??= $IllustsTable(this);
  $KeyWordsTable _keyWords;
  $KeyWordsTable get keyWords => _keyWords ??= $KeyWordsTable(this);
  $NovelDetailsTable _novelDetails;
  $NovelDetailsTable get novelDetails =>
      _novelDetails ??= $NovelDetailsTable(this);
  $NovelDetailKeyWordsTable _novelDetailKeyWords;
  $NovelDetailKeyWordsTable get novelDetailKeyWords =>
      _novelDetailKeyWords ??= $NovelDetailKeyWordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        writers,
        novels,
        chapters,
        episodes,
        illusts,
        keyWords,
        novelDetails,
        novelDetailKeyWords
      ];
}
