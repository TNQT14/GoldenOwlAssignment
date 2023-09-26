import 'package:sqflite/sqflite.dart';
import '../model/cart_model.dart';
import 'database_connection.dart';
class Reponsitory{
  late DatabaseConnection _databaseConnection;

  Reponsitory(){
    _databaseConnection = DatabaseConnection();
    print('Call Reponsitory repositry.dart');
    database;
    print('Call Reponsitory repositry.dart');
  }

  static Database? _database;

  //Check if database is exist or not
  Future<Database?> get database async{
    if(_database!=null) {
      print('Yes database repositry.dart');
      _database = await _databaseConnection.setDatabase();
      print('Connection database repositry.dart');
      return _database;
    }

    print('No dtb repositry.dart');
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //Insert data into table
  insertData(table, data) async{
    print("insertData repositry.dart");
    var connection = await database;
    print("connection insertData repositry.dart");
    data.remove('id');
    return await connection!.insert(table, data);
  }

  Future<List<CartModel>> readData(String table) async {
    print("readData repositry.dart");
    var connection = await database;
    print("done readData repositry.dart");
    var results = await connection!.query(table);
    return results.map((map) => CartModel.fromMap(map)).toList();
  }

  readDataById(String table, itemId) async{
    print("readDataById repositry.dart");
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  readDataByColumnName(table, columnName, columnValue) async{
    print("readDataByColumnName repositry.dart");
    var connection = await database;
    return await connection?.query(table, where: '$columnName = ?', whereArgs: [columnValue]);
  }

  updateData(table, data) async   {
    var connection = await database;
    return await connection!.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteData(table, itemId) async {
    print('Called deleteData($table, $itemId)');
    var connection = await database;
    await connection!.rawDelete('DELETE FROM $table WHERE ID = $itemId');
    return await connection.rawUpdate('UPDATE $table SET id = id - 1 WHERE id > $itemId');
  }

}