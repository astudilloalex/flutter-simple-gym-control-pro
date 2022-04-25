import 'package:simple_gym_control_pro/src/data/local/sqlite/sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/company.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/company_sqlite_repository.dart';
import 'package:sqflite/sqflite.dart';

class CompanySQLite implements CompanySQLiteRepository {
  const CompanySQLite();

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<int> delete(Company entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<int> deleteAll([Iterable<Company>? entities]) {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<int> deleteAllById(Iterable<int> ids) {
    // TODO: implement deleteAllById
    throw UnimplementedError();
  }

  @override
  Future<int> deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<bool> existsById(int id) {
    // TODO: implement existsById
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Company>> findAll({
    final Company? lastEntity,
    final int? size,
  }) async {
    final Database db = await SQLite.instance.database;
    final List<Map<String, Object?>> data = await db.query(_tableName);
    return List<Company>.from(data.map((json) => Company.fromJson(json)));
  }

  @override
  Future<Iterable<Company>> findAllById(Iterable<int> ids) {
    // TODO: implement findAllById
    throw UnimplementedError();
  }

  @override
  Future<Company?> findById(final int id) async {
    final Database db = await SQLite.instance.database;
    final List<Map<String, Object?>> data = await db.query(
      _tableName,
      where: 'id=?',
      whereArgs: [id],
    );
    if (data.isEmpty) return null;
    return Company.fromJson(data.first);
  }

  @override
  Future<Company?> save(final Company entity) async {
    final Database db = await SQLite.instance.database;
    final int id = await db.insert(
      _tableName,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return findById(id);
  }

  @override
  Future<Iterable<Company>> saveAll(Iterable<Company> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<Company?> update(final Company entity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  String get _tableName => 'company';
}
