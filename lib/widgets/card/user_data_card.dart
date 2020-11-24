import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  final String firstName;
  final String email;
  final String phoneNumber;
  final String lastName;

  const DriverCard({
    Key key,
    this.firstName,
    this.email,
    this.phoneNumber,
    this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle _nameTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    );
    const TextStyle _emailTextStyle = const TextStyle(
        color: Colors.black38, fontSize: 14.0, fontStyle: FontStyle.italic);
    const TextStyle _phoneNumberTextStyle = const TextStyle(
      color: Colors.grey,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x1a000000),
              offset: Offset(1, 17),
              blurRadius: 17,
              spreadRadius: 0),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(firstName + " " + lastName, style: _nameTextStyle),
          Text(email, style: _emailTextStyle),
          Text(phoneNumber, style: _phoneNumberTextStyle),
        ],
      ),
    );
  }
}
