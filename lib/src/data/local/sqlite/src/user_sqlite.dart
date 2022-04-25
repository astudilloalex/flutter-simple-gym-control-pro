import 'package:simple_gym_control_pro/src/data/local/sqlite/sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/user.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/user_sqlite_repository.dart';
import 'package:sqflite/sqflite.dart';

class UserSQLite implements UserSQLiteRepository {
  const UserSQLite();

  @override
  Future<int> count() async {
    final Database db = await SQLite.instance.database;
    return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(id) FROM $_tableName'),
        ) ??
        0;
  }

  @override
  Future<int> delete(final User entity) async {
    final Database db = await SQLite.instance.database;
    return db.delete(_tableName, where: 'id=?', whereArgs: [entity.id]);
  }

  @override
  Future<int> deleteAll([final Iterable<User>? entities]) async {
    final Database db = await SQLite.instance.database;
    if (entities == null || entities.isEmpty) return db.delete(_tableName);
    final List<int> ids = entities.map((user) => user.id).toList();
    final StringBuffer where = StringBuffer();
    where.write('id IN (');
    for (int i = 0; i < ids.length; i++) {
      if (i == ids.length - 1) {
        where.write('?)');
      } else {
        where.write('?, ');
      }
    }
    return db.delete(_tableName, where: where.toString(), whereArgs: ids);
  }

  @override
  Future<int> deleteAllById(final Iterable<int> ids) async {
    final Database db = await SQLite.instance.database;
    final StringBuffer where = StringBuffer();
    where.write('id IN (');
    for (int i = 0; i < ids.length; i++) {
      if (i == ids.length - 1) {
        where.write('?)');
      } else {
        where.write('?, ');
      }
    }
    return db.delete(
      _tableName,
      where: where.toString(),
      whereArgs: ids.toList(),
    );
  }

  @override
  Future<int> deleteById(final int id) async {
    final Database db = await SQLite.instance.database;
    return db.delete(_tableName, where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<bool> existsById(final int id) async {
    final Database db = await SQLite.instance.database;
    final int? count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(id) FROM $_tableName WHERE id=$id'),
    );
    return count != null && count > 0;
  }

  @override
  Future<Iterable<User>> findAll({
    final User? lastEntity,
    final int? size,
  }) async {
    final Database db = await SQLite.instance.database;
    final List<Map<String, Object?>> users = await db.query(_tableName);
    if (users.isEmpty) return [];
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i < users.length; i++) {
      final List<Map<String, Object?>> roles = await db.query(
        'roles',
        where: 'id=?',
        whereArgs: [users[i]['roleId']],
      );
      final Map<String, dynamic> jsonData = {
        'role': roles.first,
      };
      jsonData.addAll(users[i]);
      data.add(jsonData);
    }
    return List<User>.from(data.map((json) => User.fromJson(json)));
  }

  @override
  Future<Iterable<User>> findAllById(Iterable<int> ids) {
    // TODO: implement findAllById
    throw UnimplementedError();
  }

  @override
  Future<User?> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<User?> findByUsername(final String username) async {
    final Database db = await SQLite.instance.database;
    final List<Map<String, Object?>> user = await db.query(
      _tableName,
      where: 'username=?',
      whereArgs: [username],
    );
    if (user.isEmpty) return null;
    final List<Map<String, Object?>> role = await db.query(
      'roles',
      where: 'id=?',
      whereArgs: [user.first['roleId']],
    );
    final Map<String, dynamic> data = {
      'role': role.first,
    };
    data.addAll(user.first);
    return User.fromJson(data);
  }

  @override
  Future<User?> save(User entity) async {
    final Database db = await SQLite.instance.database;
    final Map<String, dynamic> user = entity.toJson();
    user.remove('role');
    final Map<String, dynamic> values = {
      'roleId': entity.role.id,
    };
    values.addAll(user);
    final int id = await db.insert(_tableName, values);
    if (id > 0) return entity;
    return null;
  }

  @override
  Future<Iterable<User>> saveAll(Iterable<User> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  String get _tableName => 'users';

  @override
  Future<User?> update(User entity) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
