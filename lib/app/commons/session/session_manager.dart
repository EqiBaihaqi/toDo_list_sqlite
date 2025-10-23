import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import 'storage_name.dart';

abstract class SessionManager {
  Future<void> write(String key, String value);

  String? read(String key);

  double? readDouble(String key);

  Future<void> remove(String key);

  Future<void> clearAll();
}

class SessionManagerImpl extends SessionManager {
  final _box = GetStorage(StorageName.session);

  @override
  String? read(String key) {
    try {
      var result = base64.decode(_box.read(key));
      return utf8.decode(result);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    return await _box.write(key, base64.encode(value.codeUnits));
  }

  @override
  Future<void> clearAll() async {
    return await _box.erase();
  }

  @override
  double? readDouble(String key) {
    try {
      var result = base64.decode(_box.read(key));
      return double.parse(utf8.decode(result));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> remove(String key) async {
    return await _box.remove(key);
  }
}
