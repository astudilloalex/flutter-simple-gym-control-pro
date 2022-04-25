import 'package:simple_gym_control_pro/src/data/local/sqlite/sqlite.dart';
import 'package:simple_gym_control_pro/src/domain/entities/customer.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/customer_sqlite_repository.dart';
import 'package:sqflite/sqflite.dart';

class CustomerSQLite implements CustomerSQLiteRepository {
  const CustomerSQLite();

  @override
  Future<int> count() async {
    final Database db = await SQLite.instance.database;
    return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(id) FROM $_tableName'),
        ) ??
        0;
  }

  @override
  Future<int> delete(Customer entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<int> deleteAll([Iterable<Customer>? entities]) {
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
  Future<Iterable<Customer>> findAll({Customer? lastEntity, int? size}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Customer>> findAllById(Iterable<int> ids) {
    // TODO: implement findAllById
    throw UnimplementedError();
  }

  @override
  Future<Customer?> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<Customer?> save(Customer entity) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Customer>> saveAll(Iterable<Customer> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<Customer?> update(Customer entity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  String get _tableName => 'customers';
}
