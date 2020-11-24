import 'package:feeback_demo/common/constants.dart';
import 'package:feeback_demo/models/user_data.dart';
import 'package:feeback_demo/widgets/card/user_data_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserData> data = [];

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  void loadUserData() async {
    print('in fucn');
    final raw = await http.get(Constants.URL_LOAD);
    final jsonData = convert.jsonDecode(raw.body);
    print('this is json response $jsonData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Users',
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return DriverCard(
              firstName: 'Shireen',
              lastName: 'Kamran',
              email: 'email@yagoo.com',
              phoneNumber: '12234455566',
            );
          }),
    );
  }
}
