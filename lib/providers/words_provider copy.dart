import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WordsProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'words.db'),
        version: 3, onCreate: (db, version) async {
      db.execute('''
          create table Words(
            id integer primary key autoincrement,
            word text not null,
            example_sentence text not null,
            state int 
          );
        ''');

      db.insert('Words',
          {'word': 'AppleXX3', 'example_sentence': 'is nice', 'state': 2});
      db.insert('Words',
          {'word': 'Car4', 'example_sentence': 'car is fast', 'state': 0});
      print("---");
      print(db.rawQuery('SELECT * FROM "Words"'));
    });
  }

  static Future<List<Map<String, dynamic>>> getWordsList() async {
    if (db == null) {
      await open();
    }
    return await db.query('Words');
  }

  static Future insertWord(Map<String, dynamic> word) async {
    await db.insert('Words', word);
  }
}
