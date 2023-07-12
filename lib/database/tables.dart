import 'package:ornekuygulama/database/db_enums.dart';

// db modeli
class DBTables {
  // ignore: non_constant_identifier_names
  String UrunlerTB =
      "CREATE TABLE IF NOT EXISTS ${enTables.UrunlerTB.name} (UrunID INTEGER PRIMARY KEY,UrunIsmi TEXT,UrunModel TEXT, UrunMacAdresi TEXT,UrunFonksiyonlari TEXT)";
}
