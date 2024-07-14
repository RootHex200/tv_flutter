

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String BASE_URL="https://tv2.goribz.com";

final Dio dio=Dio();

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

bool validateEmail(String email) {
  // Regular expression for a valid email address
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  return emailRegex.hasMatch(email);
}