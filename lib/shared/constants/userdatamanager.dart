import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  static const String jwtTokenKey = 'token';
  static const String userIdKey = 'id';
  static const String nameKey = 'name';
  static const String phoneKey = 'phone';

  static Future<void> saveLoginInfo(
    String jwtToken,
    String uId,
    String name,
    String phone,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(jwtTokenKey, jwtToken);
    await prefs.setString(userIdKey, uId);
    await prefs.setString(nameKey, name);
    await prefs.setString(phoneKey, phone);
  }

  static Future<Map<String, String>> getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      jwtTokenKey: prefs.getString(jwtTokenKey) ?? '',
      userIdKey: prefs.getString(userIdKey) ?? '',
      nameKey: prefs.getString(nameKey) ?? '',
      phoneKey: prefs.getString(phoneKey) ?? '',
    };
  }

  static Future<void> clearLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(jwtTokenKey);
    await prefs.remove(userIdKey);
    await prefs.remove(nameKey);
    await prefs.remove(phoneKey);
  }

  static Future<String?> getJwtToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(jwtTokenKey);
  }
}
//  SharedPreferences prefs =
//                             await SharedPreferences.getInstance();
//                         await prefs.setBool('isLoggedIn', false).then(
//                           (_) {
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => (),
//                               ),
//                               (route) => false,
//                             );
//                           },
//                         );