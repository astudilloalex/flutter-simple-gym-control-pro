import 'package:simple_gym_control_pro/src/domain/entities/company.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/crud_repository.dart';

abstract class CompanySQLiteRepository extends CrudRepository<Company, int> {}
