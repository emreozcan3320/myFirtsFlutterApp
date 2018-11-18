import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizePageState();


}

class QuizePageState extends State<QuizPage>{
  @override
  Widget build (BuildContext context){
    return new Stack(
      children: <Widget>[
        new  Column( //This is our main page 
          children: <Widget>[
            new Expanded( //True button
              child: new Material(
                color: Colors.greenAccent,
                child: new InkWell(
                  onTap: () => print("You answered true"),
                  child: new Center(
                    child: new Container(
                      child: new Text("True"),
                    ),
                  )
                ),
              ),
            ),
            new Expanded( //False button
              child: new Material(
                color: Colors.redAccent,
                child: new InkWell(
                  onTap: () => print("You answered false"),
                  child: new Center(
                    child: new Container(
                      child: new Text("False"),
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

}