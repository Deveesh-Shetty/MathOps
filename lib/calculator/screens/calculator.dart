import 'package:flutter/material.dart';
import 'package:calculator/calculator/widgets/keyButton.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // __number stores the intermediate number if the user is
  // entering multidigit number which he will....

  String result = '0';
  String? firstNumber;
  String? __number;
  String? secondNumber;
  String? operator;

  double? firstNumberVal;
  double? secondNumberVal;
  double? resultVal;

  bool firstNumberHasDecimal = false;
  bool secondNumberHasDecimal = false;

  int precision = 4;

  @override
  void dispose() {
    super.dispose();
  }

  void onButtonClick(var character) {
    if (character == '=') {
      setState(() {
        if (firstNumber == null || secondNumber == null) return;

        double firstNumberVal = double.parse(firstNumber!);
        double secondNumberVal = double.parse(secondNumber!);

        if (operator == '+') {
          resultVal = firstNumberVal + secondNumberVal;
        } else if (operator == '-') {
          resultVal = firstNumberVal - secondNumberVal;
        } else if (operator == 'x') {
          resultVal = firstNumberVal * secondNumberVal;
        } else if (operator == '/') {
          resultVal = firstNumberVal / secondNumberVal;
        } else if (operator == '%') {
          resultVal = (firstNumberVal * secondNumberVal) / 100;
        }

        setState(() {
          // Below statement means that we can continue the next operation
          // once user presses '=' by taking previous result as first number
          firstNumber = resultVal.toString();
          operator = null;
          secondNumber = null;
        });
      });

      return;
    }

    if (character == 'bksp') {
      return setState(() {
        if (firstNumber == null) {
          return;
        } else if (secondNumber == null) {
          // Basically removing the last digit by dividing by 10
          // and then removing the decimal by floor()
          return setState(() {
            firstNumber = (double.parse(firstNumber!) / 10).floor().toString();
            // If we delete all the numbers it shld show preceeding 0
            if (firstNumber == '0') firstNumber = null;
          });
        } else {
          return setState(() {
            secondNumber =
                (double.parse(secondNumber!) / 10).floor().toString();
            if (secondNumber == '0') secondNumber = null;
          });
        }
      });
    }

    if (character == '.') {
      if (firstNumber == null) return;
      return setState(() {
        if (operator == null && !firstNumberHasDecimal) {
          firstNumberHasDecimal = true;
          firstNumber = '$firstNumber.';
          return;
        }
        if (operator != null && !secondNumberHasDecimal) {
          secondNumberHasDecimal = true;
          secondNumber = '$secondNumber.';
        }
        return;
      });
    }

    if (character.runtimeType == String) {
      if (character == '.') return;
      if (firstNumber == null) return;

      return setState(() {
        operator = character;
      });
    }

    if (character.runtimeType == int) {
      if (operator == null) {
        return setState(() {
          // If the user wants to enter multidigit then we are
          // multipling the previous number with 10 and adding the new digit
          __number = character.toString();
          firstNumber =
              firstNumber == null ? __number : '$firstNumber$__number';
        });
      }
      if (firstNumber != null) {
        return setState(() {
          __number = character.toString();
          secondNumber =
              secondNumber == null ? __number : '$secondNumber$__number';
        });
      }
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: Color.fromRGBO(20, 20, 20, 1),
          width: width,
          height: height * 0.35,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    (() {
                      if (firstNumber == null) {
                        return '';
                      }
                      if (operator == null) {
                        return '$firstNumber';
                      }
                      if (secondNumber == null) {
                        return '$firstNumber $operator';
                      }
                      return '$firstNumber $operator $secondNumber';
                    })(),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 48,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      // If the result is null then 0 else
                      // If the result has .0 then remove it else print
                      // with precision which is mentioned
                      resultVal == null
                          ? '0'
                          : resultVal!.toStringAsFixed(
                              resultVal!.truncateToDouble() == resultVal
                                  ? 0
                                  : precision),
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 96,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: width,
            height: height * 0.65,
            child: Column(
              children: [
                // Row 1
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      KeyButton(
                        text: 'AC',
                        onClick: () {
                          setState(() {
                            result = '0';
                            resultVal = 0.0;
                            firstNumber = null;
                            secondNumber = null;
                            operator = null;
                            firstNumberHasDecimal = false;
                            secondNumberHasDecimal = false;
                          });
                        },
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onButtonClick('bksp');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(35),
                            shape: CircleBorder(),
                            elevation: 6,
                            shadowColor: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          child: Icon(
                            Icons.backspace,
                          ),
                        ),
                      ),
                      KeyButton(
                        text: '%',
                        onClick: () {
                          onButtonClick('%');
                        },
                      ),
                      KeyButton(
                        text: '/',
                        onClick: () {
                          onButtonClick('/');
                        },
                      ),
                    ],
                  ),
                ),

                // Row 2
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      KeyButton(
                        text: '7',
                        onClick: () {
                          onButtonClick(7);
                        },
                      ),
                      KeyButton(
                        text: '8',
                        onClick: () {
                          onButtonClick(8);
                        },
                      ),
                      KeyButton(
                        text: '9',
                        onClick: () {
                          onButtonClick(9);
                        },
                      ),
                      KeyButton(
                        text: 'x',
                        onClick: () {
                          onButtonClick('x');
                        },
                      ),
                    ],
                  ),
                ),

                // Row 3
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      KeyButton(
                        text: '4',
                        onClick: () {
                          onButtonClick(4);
                        },
                      ),
                      KeyButton(
                        text: '5',
                        onClick: () {
                          onButtonClick(5);
                        },
                      ),
                      KeyButton(
                        text: '6',
                        onClick: () {
                          onButtonClick(6);
                        },
                      ),
                      KeyButton(
                        text: '-',
                        onClick: () {
                          onButtonClick('-');
                        },
                      ),
                    ],
                  ),
                ),

                // Row 4
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      KeyButton(
                        text: '1',
                        onClick: () {
                          onButtonClick(1);
                        },
                      ),
                      KeyButton(
                        text: '2',
                        onClick: () {
                          onButtonClick(2);
                        },
                      ),
                      KeyButton(
                        text: '3',
                        onClick: () {
                          onButtonClick(3);
                        },
                      ),
                      KeyButton(
                        text: '+',
                        onClick: () {
                          onButtonClick('+');
                        },
                      ),
                    ],
                  ),
                ),

                // Row 5
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      KeyButton(
                        text: 'C',
                        onClick: () {
                          setState(() {
                            if (firstNumber != null) {
                              firstNumber = null;
                              firstNumberHasDecimal = false;
                              return;
                            }
                            if (secondNumber != null) {
                              secondNumber = null;
                              secondNumberHasDecimal = false;
                              return;
                            }
                          });
                        },
                      ),
                      KeyButton(
                        text: '0',
                        onClick: () {
                          onButtonClick(0);
                        },
                      ),
                      KeyButton(
                        text: '.',
                        onClick: () {
                          onButtonClick('.');
                        },
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onButtonClick('=');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: EdgeInsets.all(25),
                            textStyle: TextStyle(
                              fontSize: 35,
                            ),
                            shape: CircleBorder(),
                            elevation: 6,
                            shadowColor: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          child: Text('='),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
