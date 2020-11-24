class UserData {
  String _fName;
  String _lName;

  UserData(
    this._fName,
    this._lName,
  );

  factory UserData.fromJson(dynamic json) {
    return UserData(
      "${json['fname']}",
      "${json['lname']}",
    );
  }

  Map toJson() => {
        "fname": _fName,
        "lname": _lName,
      };

  String toParams() => "?fname=$_fName&lname=$_lName";
}
