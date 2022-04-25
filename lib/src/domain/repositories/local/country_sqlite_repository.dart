import 'package:simple_gym_control_pro/src/domain/entities/country.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/crud_repository.dart';

abstract class CountrySQLiteRepository extends CrudRepository<Country, int> {
  const CountrySQLiteRepository();
}
