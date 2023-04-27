import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_stores_platform_interface.dart';

/// An implementation of [OpenStoresPlatform] that uses method channels.
class MethodChannelOpenStores extends OpenStoresPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_stores');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
