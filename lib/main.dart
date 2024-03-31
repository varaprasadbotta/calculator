import 'package:flutter/material.dart';
import 'package:practice_app/pages/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
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
      backgroundColor: Colors.cyan[50],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Q:$userQuestion",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "ANS:$userAnswer",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue),
                    ))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButtons(
                        buttontapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        color: Colors.red,
                        textcolor: Colors.white,
                        buttontext: buttons[index],
                      );
                    } else if (index == 1) {
                      return MyButtons(
                        buttontapped: () {
                          setState(() {
                            userQuestion =
                                userQuestion.substring(userQuestion.length - 1);
                          });
                        },
                        color: Colors.green,
                        textcolor: Colors.white,
                        buttontext: buttons[index],
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButtons(
                        buttontapped: () {
                          setState(() {
                            equalto();
                          });
                        },
                        color: Colors.cyan,
                        textcolor: Colors.white,
                        buttontext: buttons[index],
                      );
                    } else {
                      return MyButtons(
                        buttontapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        color: isoperator(buttons[index])
                            ? Colors.cyan
                            : Colors.cyan[100],
                        textcolor: isoperator(buttons[index])
                            ? Colors.white
                            : Colors.cyan,
                        buttontext: buttons[index],
                      );
                    }
                  })),
        ],
      ),
    );
  }

  bool isoperator(String x) {
    if (x == "%" || x == "/" || x == "+" || x == "-" || x == "*" || x == "=") {
      return true;
    } else {
      return false;
    }
  }

  void equalto() {
    String finalQuestion = userQuestion;
    finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
