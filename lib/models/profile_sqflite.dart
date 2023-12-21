// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfProfile {
  static late String phone;
  static late String name;
  static late int id;
  static late int money;
  static late int virtualmoney;

  static late String email;

  static late Database database;
  static bool init = false;

  static initDB() async {
    if (true) {
      database = await openDatabase(
        join(await getDatabasesPath(), 'profile2.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE profile(id INTEGER PRIMARY KEY, name TEXT, phone TEXT,email TEXT,virtualmoney INTEGER,money INTEGER)',
          );
        },
        version: 2,
      );
      init = true;
    }

    return database;
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'id': id,
      'name': name,
      'email': email,
      'money': money,
      'virtualmoney': virtualmoney,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'profile{id: $id, name: $name, email: $email}';
  }

  // Define a function that inserts dogs into the database
  static Future<void> insertProfile(
      {name, email, phone, money, virtualmoney}) async {
    // Get a reference to the database.
    final db = await initDB();
    SqfProfile.phone = name;
    SqfProfile.email = email;
    SqfProfile.name = phone;
    SqfProfile.money = money;
    SqfProfile.virtualmoney = virtualmoney;

    print(name);
    print(phone);
    print(email);
    print(money);
    print(virtualmoney);

    await db.insert(
      'profile',
      {
        'name': name,
        'phone': phone,
        'email': email,
        'money': money,
        'virtualmoney': virtualmoney,
        'id': 1
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<String> setProfile() async {
    final db = await initDB();

    final List<Map<String, dynamic>> maps = await db.query('profile');
    if (maps.isNotEmpty) {
      name = maps[0]['name'];
      phone = maps[0]['phone'];
      email = maps[0]['email'];
      money = maps[0]['money'];
      virtualmoney = maps[0]['virtualmoney'];

      id = maps[0]['id'];
      return 'success';
    }
    return 'empty';
  }

  static Future<String> fetchprofile() async {
    final db = await initDB();

    final List<Map<String, dynamic>> maps = await db.query('profile');
    if (maps.isNotEmpty) {
      name = maps[0]['name'];
      phone = maps[0]['phone'];
      email = maps[0]['email'];
      id = maps[0]['id'];
      money = maps[0]['money'];
      virtualmoney = maps[0]['virtualmoney'];
      print(email);
      return 'success';
    }
    return 'empty';
  }

  static Future<void> deleteProfile() async {
    // Get a reference to the database.
    final db = await initDB();

    await db.delete(
      'profile',
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}
