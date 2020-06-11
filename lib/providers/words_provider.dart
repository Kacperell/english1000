import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WordsProvider {
  static Database db;

  static Future open() async {
    print("oPEN!");
    db = await openDatabase(join(await getDatabasesPath(), 'words.db'),
        version: 1, onCreate: (db, version) async {
      print("create dbbb!");

      db.execute('''
          create table Words(
            id integer primary key autoincrement,
            word text not null,
            example_sentence text not null,
            pl_translate text not null,
            pl_example text not null,
            state int
          );
        ''');
      db.insert('Words', {
        'word': 'Car',
        'example_sentence': 'car is fast',
        'pl_translate': 'samochód',
        'pl_example': 'Samochód jest szybki',
        'state': 0
      });
      db.insert('Words', {
        'word': 'Dog',
        'example_sentence': 'the dog is barking',
        'pl_translate': 'Pie',
        'pl_example': 'Pies szczeka',
        'state': 0
      });
    });
  }

  static Future<List<Map<String, dynamic>>> getWordsList() async {
    if (db == null) {
      print("null");
      await open();
    }

    return await db.query('Words');
  }

  static Future insertWord(Map<String, dynamic> word) async {
    await db.insert('Words', word);
  }

  static Future getWord(int id) async {
    if (db == null) {
      print("null");
      await open();
    }
    return await db.query('Words', where: '"id" = ?', whereArgs: [id]);
  }

  static Future getCount(int state) async {
    if (db == null) {
      print("null");
      await open();
    }
    var quries =
        await db.query('Words', where: '"state" = ?', whereArgs: [state]);
    return quries.length;
  }

  static Future getWordsFromState(int state) async {
    if (db == null) {
      print("null");
      await open();
    }

    return await db.query('Words', where: '"state" = ?', whereArgs: [state]);
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
            pl_translate text not null,
            pl_example text not null,
            state int
          );
        ''');
    db.insert('Words', {
      'word': 'Car',
      'example_sentence': 'car is fast',
      'pl_translate': 'samochód',
      'pl_example': 'Samochód jest szybki',
      'state': 0
    });
    db.insert('Words', {
      'word': 'Dog',
      'example_sentence': 'the dog is barking',
      'pl_translate': 'Pie',
      'pl_example': 'Pies szczeka',
      'state': 0
    });
  }
}
