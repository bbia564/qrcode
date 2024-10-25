import 'dart:convert';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:qrcode/db_code/code_entity.dart';
import 'package:sqflite/sqflite.dart';

class DBCode extends GetxService {
  late Database dbBase;

  Future<DBCode> init() async {
    await createCodeDB();
    return this;
  }

  createCodeDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'code.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createCodeTable(db);
        });
  }

  createCodeTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS code (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, content TEXT, isScan INTEGER)');
  }

  insertCode(CodeEntity entity) async {
    final id = await dbBase.insert('code', {
      'createTime': entity.createTime.toIso8601String(),
      'type': entity.type.index,
      'content': entity.content,
      'isScan': entity.isScan,
    });
    return id;
  }

  cleanCodeData() async {
    await dbBase.delete('code');
  }

  Future<List<CodeEntity>> getCodeAllData() async {
    var result = await dbBase.query('code', orderBy: 'createTime DESC');
    return result.map((e) => CodeEntity.fromJson(e)).toList();
  }
}
