import 'package:feeback_demo/common/constants.dart';
import 'package:feeback_demo/models/user_data.dart';
import 'package:feeback_demo/repo/app_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProdRepo extends AppRepo {
  final void Function(String) callback;

  ProdRepo(this.callback);

  @override
  Future<void> createUser(UserData user) async {
    try {
      await http.get(Constants.URL + user.toParams()).then((resp) async {
        print("in resp ${resp.body}");
        callback(convert.jsonDecode(resp.body)['status']);
      });
    } catch (e) {
      print("in catch");
      print(e.toString());
    }
  }

// @override
// Future<List<UserData>> loadUsers() async {
//   return await http.get(Constants.URL).then((response) {
//     var jsonData = convert.jsonDecode(response.body) as List;
//     return jsonData.map((json) => UserData.fromJson(json)).toList();
//   });
// }
}
