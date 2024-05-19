import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/likeNotesModel.dart';

class DBHelper {
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  Database? db;
  String tableName = "likeNote";
  String noteId = "id";
  String noteTitle = "notetitle";
  String Notes = "notes";

  Future<void> initDB() async {
    String dbLocation = await getDatabasesPath();
    String path = join(dbLocation, "product.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        String query =
            "CREATE TABLE $tableName($noteId INTEGER PRIMARY KEY AUTOINCREMENT, $noteTitle TEXT NOT NULL,$Notes TEXT NOT NULL);";
        await db.execute(query).then((value) {
          log("$tableName created");
        }).onError((error, _) {
          log("ERROR : $error");
        });
      },
    );
  }

  Future<int> likeNotest({required String note,required String notetitle}) async {
    await initDB();

    Map<String, dynamic> data = {
      noteTitle: notetitle,
      Notes: note,
    };

    return await db!.insert(
      tableName,
      data,
    );
  }

  Future<List<CartModel>> getMyNotes() async {
    await initDB();
    String query = "SELECT * FROM $tableName;";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);

    return data.map((e) => CartModel.fromDB(data: e)).toList();
  }

  Future<int> deleteNotes({required String title}) async {
    await initDB();
    return await db!.delete(
      tableName,
      where: "$Notes = ?",
      whereArgs: [title],
    );
  }
}