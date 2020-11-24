import 'package:feeback_demo/models/user_data.dart';

abstract class AppRepo {
  Future<void> createUser(UserData user);

  // Future<List<UserData>> loadUsers();

}
