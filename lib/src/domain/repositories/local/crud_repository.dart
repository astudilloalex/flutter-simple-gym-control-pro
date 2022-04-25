abstract class Repository<T, ID> {
  const Repository();
}

abstract class CrudRepository<T, ID> extends Repository<T, ID> {
  const CrudRepository();

  Future<int> count();
  Future<int> delete(final T entity);
  Future<int> deleteAll([final Iterable<T>? entities]);
  Future<int> deleteAllById(final Iterable<ID> ids);
  Future<int> deleteById(final ID id);
  Future<bool> existsById(final ID id);
  Future<Iterable<T>> findAll({final T? lastEntity, final int? size});
  Future<Iterable<T>> findAllById(final Iterable<ID> ids);
  Future<T?> findById(final ID id);
  Future<T?> save(final T entity);
  Future<Iterable<T>> saveAll(final Iterable<T> entities);
  Future<T?> update(final T entity);
}
