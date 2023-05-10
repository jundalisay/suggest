import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int? score;
  final VoidCallback? callBackHandler;
  // const Result({required this.score, required this.callBackHandler});
  Result({this.score, this.callBackHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.red),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),         
        title: Text("Result",
          style: Theme.of(context).textTheme.headline6
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ), 
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(
              //   imgs[score],
              //   height: 200,
              //   width: 200,
              // ),
              SizedBox(height: 20),
              Text(score.toString() + "/10" , style: TextStyle(fontSize: 24),),
              // Button(
              //   text: 'Retry',
              //   callBackHandler: callBackHandler,
              // ),
              SizedBox(height: 200),
            ]
          ),
        ),
      ),
    );
  }
}


    // const List<String> imgs = [
    //   'assets/1.jpg',
    //   'assets/2.jpg',
    //   'assets/3.jpg',
    //   'assets/4.jpg',
    //   'assets/5.jpg',
    //   'assets/6.jpg',
    //   'assets/7.jpg',
    //   'assets/8.jpg',
    //   'assets/9.jpg',
    //   'assets/0.jpg',                  
    // ];

    