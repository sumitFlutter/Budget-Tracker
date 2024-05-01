import 'dart:io';
import 'package:budget_tracker_app/screen/add/category/model/category_model.dart';
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
      db.execute('CREATE TABLE category(id INTEGER PRIMARY KEY,title TEXT)');
    },version: 1);
  }
  Future<void> insertCategory(String name) async {
    Database dbi=(await checkDB())!;
    dbi.insert("category",{"title":name} );
  }
  void insertTrans(){}
  Future<List<CategoryModel>> readCategory() async {
    Database dbc=(await checkDB())!;
   List <Map>l1 =await dbc.rawQuery("SELECT * FROM category");
   List<CategoryModel> c=l1.map((e) => CategoryModel.mapToModel(e)).toList();
   return c;
  }
  void readTrans(){}
  void updateTrans(){}
  Future<void> updateCategory({required String title,required int id}) async {
    Database dbu=(await checkDB())!;
    dbu.update("category",{"title":title} ,where:"id==?",whereArgs:[id]);
  }
   Future<void> deleteCategory({required int id}) async {
    Database dbd=(await checkDB())!;
    dbd.delete("category",whereArgs: [id],where: "id==?");

   }
  void deleteTrans(){}
}