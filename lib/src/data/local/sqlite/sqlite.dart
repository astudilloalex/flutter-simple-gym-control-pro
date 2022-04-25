import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// SQLite singleton class service.
class SQLite {
  const SQLite._();

  static Database? _database;

  static SQLite? _instance;

  /// Return a singleton SQLite instance.
  // ignore: prefer_constructors_over_static_methods
  static SQLite get instance {
    return _instance ??= const SQLite._();
  }

  /// Close the current database.
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  /// Return a database instance.
  Future<Database> get database async {
    return _database ??= await openDatabase(
      join(await getDatabasesPath(), 'localdata.db'),
      onCreate: (db, version) async {
        final String script = await rootBundle.loadString(
          'assets/db/create_v$version.sql',
        );
        final List<String> sqlData = script.split(';');
        await db.transaction((txn) async {
          for (final String sql in sqlData) {
            if (sql.isNotEmpty) await txn.execute(sql.trim());
          }
        });
      },
      version: 1,
    );
  }
}
