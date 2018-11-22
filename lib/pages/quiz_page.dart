import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answerButton_file.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizePageState();


}

class QuizePageState extends State<QuizPage>{

  


  @override
  Widget build (BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new  Column( //This is our main page 
          children: <Widget>[
            new AnswerButton(true,() => print("You answered Ture") ),
            new QuestionText("Pizza is nice", 1),
            new AnswerButton(false, () { print("You answered False");} )
          ],
        ),
        new CorrectWrongOverlay(false)
      ],
    );
  }

}