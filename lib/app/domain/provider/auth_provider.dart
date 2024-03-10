import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/app/data/sqlite.dart';
import 'package:neobis_flutter_auth/app/domain/entity/user_entity.dart';

class AuthProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> login(String usrEmail, String usrPassword) async {
  final db = await databaseHelper.initDB();
  var result = await db.rawQuery(
      "select * from users where usrEmail = '$usrEmail'");
  if (result.isNotEmpty) {
    var user = User.fromJson(result[0]);
    if (user.usrPassword == usrPassword) {
      _currentUser = user;
      notifyListeners();
    } else {
      throw Exception('Incorrect password');
    }
  } else {
    throw Exception('User not found');
  }
}

  //Sign up
  Future<void> signup(String usrEmail, String usrPassword) async {
    final db = await databaseHelper.initDB();
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'usrEmail = ?',
      whereArgs: [usrEmail],
    );
    if (result.isNotEmpty) {
      throw Exception('User alredy exist');
    } else {
      await db.insert('users', User(usrEmail: usrEmail, usrPassword: usrPassword).toJson());
    }
  }
}
