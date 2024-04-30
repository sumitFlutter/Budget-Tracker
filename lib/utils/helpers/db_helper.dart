import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DBHelper{
  static DBHelper dbHelper= DBHelper._();
  DBHelper._();
  Database? database;
  Future<Database?> checkDB() async {
    if(database!=null)
      {
        return database;
      }
    else{
      var db=await initDB();
      return db;
    }
  }
  Future<Database> initDB() async {
    Directory d1=await getApplicationSupportDirectory();
    String path=d1.path;
    String joinPath=join(path,"mySql.db");
    return openDatabase(joinPath,onCreate: (db, version) {
      db.execute('CREATE TABLE category("ID INTEGER PRIMARY KEY,TITLE TEXT")');
    },version: 1);
  }
  void insertCategory(){}
  void insertTrans(){}
  void readCategory(){}
  void readTrans(){}
  void updateTrans(){}
  void updateCategory(){}
   void deleteCategory(){}
  void deleteTrans(){}
}