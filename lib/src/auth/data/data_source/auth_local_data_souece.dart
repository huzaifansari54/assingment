import 'package:shared_preferences/shared_preferences.dart';
import 'package:softlab/core/constants/value.dart';

abstract class $AuthLocalDataSource {
  const $AuthLocalDataSource();
  Future<void> saveToken(String token);
  Future<void> deleteToken(String token);
  String getToken();
}

class AuthLocalDataSouece extends $AuthLocalDataSource {
  final SharedPreferences _db;

  const AuthLocalDataSouece(this._db);
  @override
  Future<void> deleteToken(String token) async {
    await _db.remove(Value.tokenKey);
  }

  @override
  String getToken() {
    final token = _db.getString(Value.tokenKey);
    if (token == null) {
      throw Exception("");
    }
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await _db.setString(Value.tokenKey, token);
    } catch (exp) {
      throw Exception("Not Saved");
    }
  }
}
