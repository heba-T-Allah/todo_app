import 'dbhelper.dart';

class Userdb {
  int? id;
  String? email;
  String? userName;
  String? password;

  Userdb(this.id, this.email, this.userName, this.password);

  Userdb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    userName = map['username'];
    password = map['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnUserName: userName,
      DatabaseHelper.columnPassword: password,
    };
  }
}
