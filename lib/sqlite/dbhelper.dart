import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/sqlite/user.dart';

class DatabaseHelper {
  static final _databaseName = "tododb.db";
  static final _databaseVersion = 1;

  static final table = 'users_table';

  static final columnId = 'id';
  static final columnEmail = 'email';
  static final columnUserName = 'username';
  static final columnPassword = 'password';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnEmail TEXT NOT NULL,
            $columnUserName TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,

          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int?> insert(Userdb user) async {
    Database? db = await instance.database;
    return await db?.insert(table, {
      'email': user.email,
      'username': user.userName,
      'password': user.password
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>?> queryRows(email) async {
    Database? db = await instance.database;
    return await db?.query(table, where: "$columnEmail LIKE '%$email%'");
  }
  Future<Userdb?> getLogin(String mail, String password) async {
    Database? db = await instance.database;
    var res = await db?.rawQuery("SELECT * FROM $table WHERE $columnEmail = '$mail' and $columnPassword = '$password'");

    if (res!.length > 0) {
      return new Userdb.fromMap(res.first);
    }
    return null;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> closedb() async {
    Database? db = await instance.database;
    await db?.close();
  }
}
