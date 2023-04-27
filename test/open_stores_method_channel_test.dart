import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_stores/open_stores_method_channel.dart';

void main() {
  MethodChannelOpenStores platform = MethodChannelOpenStores();
  const MethodChannel channel = MethodChannel('open_stores');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
