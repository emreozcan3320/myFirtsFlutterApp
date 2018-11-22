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

  Question currentQuestion;

  Quiz quiz = new Quiz([
    new Question("Elon Mask is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awsome", true),
    new Question("People are mercyles", true),
    new Question("Life is not fair", true)
  ]);

   String questionText;
   int questionNumber;
   bool isCorrect;
   bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }
  void handleAnswer(bool answer){
    isCorrect = ( currentQuestion.answer == answer ) ;
    print (isCorrect) ;
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }


  @override
  Widget build (BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new  Column( //This is our main page 
          children: <Widget>[
            new AnswerButton(true,() => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          (){
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container()
      ],
    );
  }

}