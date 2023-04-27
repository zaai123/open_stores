import 'package:flutter/material.dart';

import 'package:open_stores/open_stores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                OpenStores.openPlayStore(
                    packageName: 'com.amazon.avod.thirdpartyclient');
              },
              child: Text('Open play store')),
        ),
      ),
    );
  }
}
