
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'RegistrationScreen.dart';

Future<void> main() async {
  Sqflite;
  if (kIsWeb) {
    // Change default factory on the web
    DatabaseFactory? databaseFactoryWeb;
    databaseFactory = databaseFactoryWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text('Register!'),
      ),
      body: const RegistrationScreen(),
    ),
  ));
}
