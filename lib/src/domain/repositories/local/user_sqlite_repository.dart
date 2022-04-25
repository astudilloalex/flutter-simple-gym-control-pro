import 'package:simple_gym_control_pro/src/domain/entities/user.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/crud_repository.dart';

abstract class UserSQLiteRepository extends CrudRepository<User, int> {
  const UserSQLiteRepository();

  Future<User?> findByUsername(final String username);
}
