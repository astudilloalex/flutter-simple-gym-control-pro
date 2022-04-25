import 'package:simple_gym_control_pro/src/domain/entities/customer.dart';
import 'package:simple_gym_control_pro/src/domain/repositories/local/crud_repository.dart';

abstract class CustomerSQLiteRepository extends CrudRepository<Customer, int> {
  const CustomerSQLiteRepository();
}
