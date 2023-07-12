import 'dart:async';
import 'package:ornekuygulama/database/tables.dart';
import 'package:sqflite/sqflite.dart';

class AkilliEvUrunleriDB {
  late Database database;
  final String _dbName = "AkilliEvUrunleriDB";
  final int _versiyon = 1;
  final DBTables _dbTables = DBTables();

  /// database oluşturuldu ve tablo eklendi
  Future<void> openDB() async {
    // Initialize FFI
    database = await openDatabase(_dbName, version: _versiyon,
        onCreate: (db, version) {
      db.execute(_dbTables.UrunlerTB);
    });
  }

  /// DB Silme
  Future<void> deleteDB() async {
    await deleteDatabase('$_dbName.db');
  }

  /// Tablo Slme
  Future<void> deleteTable(String name) async {
    await database.execute("DROP TABLE $name");
  }

  /// Tablo Ekleme
  Future<void> addTable(String name) async {
    await database.execute(name);
  }

  /// Kolon Ekleme
  Future<void> addColumn(String table, String column, String option) async {
    var checkColumn = await database.rawQuery(
        'SELECT COUNT(*) FROM pragma_table_info("$table") where name="$column"');

    // ignore: unnecessary_null_comparison
    if (checkColumn != null) {
      int result = int.parse(checkColumn.first
          .toString()
          .replaceAll("{COUNT(*): ", "")
          .replaceAll("}", ""));

      if (result == 0) {
        await database
            .execute("ALTER TABLE $table ADD COLUMN $column $option;");
      }
    }
  }

  /// Tablo Adını Alma
  Future<void> getTablesName() async {
    // ignore: unused_local_variable
    for (var row
        in (await database.query('sqlite_master', columns: ['type', 'name']))) {
      // print(row.values);
    }
  }

  /// Tablo Ekleme
  Future<void> insertTable(
      Map<String, Object?> values, String tableName) async {
    final db = database;
    await db.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Silme
  Future<void> deleteItem(String tableName, String condition) async {
    await database.execute("delete from $tableName where $condition");
  }

  /// get data list
  Future<List<Map>> getDataListAll(String tableName) async {
    final List<Map<String, dynamic>> maps = await database.query(tableName);

    for (int i = 0; i < maps.length; i++) {
      // print(item["UrunIsmi"]);
    }

    return maps;
  }

  /// Veriyi liste olarak alma
  Future<List<Map>> getData(String tableName, String condition) async {
    var recData =
        await database.rawQuery("select * from $tableName where $condition");

    return recData;
  }

  /// Veriyi sıralı alma
  Future<List<Map>> getDataWithQuery(String query) async {
    var recData = await database.rawQuery(query);

    return recData;
  }
}
