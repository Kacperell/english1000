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
      // db.insert('Words', {
      //   'word': "Group",
      //   'example_sentence': "I have a group of friends.",
      // });
      // db.insert('Words', {
      //   'word': "Begin",
      //   'example_sentence': "I always begin training with a warm-up.",
      // });
      // db.insert('Words', {
      //   'word': "Seem",
      //   'example_sentence': "You seem sad, what's happened?",
      // });
      // db.insert('Words', {
      //   'word': "Country",
      //   'example_sentence': "They drove around the country.",
      // });
      // db.insert('Words', {
      //   'word': "Help",
      //   'example_sentence': "He helped me with my homework.",
      // });
      // db.insert('Words', {
      //   'word': "Talk",
      //   'example_sentence': "We need to talk.",
      // });
      // db.insert('Words', {
      //   'word': "Where",
      //   'example_sentence': "Where is my computer?",
      // });
      // db.insert('Words', {
      //   'word': "Turn",
      //   'example_sentence': "In 100 meters, turn right.",
      // });
      // db.insert('Words', {
      //   'word': "Problem",
      //   'example_sentence': "I have a problem with repairing the bike.",
      // });
      // db.insert('Words', {
      //   'word': "Every",
      //   'example_sentence': "He answered every question.",
      // });
      // db.insert('Words', {
      //   'word': "Start",
      //   'example_sentence':
      //       "This is a great to start to learn the English language.",
      // });
      // db.insert('Words', {
      //   'word': "Hand",
      //   'example_sentence': "He had a knife in his hand.🧤",
      // });
      // db.insert('Words', {
      //   'word': "Might",
      //   'example_sentence': "I might do it, but you have to help me.",
      // });
      // db.insert('Words', {
      //   'word': "Show",
      //   'example_sentence': "Show me what you drew.",
      // });
      // db.insert('Words', {
      //   'word': "Part",
      //   'example_sentence': "It is only part of the problem.",
      // });
      // db.insert('Words', {
      //   'word': "Against",
      //   'example_sentence': "Team 'a' is playing against team 'b'.",
      // });
      // db.insert('Words', {
      //   'word': "Place",
      //   'example_sentence': "This place is wonderful!",
      // });
      // db.insert('Words', {
      //   'word': "Such",
      //   'example_sentence': "I didn't say any such thing.",
      // });
      // db.insert('Words', {
      //   'word': "Again",
      //   'example_sentence': "I have to go to the dentist again.",
      // });
      // db.insert('Words', {
      //   'word': "Few",
      //   'example_sentence': "Few people came to the school.",
      // });
      // db.insert('Words', {
      //   'word': "Case",
      //   'example_sentence': "In this case, it is better to go home.",
      // });
      // db.insert('Words', {
      //   'word': "Week",
      //   'example_sentence': "She works a four-day week.",
      // });
      // db.insert('Words', {
      //   'word': "Company",
      //   'example_sentence': "This company treats its employees badly.",
      // });
      // db.insert('Words', {
      //   'word': "System",
      //   'example_sentence': "Our system is reliable.",
      // });
      // db.insert('Words', {
      //   'word': "Each",
      //   'example_sentence': "Can you give each of them a pen?",
      // });
      // db.insert('Words', {
      //   'word': "Right",
      //   'example_sentence': "My right hand is stronger than the left one.",
      // });
      // db.insert('Words', {
      //   'word': "Program",
      //   'example_sentence':
      //       "We learn how to program our own lives consciously.",
      // });
      // db.insert('Words', {
      //   'word': "Hear",
      //   'example_sentence': "Did you hear that?",
      // });
      // db.insert('Words', {
      //   'word': "Question",
      //   'example_sentence': "Do you have any questions?",
      // });
      // db.insert('Words', {
      //   'word': "During",
      //   'example_sentence': "He got up a couple of times during the night.",
      // });
      // db.insert('Words', {
      //   'word': "Play",
      //   'example_sentence': "I want to play basketball.",
      // });
      // db.insert('Words', {
      //   'word': "Government",
      //   'example_sentence': "A new government was elected this year.",
      // });
      // db.insert('Words', {
      //   'word': "Run",
      //   'example_sentence': "He's too drunk to run.",
      // });
      // db.insert('Words', {
      //   'word': "Small",
      //   'example_sentence': "He has two small children.",
      // });
      // db.insert('Words', {
      //   'word': "Number",
      //   'example_sentence': "I invited a small number of people.",
      // });
      // db.insert('Words', {
      //   'word': "Off",
      //   'example_sentence': "I got this thing off of him.",
      // });
      // db.insert('Words', {
      //   'word': "Always",
      //   'example_sentence': "You're always late!",
      // });
      // db.insert('Words', {
      //   'word': "Move",
      //   'example_sentence': "Don't move this chair.",
      // });
      // db.insert('Words', {
      //   'word': "Night",
      //   'example_sentence': "Where were you last night?",
      // });
      // db.insert('Words', {
      //   'word': "Live",
      //   'example_sentence': "Large birds usually live longer than small birds.",
      // });
      // db.insert('Words', {
      //   'word': "Mr",
      //   'example_sentence': "This is my neighbor, Mr. Smith.",
      // });
      // db.insert('Words', {
      //   'word': "Point",
      //   'example_sentence': "There was no point at all to his story.",
      // });
      // db.insert('Words', {
      //   'word': "Believe",
      //   'example_sentence': "I do not believe this story.",
      // });
      // db.insert('Words', {
      //   'word': "Hold",
      //   'example_sentence': "Hold my beer.",
      // });
      // db.insert('Words', {
      //   'word': "Today",
      //   'example_sentence': "Today is Saturday.",
      // });
      // db.insert('Words', {
      //   'word': "Bring",
      //   'example_sentence': "Bring me something to eat.",
      // });
      // db.insert('Words', {
      //   'word': "Happen",
      //   'example_sentence': "It happened yesterday evening.",
      // });
      // db.insert('Words', {
      //   'word': "Next",
      //   'example_sentence': "She returned the next day.",
      // });
      // db.insert('Words', {
      //   'word': "Without",
      //   'example_sentence': "I won't go without you.",
      // });
      // db.insert('Words', {
      //   'word': "Before",
      //   'example_sentence': "Clean the room before you go to the party.",
      // });
      // db.insert('Words', {
      //   'word': "Large",
      //   'example_sentence': "This room is large.",
      // });
      // db.insert('Words', {
      //   'word': "Million",
      //   'example_sentence': "I wish I had a million dollars.",
      // });
      // db.insert('Words', {
      //   'word': "Must",
      //   'example_sentence': "She said she must be going.",
      // });
      // db.insert('Words', {
      //   'word': "Home",
      //   'example_sentence': "Let's go home.",
      // });
      // db.insert('Words', {
      //   'word': "Under",
      //   'example_sentence': "The book is under the chair.",
      // });
      // db.insert('Words', {
      //   'word': "Water",
      //   'example_sentence': "The pool water was very cold.",
      // });
      // db.insert('Words', {
      //   'word': "Room",
      //   'example_sentence': "My room is on the second floor.",
      // });
      // db.insert('Words', {
      //   'word': "Write",
      //   'example_sentence': "She wrote me a letter.",
      // });
      // db.insert('Words', {
      //   'word': "Mother",
      //   'example_sentence': "My mother is a doctor.",
      // });
      // db.insert('Words', {
      //   'word': "Area",
      //   'example_sentence': "In this area there are many hotels.",
      // });
      // db.insert('Words', {
      //   'word': "National",
      //   'example_sentence': "He is a national hero.",
      // });
      // db.insert('Words', {
      //   'word': "Money",
      //   'example_sentence': "I plan to earn a lot of money.",
      // });
      // db.insert('Words', {
      //   'word': "Story",
      //   'example_sentence': "This can't be a true story.",
      // });
      // db.insert('Words', {
      //   'word': "Young",
      //   'example_sentence': "This young girl is very intelligent.",
      // });
      // db.insert('Words', {
      //   'word': "Fact",
      //   'example_sentence': "You must accept this fact.",
      // });
      // db.insert('Words', {
      //   'word': "Month",
      //   'example_sentence': "In a month I'm going on a journey of a lifetime.",
      // });
      // db.insert('Words', {
      //   'word': "Different",
      //   'example_sentence': "She was always trying different recipes.",
      // });
      // db.insert('Words', {
      //   'word': "Lot",
      //   'example_sentence': "I have a lot of work to do.",
      // });
      // db.insert('Words', {
      //   'word': "Study",
      //   'example_sentence': "He has to study more.",
      // });
      // db.insert('Words', {
      //   'word': "Book",
      //   'example_sentence': "Do you like reading books?",
      // });
      // db.insert('Words', {
      //   'word': "Eye",
      //   'example_sentence': "I have blue eyes.",
      // });
      // db.insert('Words', {
      //   'word': "Job",
      //   'example_sentence': "Do you like your job?",
      // });
      // db.insert('Words', {
      //   'word': "Word",
      //   'example_sentence': "What does this word mean?",
      // });
      // db.insert('Words', {
      //   'word': "Though",
      //   'example_sentence': "Though he isn't a great player, he always scores.",
      // });
      // db.insert('Words', {
      //   'word': "Business",
      //   'example_sentence': "His business is thriving.",
      // });
      // db.insert('Words', {
      //   'word': "Issue",
      //   'example_sentence': "This is a very important issue.",
      // });
      // db.insert('Words', {
      //   'word': "Side",
      //   'example_sentence': "Whose side are you on?",
      // });
      // db.insert('Words', {
      //   'word': "Kind",
      //   'example_sentence':
      //       "This is not my favourite kind of food but that is very kind of you.",
      // });
      // db.insert('Words', {
      //   'word': "Four",
      //   'example_sentence': "I have four brothers.",
      // });
      // db.insert('Words', {
      //   'word': "Head",
      //   'example_sentence': "She has a hat on her head.",
      // });
      // db.insert('Words', {
      //   'word': "Far",
      //   'example_sentence': "He hasn't gone far.",
      // });
      // db.insert('Words', {
      //   'word': "Black",
      //   'example_sentence': "She has a wonderful black handbag.",
      // });
      // db.insert('Words', {
      //   'word': "Long",
      //   'example_sentence': "She has long hair.",
      // });
      // db.insert('Words', {
      //   'word': "Both",
      //   'example_sentence': "They both love chocolate ice cream.",
      // });
      // db.insert('Words', {
      //   'word': "Little",
      //   'example_sentence': "When she was little she was always getting into scrapes.",
      // });
      // db.insert('Words', {
      //   'word': "House",
      //   'example_sentence': "You'll wake the whole house!",
      // });
      // db.insert('Words', {
      //   'word': "Yes",
      //   'example_sentence': "She said yes!",
      // });
      // db.insert('Words', {
      //   'word': "Since",
      //   'example_sentence': "I haven't seen him since yesterday.",
      // });
      // db.insert('Words', {
      //   'word': "Provide",
      //   'example_sentence': "They provide books for many children.",
      // });
      // db.insert('Words', {
      //   'word': "Service",
      //   'example_sentence': "They aim to provide better quality of service.",
      // });
      db.insert('Words', {
        'word': "Around",
        'example_sentence': "Can you come around six o'clock?",
      });
      db.insert('Words', {
        'word': "Friend",
        'example_sentence': "My friend always helps me.",
      });
      db.insert('Words', {
        'word': "Important",
        'example_sentence': "It was an important day for me.",
      });
      db.insert('Words', {
        'word': "Father",
        'example_sentence': "My father is so important to me.",
      });
      db.insert('Words', {
        'word': "Sit",
        'example_sentence': "Let's sit in the kitchen.",
      });
      db.insert('Words', {
        'word': "Away",
        'example_sentence': "Stay away from me.",
      });
      db.insert('Words', {
        'word': "Until",
        'example_sentence': "Don't leave until you're done.",
      });
      db.insert('Words', {
        'word': "Power",
        'example_sentence': "The party had been in power for eight years.",
      });
      db.insert('Words', {
        'word': "Hour",
        'example_sentence': "I was in traffic for half an hour.",
      });
      db.insert('Words', {
        'word': "Game",
        'example_sentence': "Let’s play a game.",
      });
      db.insert('Words', {
        'word': "Often",
        'example_sentence': "How often do you have your hair cut?",
      });
      db.insert('Words', {
        'word': "Yet",
        'example_sentence': "He’s not yet home.",
      });
      db.insert('Words', {
        'word': "Line",
        'example_sentence': "Draw a straight line.",
      });
      db.insert('Words', {
        'word': "Political",
        'example_sentence': "I stay away from political discussions.",
      });
      db.insert('Words', {
        'word': "End",
        'example_sentence': "It's not the end of the world.",
      });
      db.insert('Words', {
        'word': "Among",
        'example_sentence': "They have a nice house among trees.",
      });
      db.insert('Words', {
        'word': "Ever",
        'example_sentence': "Have you ever been in rome?",
      });
      db.insert('Words', {
        'word': "Stand",
        'example_sentence': "He can stand on his hands.",
      });
      db.insert('Words', {
        'word': "Bad",
        'example_sentence': "Have I come at a bad time for you?",
      });
      db.insert('Words', {
        'word': "Lose",
        'example_sentence': "You have nothing to lose.",
      });
      db.insert('Words', {
        'word': "However",
        'example_sentence':
            "I want to buy this shirt, however, I don't have money.",
      });
      db.insert('Words', {
        'word': "Member",
        'example_sentence': "He is a member of our team.",
      });
      db.insert('Words', {
        'word': "Pay",
        'example_sentence': "She paid for our dinner.",
      });
      db.insert('Words', {
        'word': "Law",
        'example_sentence': "They were taken to court for breaking the law.",
      });
      db.insert('Words', {
        'word': "Meet",
        'example_sentence': "I'll meet you outside the theatre at eight.",
      });
      db.insert('Words', {
        'word': "City",
        'example_sentence': "This is the city that never sleeps.",
      });
      db.insert('Words', {
        'word': "Almost",
        'example_sentence': "He almost dropped the bottle.",
      });
      db.insert('Words', {
        'word': "Include",
        'example_sentence': "The price includes shipping cost.",
      });
      db.insert('Words', {
        'word': "Continue",
        'example_sentence': "He was unable to continue with his job.",
      });
      db.insert('Words', {
        'word': "Set",
        'example_sentence': "She set the flowers on the table.",
      });
      db.insert('Words', {
        'word': "Later",
        'example_sentence': "I’ll finish it later.",
      });
      db.insert('Words', {
        'word': "Community",
        'example_sentence': "It caused problems for the wider community.",
      });
      db.insert('Words', {
        'word': "Name",
        'example_sentence': "What’s your name?",
      });
      db.insert('Words', {
        'word': "Five",
        'example_sentence':
            "I can give you five reasons why you should learn English.",
      });
      db.insert('Words', {
        'word': "Once",
        'example_sentence': "You only live once.",
      });
      db.insert('Words', {
        'word': "White",
        'example_sentence': "He put on white shoes and made them dirty.",
      });
      db.insert('Words', {
        'word': "Least",
        'example_sentence':
            "She spends the least amount of time in the office.",
      });
      db.insert('Words', {
        'word': "President",
        'example_sentence': "He was elected president.",
      });
      db.insert('Words', {
        'word': "Learn",
        'example_sentence': "I'm learning English.",
      });
      db.insert('Words', {
        'word': "Real",
        'example_sentence': "It doesn't seem to be real.",
      });
      db.insert('Words', {
        'word': "Change",
        'example_sentence': "We wanted to change the world.",
      });
      db.insert('Words', {
        'word': "Team",
        'example_sentence': "She plays for the second team.",
      });
      db.insert('Words', {
        'word': "Minute",
        'example_sentence': "She’s laughing every minute of every day.",
      });
      db.insert('Words', {
        'word': "Best",
        'example_sentence': "This is the best pizza I have eaten.",
      });
      db.insert('Words', {
        'word': "Several",
        'example_sentence': "I tried it several times.",
      });
      db.insert('Words', {
        'word': "Idea",
        'example_sentence': "He had a brilliant idea.",
      });
      db.insert('Words', {
        'word': "Kid",
        'example_sentence': "I loved that toy when I was a kid.",
      });
      db.insert('Words', {
        'word': "Body",
        'example_sentence': "She has a beautiful body.",
      });
      db.insert('Words', {
        'word': "Information",
        'example_sentence': "I'd like to get information about the course.",
      });
      db.insert('Words', {
        'word': "Nothing",
        'example_sentence': "You have nothing more to say?",
      });
      db.insert('Words', {
        'word': "Ago",
        'example_sentence': "Mom came home 20 minutes ago.",
      });
      db.insert('Words', {
        'word': "Lead",
        'example_sentence': "He leads me to my goal.",
      });
      db.insert('Words', {
        'word': "Social",
        'example_sentence': "Rising unemployment causes many social problems.",
      });
      db.insert('Words', {
        'word': "Understand",
        'example_sentence': "I didn't understand properly what she said.",
      });
      db.insert('Words', {
        'word': "Whether",
        'example_sentence': "I'll see whether she's at home.",
      });
      db.insert('Words', {
        'word': "Watch",
        'example_sentence': "I watched a man with an expensive watch.",
      });
      db.insert('Words', {
        'word': "Together",
        'example_sentence': "We can move this table together.",
      });
      db.insert('Words', {
        'word': "Follow",
        'example_sentence':
            "I don't follow many celebrities on Instagram anymore.",
      });
      db.insert('Words', {
        'word': "Parent",
        'example_sentence': "My parents care very much about me.",
      });
      db.insert('Words', {
        'word': "Stop",
        'example_sentence': "Please stop the car.",
      });
      db.insert('Words', {
        'word': "Face",
        'example_sentence': "He had a big smile on his face.",
      });
      db.insert('Words', {
        'word': "Anything",
        'example_sentence': "Have you anything to say?",
      });
      db.insert('Words', {
        'word': "Create",
        'example_sentence': "Artists need space to create.",
      });
      db.insert('Words', {
        'word': "Public",
        'example_sentence': "I never use public toilets.",
      });
      db.insert('Words', {
        'word': "Already",
        'example_sentence': "I never use public toilets.",
      });
      db.insert('Words', {
        'word': "Speak",
        'example_sentence': "Could you speak a little louder?",
      });
      db.insert('Words', {
        'word': "Others",
        'example_sentence': "You have to tell the others what happened.",
      });
      db.insert('Words', {
        'word': "Read",
        'example_sentence': "What newspapers or magazines do you read?",
      });
      db.insert('Words', {
        'word': "Level",
        'example_sentence': "You need to lower your blood sugar level.",
      });
      db.insert('Words', {
        'word': "Allow",
        'example_sentence': "Do you allow your kids to play outside the house?",
      });
      db.insert('Words', {
        'word': "Add",
        'example_sentence': "Add the flour to the eggs, stirring continuously.",
      });
      db.insert('Words', {
        'word': "Office",
        'example_sentence': "Welcome to my office.",
      });
      db.insert('Words', {
        'word': "Spend",
        'example_sentence': "How much do you spend on food?",
      });
      db.insert('Words', {
        'word': "Door",
        'example_sentence': "Did you lock the door?",
      });
      db.insert('Words', {
        'word': "Health",
        'example_sentence': "Smoking is bad for your health.",
      });
      db.insert('Words', {
        'word': "Person",
        'example_sentence': "She's a very nice person.",
      });
      db.insert('Words', {
        'word': "Sure",
        'example_sentence':
            "You can't be sure that this will never happen again.",
      });
      db.insert('Words', {
        'word': "War",
        'example_sentence': "The two countries had been at war for six years.",
      });
      db.insert('Words', {
        'word': "History",
        'example_sentence': "I teach history at a local school.",
      });
      db.insert('Words', {
        'word': "Party",
        'example_sentence': "Are you going to her party tonight?",
      });
      db.insert('Words', {
        'word': "Within",
        'example_sentence': "Sold out within two hours.",
      });
      db.insert('Words', {
        'word': "Grow",
        'example_sentence': "Hair grows 1 cm per month.",
      });
      db.insert('Words', {
        'word': "Result",
        'example_sentence':
            "Wieża zawaliła się w wyniku naruszenia bezpieczeństwa.",
      });
      db.insert('Words', {
        'word': "Open",
        'example_sentence': "Leave the door open.",
      });
      db.insert('Words', {
        'word': "Morning",
        'example_sentence': "It’s such a beautiful morning!",
      });
      db.insert('Words', {
        'word': "Walk",
        'example_sentence': "Let's go for a walk.",
      });
      db.insert('Words', {
        'word': "Reason",
        'example_sentence':
            "The only reason she comes here is to read the paper.",
      });
      db.insert('Words', {
        'word': "Low",
        'example_sentence': "I need a low sum of money.",
      });
      db.insert('Words', {
        'word': "Win",
        'example_sentence': "He wants to win a tennis tournament.",
      });
      db.insert('Words', {
        'word': "Research",
        'example_sentence': "She carried out some research on pollution.",
      });
      db.insert('Words', {
        'word': "Girl",
        'example_sentence': "This girl is so beautiful.",
      });
      db.insert('Words', {
        'word': "Guy",
        'example_sentence': "He is a nice guy.",
      });
      db.insert('Words', {
        'word': "Early",
        'example_sentence': "She went home 20 minutes early.",
      });
      db.insert('Words', {
        'word': "Food",
        'example_sentence': "We need food and water.",
      });
      db.insert('Words', {
        'word': "Moment",
        'example_sentence': "We had to wait until the right moment came.",
      });
      db.insert('Words', {
        'word': "Himself",
        'example_sentence': "He bought himself a new bike.",
      });
      db.insert('Words', {
        'word': "Air",
        'example_sentence': "He celebrated by tossing his hat high in the air.",
      });
      db.insert('Words', {
        'word': "Teacher",
        'example_sentence': "She works as a teacher in a primary school.",
      });
      db.insert('Words', {
        'word': "Force",
        'example_sentence': "He was thrown backward by the force of the explosion.",
      });
      db.insert('Words', {
        'word': "Offer",
        'example_sentence': "She put him an offer he could not refuse.",
      });
      db.insert('Words', {
        'word': "Enough",
        'example_sentence': "Is there enough pizza for everyone?",
      });
      db.insert('Words', {
        'word': "Education",
        'example_sentence': "The lack of education prevented him from finding a better-paid job.",
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
