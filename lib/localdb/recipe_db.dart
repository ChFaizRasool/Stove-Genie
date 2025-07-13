import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';

class RecipeDbHelper {
  static final RecipeDbHelper _instance = RecipeDbHelper._internal();
  factory RecipeDbHelper() => _instance;
  RecipeDbHelper._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE recipes(
            id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            time TEXT,
            calories TEXT,
            rating REAL,
            backgroundColor TEXT,
            description TEXT,
            category TEXT,
            steps TEXT,
            ingredients TEXT
            reviews TEXT

          )
        ''');
      },
    );
  }

  Future<void> insertRecipe(RecipeModel recipe) async {
    final db = await database;
    final data = recipe.toJson();

    // Serialize lists to JSON strings
    data['steps'] = jsonEncode(recipe.steps);
    data['ingredients'] = jsonEncode(recipe.ingredients);

    await db.insert(
      'recipes',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RecipeModel>> getRecipes() async {
    final db = await database;
    final maps = await db.query('recipes');

    return maps.map((map) {
      final stepsJson = map['steps'];
      final ingredientsJson = map['ingredients'];

      if (stepsJson is String) {
        map['steps'] = jsonDecode(stepsJson);
      }

      if (ingredientsJson is String) {
        map['ingredients'] = jsonDecode(ingredientsJson);
      }

      return RecipeModel.fromJson(map);
    }).toList();
  }

  Future<void> deleteRecipe(String id) async {
    final db = await database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isRecipeSaved(String id) async {
    final db = await database;
    final result = await db.query('recipes', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }
}
