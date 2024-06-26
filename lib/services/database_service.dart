// SQFLite Database Service
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DataBaseService {
  static final DataBaseService instance = DataBaseService._init();

  static Database? _database;
  Database? mockDatabase;

  DataBaseService._init();

  Future<Database> get database async {
    if (mockDatabase != null) return mockDatabase!;
    if (_database != null) return _database!;

    _database = await _initDB('greentoad.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // Ensure the correct database factory is initialized
    if (databaseFactory == null) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // creates Notifications table
    await db.execute('''
        CREATE TABLE notifications (
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL CHECK(LENGTH(title) <= 40),
          message TEXT NOT NULL CHECK(LENGTH(message) <= 240),
          time TEXT NOT NULL,
          isRead INTEGER NOT NULL
        )
      ''');

    // creates Events table
    await db.execute('''
        CREATE TABLE events (
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL CHECK(LENGTH(title) <= 40),
          startTime TEXT NOT NULL,
          endTime TEXT NOT NULL,
          description TEXT CHECK(LENGTH(description) <= 2500),
          location TEXT CHECK(LENGTH(location) <= 80),
          color INTEGER,
          url TEXT CHECK(LENGTH(url) <= 1200),
          phone TEXT CHECK(LENGTH(phone) <= 15),
          email TEXT CHECK(LENGTH(email) <= 254),
          isAllDay INTEGER NOT NULL
        )
    ''');

    // creates TaskBoardLabels table
    await db.execute('''
        CREATE TABLE taskboard_labels (
          id TEXT PRIMARY KEY,
          taskBoardId TEXT NOT NULL,
          labelName TEXT NOT NULL CHECK(LENGTH(labelName) <= 20),
          labelColor INTEGER NOT NULL,
          isSelected INTEGER NOT NULL,
          FOREIGN KEY (taskBoardId) REFERENCES task_boards (id) ON DELETE CASCADE
        )
    ''');

    // creates CheckListItems table
    await db.execute('''
        CREATE TABLE checklist_items (
          id TEXT PRIMARY KEY,
          checkListId TEXT NOT NULL,
          text TEXT NOT NULL CHECK(LENGTH(text) <= 140),
          isCompleted INTEGER NOT NULL,
          FOREIGN KEY (checkListId) REFERENCES check_lists (id) ON DELETE CASCADE
        )
    ''');

    // creates CheckLists table
    await db.execute('''
        CREATE TABLE check_lists (
          id TEXT PRIMARY KEY,
          taskBoardId TEXT NOT NULL,
          name TEXT NOT NULL CHECK(LENGTH(name) <= 100),
          FOREIGN KEY (taskBoardId) REFERENCES task_boards (id) ON DELETE CASCADE
        )
    ''');

    // creates TaskBoards table
    await db.execute('''
        CREATE TABLE task_boards (
          id TEXT PRIMARY KEY,
          coverColor INTEGER NOT NULL,
          boardName TEXT NOT NULL CHECK(LENGTH(boardName) <= 100),
          description TEXT CHECK(LENGTH(description) <= 2500),
          startTime TEXT,
          endTime TEXT,
          attachment BLOB,
          isStarred INTEGER NOT NULL
        )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;

    db.close();
  }
}
