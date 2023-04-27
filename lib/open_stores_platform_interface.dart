import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_stores_method_channel.dart';

abstract class OpenStoresPlatform extends PlatformInterface {
  /// Constructs a OpenStoresPlatform.
  OpenStoresPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenStoresPlatform _instance = MethodChannelOpenStores();

  /// The default instance of [OpenStoresPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenStores].
  static OpenStoresPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenStoresPlatform] when
  /// they register themselves.
  static set instance(OpenStoresPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
