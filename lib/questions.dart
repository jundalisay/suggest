import 'package:suggest/models/question.dart';


List<QuestionModel> getQuestions(){

  List<QuestionModel> questions = []; // Using the literal syntax

  // List<QuestionModel> questions = new List<QuestionModel>();
  QuestionModel questionModel = new QuestionModel();

  //1
  questionModel.setQuestion("Ampalaya");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/vegs/ampalaya.jpg");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //2
  questionModel.setQuestion("Lechon");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/junks/lechon.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //3
  questionModel.setQuestion("Tocino");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/junks/tocino.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //4
  questionModel.setQuestion("Adidas");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/junks/grill.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //5
  questionModel.setQuestion("Rare Beef Steak");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/junks/beef.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //6
  questionModel.setQuestion("Deep Fried Chicken");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/junks/chicken.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //7
  questionModel.setQuestion("Apples");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/vegs/apples.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //8
  questionModel.setQuestion("Banana");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/vegs/banana.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  questionModel.setQuestion("Tomato");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/vegs/tomato.jpg");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  return questions;

}