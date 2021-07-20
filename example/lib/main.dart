import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:sodium_web/sodium_web.dart';
import 'package:convert/convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    test();
  }

  test() async {
    await Sodium.init();
    final outlen = 16;
    final passwd = utf8.encoder.convert('correct horse battery staple');
    String s = '808182838485868788898a8b8c8d8e8f';
    Uint8List salt = Uint8List.fromList(hex.decode(s));
    final opslimit = 2;
    final memlimit = 65536 << 10;
    final alg = 2;
    final hash =
        Sodium.cryptoPwhash(outlen, passwd, salt, opslimit, memlimit, alg);
    Uint8List res =
        Uint8List.fromList(hex.decode('720f95400220748a811bca9b8cff5d6e'));
    print(hash);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Flutter test\n'),
        ),
      ),
    );
  }
}
