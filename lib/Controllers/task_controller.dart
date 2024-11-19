import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Models/favorite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskController extends GetxController {
  static Database? _db;

  var tasks = <FavoriteModel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, 'task_database.db');



  return await openDatabase(
  path,
  version: 1,
  onCreate: (db, version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        num INTEGER,
        title TEXT, 
        image TEXT, 
        website TEXT, 
        facebook TEXT, 
        twitter TEXT, 
        liked INTEGER
      )
    ''');
  },
);

}

  Future<int> addTask(FavoriteModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => FavoriteModel.fromMap(data)).toList());
  }

  // Delete Task
  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete(
      'tasks',
      where: "id = ?",
      whereArgs: [id],
    );
    tasks.removeWhere((task) => task.id == id);
    loadTasks();
  }
}
