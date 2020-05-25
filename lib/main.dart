import 'package:flutter/cupertino.dart';
import 'MyButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAns = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.yellow),
        ),
        backgroundColor: Colors.green[500],
      ),
      backgroundColor: Colors.green[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                        color: isOperator(userQuestion)
                            ? Colors.black
                            : Colors.purple,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAns,
                      style: TextStyle(
                        fontSize: 45.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: ((BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.red[200]
                          : Colors.green[200],
                      textColor: isOperator(buttons[index])
                          ? Colors.blue
                          : Colors.pink,
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAns = '';
                        });
                      },
                    );
                    //Delete Button
                  } else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.red[200]
                          : Colors.green[200],
                      textColor: isOperator(buttons[index])
                          ? Colors.blue
                          : Colors.pink,
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                    );
                    //Equal Button and Ans Button
                  } else if (index == buttons.length - 1 || index == buttons.length - 2) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.red[200]
                          : Colors.green[200],
                      textColor: isOperator(buttons[index])
                          ? Colors.blue
                          : Colors.pink,
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                    );
                  }
                  return MyButton(
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.red[200]
                        : Colors.green[200],
                    textColor:
                        isOperator(buttons[index]) ? Colors.black : Colors.pink,
                    buttonTapped: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed(){

    String question = userQuestion;
    Parser p =Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAns = eval.toString();
  }

}
