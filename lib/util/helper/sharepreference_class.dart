import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  static Future<void> setValue(String key, String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value!);
  }

  static Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getString(key);
      if (kDebugMode) {
        print("getValue.....$value");
      }
      return value;
    } catch (error) {
      return null;
    }
  }

  // for bool
  static Future<bool?> getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getBool(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static Future<void> setBoolValue(String key, bool? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value!);
  }

  static Future<void> setRemoteModeType(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getRemoteModeType(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static Future<void> setLanguageIntValue(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getSelectLanguage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static Future<List<String>> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    if (value != null) {
      final List<dynamic> decoded = jsonDecode(value);
      final List<String> stringList = decoded.cast<String>();
      //print("stringList......share..succ..$stringList");
      return stringList;
    } else {
      //print("stringList......share....fail");
      return [];
    }
  }

  static Future<List<dynamic>> getMapList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getString(key);
      //print("getValueList.....${value}");
      if (value != null) {
        return List<Map<String, dynamic>>.from(json.decode(value));
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  static Future<dynamic> getMap(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getString(key);
      //print("getValueList.....${value}");
      if (value != null) {
        return json.decode(value);
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  static Future<void> setIntValue(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static Future<void> deleteKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> storeLocalData(
      {@required String? key, @required String? value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key!, value!);
  }

  static Future<String?> getLocalData({@required String? key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key!);
  }
}
