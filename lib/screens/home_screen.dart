import 'package:feeback_demo/common/constants.dart';
import 'package:feeback_demo/models/user_data.dart';
import 'package:feeback_demo/repo/prod_repo.dart';
import 'package:feeback_demo/screens/users_list_screen.dart';
import 'package:feeback_demo/widgets/button.dart';
import 'package:feeback_demo/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _firstNameText;
  TextEditingController _lastNameText;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _firstNameText = TextEditingController();
    _lastNameText = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameText.dispose();
    _lastNameText.dispose();
    super.dispose();
  }

  _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      UserData feedbackForm = UserData(
        _firstNameText.text,
        _lastNameText.text,
      );

      final appRepo = ProdRepo((String resp) {
        print("Response: $resp");
        if (resp == Constants.STATUS_SUCCESS) {
          //
          _showSnackbar("User Created");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Creating User");
      appRepo.createUser(feedbackForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Demo',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                child: SingleChildScrollView(child: _buildForm(context)),
              ),
              _buildBottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            maxLength: 15,
            textController: _firstNameText,
            hintText: 'First name',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 10.0),
          CustomTextFormField(
            maxLength: 15,
            textController: _lastNameText,
            hintText: 'Last name',
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomButton(
          onPressed: _submitForm,
          width: MediaQuery.of(context).size.width * 0.7,
          height: 47.0,
          color: Colors.black,
          text: "Add user",
        ),
        const SizedBox(height: 10.0),
        CustomButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserListScreen()),
            );
          },
          width: MediaQuery.of(context).size.width * 0.7,
          height: 47.0,
          color: Colors.black,
          text: "Show List",
        ),
      ],
    );
  }
}
