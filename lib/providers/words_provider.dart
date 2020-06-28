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
      // db.insert('Words', {
      //   'word': 'Car',
      //   'example_sentence': "I'm driving my fast car🚗",
      // });
      // db.insert('Words', {
      //   'word': 'Be',
      //   'example_sentence': "Will you be my friend?",
      // });
      // db.insert('Words', {
      //   'word': 'Dog',
      //   'example_sentence': 'The dog is barking🐶',
      // });
      // db.insert('Words', {
      //   'word': 'Family',
      //   'example_sentence': 'You are like family to me👨‍👩‍👧',
      // });
      // db.insert('Words', {
      //   'word': 'And',
      //   'example_sentence': 'The water was lovely and cold.',
      // });
      // db.insert('Words', {
      //   'word': 'But',
      //   'example_sentence': "I know you're tired but you have to learn.",
      // });
      // db.insert('Words', {
      //   'word': 'Of',
      //   'example_sentence': "A piece of cake.",
      // });
      // db.insert('Words', {
      //   'word': 'A',
      //   'example_sentence':
      //       "Used when referring to someone or something for the first time in a text or conversation. This is a dog",
      // });
      // db.insert('Words', {
      //   'word': 'In',
      //   'example_sentence': "He's in the toilet.",
      // });
      // db.insert('Words', {
      //   'word': 'To',
      //   'example_sentence': "Let's go to the cinema.",
      // });
      // db.insert('Words', {
      //   'word': 'Have',
      //   'example_sentence': "Do you have a pen?",
      // });
      // db.insert('Words', {
      //   'word': 'Too',
      //   'example_sentence': "He was driving too fast.",
      // });
      // db.insert('Words', {
      //   'word': 'It',
      //   'example_sentence': "Is it a boy or a girl?",
      // });
      // db.insert('Words', {
      //   'word': 'I',
      //   'example_sentence': "I don't drink coffee.",
      // });
      // db.insert('Words', {
      //   'word': 'That',
      //   'example_sentence':
      //       "That woman is here again.She said that she was distracted.",
      // });
      // db.insert('Words', {
      //   'word': 'For',
      //   'example_sentence': "This is no place for you.",
      // });
      // db.insert('Words', {
      //   'word': 'You',
      //   'example_sentence': "You are very nice.",
      // });
      // db.insert('Words', {
      //   'word': 'He',
      //   'example_sentence': "He is my cousin.",
      // });
      // db.insert('Words', {
      //   'word': 'With',
      //   'example_sentence': "A flower-sprigged blouse with a white collar.",
      // });
      // db.insert('Words', {
      //   'word': 'On',
      //   'example_sentence': "She was lying on the floor.",
      // });
      // db.insert('Words', {
      //   'word': 'Do',
      //   'example_sentence': "What will you do tomorrow?",
      // });
      // db.insert('Words', {
      //   'word': 'Say',
      //   'example_sentence': "I don't want to say too much👅",
      // });
      // db.insert('Words', {
      //   'word': 'This',
      //   'example_sentence': "This is my guitar.",
      // });
      // db.insert('Words', {
      //   'word': 'They',
      //   'example_sentence': "They are weird.",
      // });
      // db.insert('Words', {
      //   'word': 'At',
      //   'example_sentence': "He arrived at the house at Christmas.",
      // });
      // db.insert('Words', {
      //   'word': 'We',
      //   'example_sentence': "We are going to the theater tomorrow.",
      // });
      // db.insert('Words', {
      //   'word': 'His',
      //   'example_sentence': "This is his pocket knife.",
      // });
      // db.insert('Words', {
      //   'word': 'From',
      //   'example_sentence': "This postcard is from Spain.",
      // });
      // db.insert('Words', {
      //   'word': 'Not',
      //   'example_sentence': "This is not a good idea.",
      // });
      // db.insert('Words', {
      //   'word': "Can't",
      //   'example_sentence': "I can't open it.",
      // });
      // db.insert('Words', {
      //   'word': "Won't",
      //   'example_sentence': "I won't go to school.",
      // });
      // db.insert('Words', {
      //   'word': "By",
      //   'example_sentence':
      //       "We will send it to you by email by the end of the week.",
      // });
      // db.insert('Words', {
      //   'word': "She",
      //   'example_sentence': "She is beautiful👧",
      // });
      // db.insert('Words', {
      //   'word': "Or",
      //   'example_sentence': "Tea or coffee",
      // });
      // db.insert('Words', {
      //   'word': "As",
      //   'example_sentence': "He got a job as a cook.",
      // });
      // db.insert('Words', {
      //   'word': "What",
      //   'example_sentence': "What are you doing?",
      // });
      // db.insert('Words', {
      //   'word': "Go",
      //   'example_sentence': "Go to school.",
      // });
      // db.insert('Words', {
      //   'word': "Their",
      //   'example_sentence': "She spoke with their father.",
      // });
      // db.insert('Words', {
      //   'word': "Can",
      //   'example_sentence': "What can I do for you?",
      // });
      // db.insert('Words', {
      //   'word': "Who",
      //   'example_sentence': "Who will lend me a pen?",
      // });
      // db.insert('Words', {
      //   'word': "Get",
      //   'example_sentence': "What did you get for Christmas?",
      // });
      // db.insert('Words', {
      //   'word': "If",
      //   'example_sentence': "I'm sorry if I'm annoying you",
      // });
      // db.insert('Words', {
      //   'word': "Would",
      //   'example_sentence': "Would you like some water?",
      // });
      // db.insert('Words', {
      //   'word': "Her",
      //   'example_sentence': "This is her hair dryer.",
      // });
      // db.insert('Words', {
      //   'word': "All",
      //   'example_sentence': "All my clothes are in the wardrobe.",
      // });
      // db.insert('Words', {
      //   'word': "My",
      //   'example_sentence': "My dad is at work.",
      // });
      // db.insert('Words', {
      //   'word': "Make",
      //   'example_sentence': "Can you make me breakfast?",
      // });
      // db.insert('Words', {
      //   'word': "About",
      //   'example_sentence': "What is this movie about?",
      // });
      // db.insert('Words', {
      //   'word': "Know",
      //   'example_sentence': "I know that song.",
      // });
      // db.insert('Words', {
      //   'word': "Will",
      //   'example_sentence': "You will forget about my birthday again!",
      // });
      // db.insert('Words', {
      //   'word': "Up",
      //   'example_sentence': "He jumped up",
      // });
      // db.insert('Words', {
      //   'word': "One",
      //   'example_sentence': "She is one of my English teachers.",
      // });
      // db.insert('Words', {
      //   'word': "Time",
      //   'example_sentence': "I don't have time, I'm in a hurry to school.",
      // });
      // db.insert('Words', {
      //   'word': "There",
      //   'example_sentence': "There is a snake!",
      // });
      // db.insert('Words', {
      //   'word': "Year",
      //   'example_sentence': "I haven't seen her for a year.",
      // });
      // db.insert('Words', {
      //   'word': "So",
      //   'example_sentence':
      //       "He isn't so bad as you'd think, so give him second chance.",
      // });
      // db.insert('Words', {
      //   'word': "Think",
      //   'example_sentence':
      //       "I think he should learn the 1000 most-used English words.",
      // });
      // db.insert('Words', {
      //   'word': "When",
      //   'example_sentence': "When do you go back?",
      // });
      // db.insert('Words', {
      //   'word': "Which",
      //   'example_sentence': "Which animal is the nicest?",
      // });
      // db.insert('Words', {
      //   'word': "Them",
      //   'example_sentence': "Please give this to them.",
      // });
      // db.insert('Words', {
      //   'word': "Some",
      //   'example_sentence': "Give them some candy.",
      // });
      // db.insert('Words', {
      //   'word': "Take",
      //   'example_sentence': "Take an umbrella with you.",
      // });
      // db.insert('Words', {
      //   'word': "Out",
      //   'example_sentence': "He's gone out.",
      // });
      // db.insert('Words', {
      //   'word': "Into",
      //   'example_sentence':
      //       "My puppy ran into the forest and dived into the lake.",
      // });
      // db.insert('Words', {
      //   'word': "Just",
      //   'example_sentence': "They just got home.",
      // });
      // db.insert('Words', {
      //   'word': "See",
      //   'example_sentence': "I see your progress in learning English!👀",
      // });
      // db.insert('Words', {
      //   'word': "Him",
      //   'example_sentence': "Lend him your car.",
      // });
      // db.insert('Words', {
      //   'word': "Your",
      //   'example_sentence': "It's nice that you lent me your car.",
      // });
      // db.insert('Words', {
      //   'word': "Come",
      //   'example_sentence': "Can you come to the party?",
      // });
      // db.insert('Words', {
      //   'word': "Could",
      //   'example_sentence': "Could you hand me a glass, please?",
      // });
      // db.insert('Words', {
      //   'word': "Now",
      //   'example_sentence': "He knew now that he'd lost the race.",
      // });
      // db.insert('Words', {
      //   'word': "Than",
      //   'example_sentence': "I am faster than you.",
      // });
      // db.insert('Words', {
      //   'word': "Like",
      //   'example_sentence': "I like you because you're like my brother.",
      // });
      // db.insert('Words', {
      //   'word': "Other",
      //   'example_sentence': "We saw elephants and lions, among other animals.",
      // });
      // db.insert('Words', {
      //   'word': "How",
      //   'example_sentence': "How do you record a video in slow motion?",
      // });
      // db.insert('Words', {
      //   'word': "Then",
      //   'example_sentence': "We had breakfast and then we went to church.",
      // });
      // db.insert('Words', {
      //   'word': "Its",
      //   'example_sentence': "The baby opened its eyes.",
      // });
      // db.insert('Words', {
      //   'word': "Our",
      //   'example_sentence': "This is our beautiful home.",
      // });
      // db.insert('Words', {
      //   'word': "Two",
      //   'example_sentence': "Two cheeseburgers, please.",
      // });
      // db.insert('Words', {
      //   'word': "More",
      //   'example_sentence': "Can I get more ketchup?",
      // });
      // db.insert('Words', {
      //   'word': "These",
      //   'example_sentence': "By mistake I opened one of these letters.",
      // });
      // db.insert('Words', {
      //   'word': "Want",
      //   'example_sentence': "Do you want to eat something?",
      // });
      // db.insert('Words', {
      //   'word': "Way",
      //   'example_sentence': "They still had a long way ahead of them.",
      // });
      // db.insert('Words', {
      //   'word': "Look",
      //   'example_sentence': "He looked at her and said she looked good.",
      // });
      // db.insert('Words', {
      //   'word': "First",
      //   'example_sentence': "First go to the gym for the first time.",
      // });
      // db.insert('Words', {
      //   'word': "Also",
      //   'example_sentence': "He also plays football.",
      // });
      // db.insert('Words', {
      //   'word': "New",
      //   'example_sentence': "This is my new iphone.",
      // });
      // db.insert('Words', {
      //   'word': "Because",
      //   'example_sentence': "We did it because we felt it our duty.",
      // });
      // db.insert('Words', {
      //   'word': "Day",
      //   'example_sentence': "We had a lovely day at the seaside.",
      // });
      // db.insert('Words', {
      //   'word': "Use",
      //   'example_sentence': "I've never used a dishwasher before.",
      // });
      // db.insert('Words', {
      //   'word': "No",
      //   'example_sentence': "They have no chance of winning.",
      // });
      // db.insert('Words', {
      //   'word': "Man",
      //   'example_sentence': "A man in a black suit was standing by the door🕴",
      // });
      // db.insert('Words', {
      //   'word': "Find",
      //   'example_sentence': "Where can I find a good restaurant?",
      // });
      // db.insert('Words', {
      //   'word': "Here",
      //   'example_sentence': "Your notebook is here.",
      // });
      // db.insert('Words', {
      //   'word': "Thing",
      //   'example_sentence': "It was the cutest thing I ever saw.",
      // });
      // db.insert('Words', {
      //   'word': "Give",
      //   'example_sentence': "Give her those glasses.",
      // });
      // db.insert('Words', {
      //   'word': "Many",
      //   'example_sentence': "Many people agreed with her.",
      // });
      // db.insert('Words', {
      //   'word': "Well",
      //   'example_sentence': "The whole team played well.",
      // });
      // db.insert('Words', {
      //   'word': "Only",
      //   'example_sentence': "I was only joking!",
      // });
      // db.insert('Words', {
      //   'word': "Those",
      //   'example_sentence': "Those books are very old.",
      // });
      // db.insert('Words', {
      //   'word': "Tell",
      //   'example_sentence': "Can you tell him to turn down the music?",
      // });
      // db.insert('Words', {
      //   'word': "Very",
      //   'example_sentence': "I am very happy.",
      // });
      // db.insert('Words', {
      //   'word': "Even",
      //   'example_sentence': "I don't even know where she is.",
      // });
      // db.insert('Words', {
      //   'word': "Back",
      //   'example_sentence': "Put that book back on the shelf.",
      // });
      // db.insert('Words', {
      //   'word': "Any",
      //   'example_sentence': "Have you any cheese?",
      // });
      // db.insert('Words', {
      //   'word': "Good",
      //   'example_sentence': "That was a really good price.",
      // });
      // db.insert('Words', {
      //   'word': "Woman",
      //   'example_sentence': "She is a beautiful woman.",
      // });
      // db.insert('Words', {
      //   'word': "Through",
      //   'example_sentence': "I went through the forest at night.",
      // });
      // db.insert('Words', {
      //   'word': "Us",
      //   'example_sentence': "He drove us to the cinema.",
      // });
      // db.insert('Words', {
      //   'word': "Life",
      //   'example_sentence': "It was the best day of my life.",
      // });
      // db.insert('Words', {
      //   'word': "Child",
      //   'example_sentence': "I remember her mainly as a child.",
      // });
      // db.insert('Words', {
      //   'word': "Work",
      //   'example_sentence': "He is still at work.",
      // });
      // db.insert('Words', {
      //   'word': "Down",
      //   'example_sentence': "Don't look down!",
      // });
      // db.insert('Words', {
      //   'word': "May",
      //   'example_sentence': "May I come in?",
      // });
      // db.insert('Words', {
      //   'word': "After",
      //   'example_sentence': "They went for a walk after work.",
      // });
      // db.insert('Words', {
      //   'word': "Should",
      //   'example_sentence': "You should go to sleep.",
      // });
      // db.insert('Words', {
      //   'word': "Call",
      //   'example_sentence': "I will call you tomorrow.",
      // });
      // db.insert('Words', {
      //   'word': "World",
      //   'example_sentence': "I would like to explore the whole world.",
      // });
      // db.insert('Words', {
      //   'word': "Over",
      //   'example_sentence': "The lamp hangs over the table.",
      // });
      // db.insert('Words', {
      //   'word': "School",
      //   'example_sentence': "You will be late for school.",
      // });
      // db.insert('Words', {
      //   'word': "Still",
      //   'example_sentence': "He is still in the store.",
      // });
      // db.insert('Words', {
      //   'word': "Try",
      //   'example_sentence': "I will try to learn all the words from this app.",
      // });
      // db.insert('Words', {
      //   'word': "Last",
      //   'example_sentence': "I don't understand that last sentence.",
      // });
      // db.insert('Words', {
      //   'word': "Ask",
      //   'example_sentence': "Can I ask you a question?",
      // });
      // db.insert('Words', {
      //   'word': "Need",
      //   'example_sentence': "I need a short break.",
      // });
      // db.insert('Words', {
      //   'word': "Feel",
      //   'example_sentence': "How do you feel?",
      // });
      // db.insert('Words', {
      //   'word': "Three",
      //   'example_sentence': "I have three sisters.",
      // });
      // db.insert('Words', {
      //   'word': "State",
      //   'example_sentence': "His car is in a terrible state.",
      // });
      // db.insert('Words', {
      //   'word': "Never",
      //   'example_sentence': "She never goes to bed before midnight.",
      // });
      // db.insert('Words', {
      //   'word': "Become",
      //   'example_sentence': "Her life has become very difficult",
      // });
      // db.insert('Words', {
      //   'word': "High",
      //   'example_sentence': "How high is that building?",
      // });
      // db.insert('Words', {
      //   'word': "Really",
      //   'example_sentence': "She doesn't really want to go",
      // });
      // db.insert('Words', {
      //   'word': "Something",
      //   'example_sentence': "I have something for you.",
      // });
      // db.insert('Words', {
      //   'word': "Most",
      //   'example_sentence': "Most people don't even know about it.",
      // });
      // db.insert('Words', {
      //   'word': "Another",
      //   'example_sentence': "My car is much faster than yours.",
      // });
      // db.insert('Words', {
      //   'word': "Much",
      //   'example_sentence': "My car is much faster than yours.",
      // });
      // db.insert('Words', {
      //   'word': "Own",
      //   'example_sentence': "I would like to buy my own apartment.",
      // });
      // db.insert('Words', {
      //   'word': "Leave",
      //   'example_sentence': "Don't leave me now, please.",
      // });
      // db.insert('Words', {
      //   'word': "Put",
      //   'example_sentence': "He put the phone on the table.",
      // });
      // db.insert('Words', {
      //   'word': "Old",
      //   'example_sentence': "She says she's too old to go to parties.",
      // });
      // db.insert('Words', {
      //   'word': "While",
      //   'example_sentence': "I don't want you to drive while you're so tired.",
      // });
      // db.insert('Words', {
      //   'word': "Mean",
      //   'example_sentence': "What do you mean?",
      // });
      // db.insert('Words', {
      //   'word': "Keep",
      //   'example_sentence': "You can keep the book. I have another copy.",
      // });
      // db.insert('Words', {
      //   'word': "Student",
      //   'example_sentence': "I have 30 students in my class.",
      // });
      // db.insert('Words', {
      //   'word': "Why",
      //   'example_sentence': "Why are you so sad?",
      // });
      // db.insert('Words', {
      //   'word': "Let",
      //   'example_sentence': "Let me love you.",
      // });
      // db.insert('Words', {
      //   'word': "Great",
      //   'example_sentence': "It is a great idea.",
      // });
      // db.insert('Words', {
      //   'word': "Same",
      //   'example_sentence': "We have the same shoes.",
      // });
      // db.insert('Words', {
      //   'word': "Big",
      //   'example_sentence': "Diet makes a big difference to health.",
      // });
      db.insert('Words', {
        'word': "Group",
        'example_sentence': "I have a group of friends.",
      });
      db.insert('Words', {
        'word': "Begin",
        'example_sentence': "I always begin training with a warm-up.",
      });
      db.insert('Words', {
        'word': "Seem",
        'example_sentence': "You seem sad, what's happened?",
      });
      db.insert('Words', {
        'word': "Country",
        'example_sentence': "They drove around the country.",
      });
      db.insert('Words', {
        'word': "Help",
        'example_sentence': "He helped me with my homework.",
      });
      db.insert('Words', {
        'word': "Talk",
        'example_sentence': "We need to talk.",
      });
      db.insert('Words', {
        'word': "Where",
        'example_sentence': "Where is my computer?",
      });
      db.insert('Words', {
        'word': "Turn",
        'example_sentence': "In 100 meters, turn right.",
      });
      db.insert('Words', {
        'word': "Problem",
        'example_sentence': "I have a problem with repairing the bike.",
      });
      db.insert('Words', {
        'word': "Every",
        'example_sentence': "He answered every question.",
      });
      db.insert('Words', {
        'word': "Start",
        'example_sentence': "This is a great to start to learn the English language.",
      });
      db.insert('Words', {
        'word': "Hand",
        'example_sentence': "He had a knife in his hand.🧤",
      });
      db.insert('Words', {
        'word': "Might",
        'example_sentence': "I might do it, but you have to help me.",
      });
      db.insert('Words', {
        'word': "Show",
        'example_sentence': "Show me what you drew.",
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

}
