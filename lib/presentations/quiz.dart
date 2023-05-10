import 'package:flutter/material.dart';
import 'package:suggest/questions.dart';
import 'package:suggest/models/question.dart';
import 'package:suggest/presentations/quizresult.dart';



class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {

  List<QuestionModel> questions = []; // Using the literal syntax
  // List<QuestionModel> questions = new List<QuestionModel>();
  int index = 0;
  int points = 0;
  int correct = 0;
  int incorrect = 0;

  late AnimationController _controller;

  Animation? animation;

  double beginAnim = 0.0;

  double endAnim = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    questions = getQuestions();

    _controller = AnimationController(
      duration: const Duration(seconds: 10), 
      vsync: this
    );
    animation = Tween(begin: beginAnim, end: endAnim).animate(_controller)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      }
    );

    startProgress();

    animation!.addStatusListener((AnimationStatus animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        if (index < questions.length - 1) {
          index++;
          resetProgress();
          startProgress();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Result(
              score: points
              // totalQuestion: questions.length,
              // correct: correct,
              // incorrect: incorrect,
              )
            )
          );
        }
      }
    });
  }

  startProgress() {
    _controller.forward();
  }

  stopProgress() {
    _controller.stop();
  }

  resetProgress() {
    _controller.reset();
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                    score: points
                    // totalQuestion: questions.length,
                    // correct: correct,
                    // incorrect: incorrect,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Is this part of a Planetary Health Diet?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${index + 1}/${questions.length}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Question",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$points",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              questions[index].getQuestion() + "?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: LinearProgressIndicator(
              value: animation!.value,
            )),
            Image.asset(questions[index].getImageUrl(), fit: BoxFit.cover),
            // CachedNetworkImage(imageUrl: questions[index].getImageUrl(),),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (questions[index].getAnswer() == "True") {
                        setState(() {
                          points = points + 20;
                          nextQuestion();
                          correct++;
                        });
                      } else {
                        setState(() {
                          points = points - 5;
                          nextQuestion();
                          incorrect++;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "True",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (questions[index].getAnswer() == "False") {
                        setState(() {
                          points = points + 20;
                          nextQuestion();
                          correct++;
                        });
                      } else {
                        setState(() {
                          points = points - 5;
                          nextQuestion();
                          incorrect++;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "False",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
