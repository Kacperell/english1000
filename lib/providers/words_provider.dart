import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WordsProvider {
  static Database db;

  static Future open() async {
    print("oPEN!");
    db = await openDatabase(join(await getDatabasesPath(), 'words.db'),
        version: 3, onCreate: (db, version) async {
      print("safsafsa!");

      db.execute('''
          create table Words(
            id integer primary key autoincrement,
            word text not null,
            example_sentence text not null,
            state int
          );
        ''');
    });
  }

  static Future<List<Map<String, dynamic>>> getWordsList() async {
    if (db == null) {
      print("null");
      await open();
    }

    print(db);
    return await db.query('Words');
    // return [
    //   {'word': 'Car', 'example_sentence': 'car is fast', 'state': 0}
    // ];
  }

  static Future insertWord(Map<String, dynamic> word) async {
    print(word);
    await db.insert('Words', word);
  }

  static Future replaceWords() async {
    db.execute('''
          drop table Words;
        ''');

    db.execute('''
          create table Words(
            id integer primary key autoincrement,
            word text not null,
            example_sentence text not null,
            state int);
        ''');

    db.insert('Words',
        {'word': 'AppleXX2', 'example_sentence': 'is nice', 'state': 2});
    db.insert('Words',
        {'word': 'Car2', 'example_sentence': 'car is fast', 'state': 0});

    db.insert('Words',
        {'word': 'Fire2', 'example_sentence': 'hot hot hot', 'state': 1});
    // db.execute('''
    //       drop table Words;
    //     ''');
  }
}
