import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var questions = [
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

   void _answerQuestion(int score) {
     // var aBool = true;
     // aBool = false;
     _totalScore += score;

     setState(() {
       _qIndex = _qIndex + 1;
     });

    print(_qIndex);

    if(_qIndex < _questions.length) {
      print('We have more questions!');
    }else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {


    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _qIndex < _questions.length ?
            Quiz(
              answerQuestion: _answerQuestion,
              qIndex: _qIndex,
              questions: _questions,
            )
            : Result(_totalScore, _resetQuiz),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Text(questions[_qIndex],),
        //     Question(
        //       questions[_qIndex]['questionText'] as String,
        //     ),
        //     ...(questions[_qIndex]['answers'] as List<String>).map((answer) {
        //       return Answer(_answerQuestion, answer);
        //     }).toList()
            // RaisedButton(
            //   child: Text('Answer 1'),
            //   onPressed: _answerQuestion,
            // ),
            // RaisedButton(
            //   child: Text('Answer 2'),
            //   onPressed: () => print('Answer 2 chosen!'),
            // ),
            // RaisedButton(
            //   child: Text('Answer 3'),
            //   onPressed: () {
            //   // ...
            //   print('Answer 3 chosen');
            // },),
        //   ],
        // )
        //
        //     : Center(
        //   child: Text('you did it!'),
        // ),
      ),
    );
  }
}