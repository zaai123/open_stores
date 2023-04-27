import 'package:flutter_test/flutter_test.dart';
import 'package:open_stores/open_stores.dart';
import 'package:open_stores/open_stores_platform_interface.dart';
import 'package:open_stores/open_stores_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenStoresPlatform
    with MockPlatformInterfaceMixin
    implements OpenStoresPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OpenStoresPlatform initialPlatform = OpenStoresPlatform.instance;

  test('$MethodChannelOpenStores is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpenStores>());
  });

  test('getPlatformVersion', () async {
    OpenStores openStoresPlugin = OpenStores();
    MockOpenStoresPlatform fakePlatform = MockOpenStoresPlatform();
    OpenStoresPlatform.instance = fakePlatform;

    expect(await openStoresPlugin.getPlatformVersion(), '42');
  });
}
