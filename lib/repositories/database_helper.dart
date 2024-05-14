import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'resume_maker.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE resumes(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        phone TEXT,
        address TEXT,
        education TEXT,
        workExperience TEXT,
        skills TEXT
      )
    ''');
  }

  Future<int> insertResume(Map<String, dynamic> resume) async {
    Database db = await _databaseHelper.database;
    return await db.insert('resumes', resume);
  }

  Future<List<Map<String, dynamic>>> getAllResumes() async {
    Database db = await _databaseHelper.database;
    return await db.query('resumes');
  }
}
