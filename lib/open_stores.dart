
import 'package:flutter/services.dart';

import 'open_stores_platform_interface.dart';

class OpenStores {
  static const MethodChannel _channel = MethodChannel('open_stores');
  static const String _openPlayStore = 'openPlayStore';


  static Future<bool> openPlayStore({required String packageName}) async {
    var params = {'package': packageName};
    final bool isStoreOpened =
    await _channel.invokeMethod(_openPlayStore, params);
    return isStoreOpened;
  }
}
