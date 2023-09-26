import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {

  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_sneakerapp');
    var databaseExists = await databaseFactory.databaseExists(path);
    print("setDatabase database_connection.dart");
    if (!databaseExists) {

      print("create_Database database_connection.dart");
      await openDatabase(
        path,
        version: 1,
        onCreate: _onCreatingDatabase,
      );
    } else {
      print("open_Database database_connection.dart");
      var database = await openDatabase(path);
      return database;
    }
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE db_Cart(id INTEGER PRIMARY KEY, idItem INTEGER, quantity INTEGER)");
  }

}
