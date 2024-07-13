

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String BASE_URL="https://tv2.goribz.com";

final Dio dio=Dio();

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();