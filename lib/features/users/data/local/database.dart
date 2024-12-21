import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get website => text()();
  TextColumn get company => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // CRUD Operations
  Future<List<User>> getAllUsers() => select(users).get();

  Future<User?> getUser(int id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<void> insertUser(UsersCompanion user) =>
      into(users).insert(user, mode: InsertMode.replace);

  Future<void> insertUsers(List<UsersCompanion> usersList) async {
    await batch((batch) {
      batch.insertAll(users, usersList, mode: InsertMode.replace);
    });
  }

  Future<void> deleteUser(int id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();

  Future<void> deleteAllUsers() => delete(users).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'users.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
