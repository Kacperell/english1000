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
            state int DEFAULT 0,
            date_last_touched INTEGER DEFAULT (cast(strftime('%s','now') as int))
          );
        ''');
      db.insert('Words', {
        'word': 'Car',
        'example_sentence': "I'm driving my fast car🚗",
      });
      db.insert('Words', {
        'word': 'Be',
        'example_sentence': "Will you be my friend?",
      });
      db.insert('Words', {
        'word': 'Dog',
        'example_sentence': 'The dog is barking🐶',
      });
      db.insert('Words', {
        'word': 'Family',
        'example_sentence': 'You are like family to me👨‍👩‍👧',
      });
      db.insert('Words', {
        'word': 'And',
        'example_sentence': 'The water was lovely and cold.',
      });
      db.insert('Words', {
        'word': 'But',
        'example_sentence': "I know you're tired but you have to learn.",
      });
      db.insert('Words', {
        'word': 'Of',
        'example_sentence': "A piece of cake.",
      });
      db.insert('Words', {
        'word': 'A',
        'example_sentence':
            "Used when referring to someone or something for the first time in a text or conversation. This is a dog",
      });
      db.insert('Words', {
        'word': 'In',
        'example_sentence': "He's in the toilet.",
      });
      db.insert('Words', {
        'word': 'To',
        'example_sentence': "Let's go to the cinema.",
      });
      db.insert('Words', {
        'word': 'Have',
        'example_sentence': "Do you have a pen?",
      });
      db.insert('Words', {
        'word': 'Too',
        'example_sentence': "He was driving too fast.",
      });
      db.insert('Words', {
        'word': 'It',
        'example_sentence': "Is it a boy or a girl?",
      });
      db.insert('Words', {
        'word': 'I',
        'example_sentence': "I don't drink coffee.",
      });
      db.insert('Words', {
        'word': 'That',
        'example_sentence':
            "That woman is here again.She said that she was distracted.",
      });
      db.insert('Words', {
        'word': 'For',
        'example_sentence': "This is no place for you.",
      });
      db.insert('Words', {
        'word': 'You',
        'example_sentence': "You are very nice.",
      });
      db.insert('Words', {
        'word': 'He',
        'example_sentence': "He is my cousin.",
      });
      db.insert('Words', {
        'word': 'With',
        'example_sentence': "A flower-sprigged blouse with a white collar.",
      });
      db.insert('Words', {
        'word': 'On',
        'example_sentence': "She was lying on the floor.",
      });
      db.insert('Words', {
        'word': 'Do',
        'example_sentence': "What will you do tomorrow?",
      });
      db.insert('Words', {
        'word': 'Say',
        'example_sentence': "I don't want to say too much👅",
      });
      db.insert('Words', {
        'word': 'This',
        'example_sentence': "This is my guitar.",
      });
      db.insert('Words', {
        'word': 'They',
        'example_sentence': "They are weird.",
      });
      db.insert('Words', {
        'word': 'At',
        'example_sentence': "He arrived at the house at Christmas.",
      });
      db.insert('Words', {
        'word': 'We',
        'example_sentence': "We are going to the theater tomorrow.",
      });
      db.insert('Words', {
        'word': 'His',
        'example_sentence': "This is his pocket knife.",
      });
      db.insert('Words', {
        'word': 'From',
        'example_sentence': "This postcard is from Spain.",
      });
      db.insert('Words', {
        'word': 'Not',
        'example_sentence': "This is not a good idea.",
      });
      db.insert('Words', {
        'word': "Can't",
        'example_sentence': "I can't open it.",
      });
      db.insert('Words', {
        'word': "Won't",
        'example_sentence': "I won't go to school.",
      });
      db.insert('Words', {
        'word': "By",
        'example_sentence':
            "We will send it to you by email by the end of the week.",
      });
      db.insert('Words', {
        'word': "She",
        'example_sentence': "She is beautiful👧",
      });
      db.insert('Words', {
        'word': "Or",
        'example_sentence': "Tea or coffee",
      });
      db.insert('Words', {
        'word': "As",
        'example_sentence': "He got a job as a cook.",
      });
      db.insert('Words', {
        'word': "What",
        'example_sentence': "What are you doing?",
      });
      db.insert('Words', {
        'word': "Go",
        'example_sentence': "Go to school.",
      });
      db.insert('Words', {
        'word': "Their",
        'example_sentence': "She spoke with their father.",
      });
      db.insert('Words', {
        'word': "Can",
        'example_sentence': "What can I do for you?",
      });
      db.insert('Words', {
        'word': "Who",
        'example_sentence': "Who will lend me a pen?",
      });
      db.insert('Words', {
        'word': "Get",
        'example_sentence': "What did you get for Christmas?",
      });
      db.insert('Words', {
        'word': "If",
        'example_sentence': "I'm sorry if I'm annoying you",
      });
      db.insert('Words', {
        'word': "Would",
        'example_sentence': "Would you like some water?",
      });
      db.insert('Words', {
        'word': "Her",
        'example_sentence': "This is her hair dryer.",
      });
      db.insert('Words', {
        'word': "All",
        'example_sentence': "All my clothes are in the wardrobe.",
      });
      db.insert('Words', {
        'word': "My",
        'example_sentence': "My dad is at work.",
      });
      db.insert('Words', {
        'word': "Make",
        'example_sentence': "Can you make me breakfast?",
      });
      db.insert('Words', {
        'word': "About",
        'example_sentence': "What is this movie about?",
      });
      db.insert('Words', {
        'word': "Know",
        'example_sentence': "I know that song.",
      });
      db.insert('Words', {
        'word': "Will",
        'example_sentence': "You will forget about my birthday again!",
      });
      db.insert('Words', {
        'word': "Up",
        'example_sentence': "He jumped up",
      });
      db.insert('Words', {
        'word': "One",
        'example_sentence': "She is one of my English teachers.",
      });
      db.insert('Words', {
        'word': "Time",
        'example_sentence': "I don't have time, I'm in a hurry to school.",
      });
      db.insert('Words', {
        'word': "There",
        'example_sentence': "There is a snake!",
      });
      db.insert('Words', {
        'word': "Year",
        'example_sentence': "I haven't seen her for a year.",
      });
      db.insert('Words', {
        'word': "So",
        'example_sentence':
            "He isn't so bad as you'd think, so give him second chance.",
      });
      db.insert('Words', {
        'word': "Think",
        'example_sentence':
            "I think he should learn the 1000 most-used English words.",
      });
      db.insert('Words', {
        'word': "When",
        'example_sentence': "When do you go back?",
      });
      db.insert('Words', {
        'word': "Which",
        'example_sentence': "Which animal is the nicest?",
      });
      db.insert('Words', {
        'word': "Them",
        'example_sentence': "Please give this to them.",
      });
      db.insert('Words', {
        'word': "Some",
        'example_sentence': "Give them some candy.",
      });
      db.insert('Words', {
        'word': "Take",
        'example_sentence': "Take an umbrella with you.",
      });
      db.insert('Words', {
        'word': "Out",
        'example_sentence': "He's gone out.",
      });
      db.insert('Words', {
        'word': "Into",
        'example_sentence':
            "My puppy ran into the forest and dived into the lake.",
      });
      db.insert('Words', {
        'word': "Just",
        'example_sentence': "They just got home.",
      });
      db.insert('Words', {
        'word': "See",
        'example_sentence': "I see your progress in learning English!👀",
      });
      db.insert('Words', {
        'word': "Him",
        'example_sentence': "Lend him your car.",
      });
      db.insert('Words', {
        'word': "Your",
        'example_sentence': "It's nice that you lent me your car.",
      });
      db.insert('Words', {
        'word': "Come",
        'example_sentence': "Can you come to the party?",
      });
      db.insert('Words', {
        'word': "Could",
        'example_sentence': "Could you hand me a glass, please?",
      });
      db.insert('Words', {
        'word': "Now",
        'example_sentence': "He knew now that he'd lost the race.",
      });
      db.insert('Words', {
        'word': "Than",
        'example_sentence': "I am faster than you.",
      });
      db.insert('Words', {
        'word': "Like",
        'example_sentence': "I like you because you're like my brother.",
      });
      db.insert('Words', {
        'word': "Other",
        'example_sentence': "We saw elephants and lions, among other animals.",
      });
      db.insert('Words', {
        'word': "How",
        'example_sentence': "How do you record a video in slow motion?",
      });
      db.insert('Words', {
        'word': "Then",
        'example_sentence': "We had breakfast and then we went to church.",
      });
      db.insert('Words', {
        'word': "Its",
        'example_sentence': "The baby opened its eyes.",
      });
      db.insert('Words', {
        'word': "Our",
        'example_sentence': "This is our beautiful home.",
      });
      db.insert('Words', {
        'word': "Two",
        'example_sentence': "Two cheeseburgers, please.",
      });
      db.insert('Words', {
        'word': "More",
        'example_sentence': "Can I get more ketchup?",
      });
      db.insert('Words', {
        'word': "These",
        'example_sentence': "By mistake I opened one of these letters.",
      });
      db.insert('Words', {
        'word': "Want",
        'example_sentence': "Do you want to eat something?",
      });
      db.insert('Words', {
        'word': "Way",
        'example_sentence': "They still had a long way ahead of them.",
      });
      db.insert('Words', {
        'word': "Look",
        'example_sentence': "He looked at her and said she looked good.",
      });
      db.insert('Words', {
        'word': "First",
        'example_sentence': "First go to the gym for the first time.",
      });
      db.insert('Words', {
        'word': "Also",
        'example_sentence': "He also plays football.",
      });
      db.insert('Words', {
        'word': "New",
        'example_sentence': "This is my new iphone.",
      });
      db.insert('Words', {
        'word': "Because",
        'example_sentence': "We did it because we felt it our duty.",
      });
      db.insert('Words', {
        'word': "Day",
        'example_sentence': "We had a lovely day at the seaside.",
      });
      db.insert('Words', {
        'word': "Use",
        'example_sentence': "I've never used a dishwasher before.",
      });
      db.insert('Words', {
        'word': "No",
        'example_sentence': "They have no chance of winning.",
      });
      db.insert('Words', {
        'word': "Man",
        'example_sentence': "A man in a black suit was standing by the door🕴",
      });
      db.insert('Words', {
        'word': "Find",
        'example_sentence': "Where can I find a good restaurant?",
      });
      db.insert('Words', {
        'word': "Here",
        'example_sentence': "Your notebook is here.",
      });
      db.insert('Words', {
        'word': "Thing",
        'example_sentence': "It was the cutest thing I ever saw.",
      });
      db.insert('Words', {
        'word': "Give",
        'example_sentence': "Give her those glasses.",
      });
      db.insert('Words', {
        'word': "Many",
        'example_sentence': "Many people agreed with her.",
      });
      db.insert('Words', {
        'word': "Well",
        'example_sentence': "The whole team played well.",
      });

      /////////////////
    });

    /////////////////
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

  static Future getOneWordFromState(int state) async {
    if (db == null) {
      print("null");
      await open();
    }
    return await db.rawQuery(
        'SELECT * FROM "Words" where state=$state ORDER BY date_last_touched ASC LIMIT 1');
  }

  static Future getWordsFromState(int state) async {
    if (db == null) {
      print("null");
      await open();
    }
    return await db.rawQuery(
        'SELECT * FROM "Words" where state=$state ORDER BY date_last_touched ASC');
  }

  static Future updateWord(int state, int id, var now) async {
    await db.rawQuery(
        'UPDATE "Words" set state=$state, date_last_touched=$now  where id=$id');
  }

  // static Future insertWord(Map<String, dynamic> word) async {
  //   await db.insert('Words', word);
  // }
}
