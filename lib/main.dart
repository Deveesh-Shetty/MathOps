import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int result = 0;
  int? firstNumber;
  int? secondNumber;
  String? operator;

  void onButtonClick(var character) {
    if (character.runtimeType == String) {
      if (firstNumber == null) {
        return;
      }
      return setState(() {
        operator = character;
      });
    }

    if (character.runtimeType == int) {
      if (firstNumber == null) {
        return setState(() {
          firstNumber = character;
        });
      }
      if (secondNumber == null) {
        return setState(() {
          secondNumber = character;
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
                  child: Text(
                    '$result',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 96,
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
                        text: 'C',
                        onClick: () {},
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
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
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '/',
                        onClick: () {},
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
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '8',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '9',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: 'x',
                        onClick: () {},
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
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '5',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '6',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '-',
                        onClick: () {},
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
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '2',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '3',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '+',
                        onClick: () {},
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
                        text: 'AC',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '0',
                        onClick: () {},
                      ),
                      KeyButton(
                        text: '.',
                        onClick: () {},
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
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

class KeyButton extends StatelessWidget {
  final String text;
  final Function onClick;
  const KeyButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25),
          textStyle: TextStyle(
            fontSize: 35,
          ),
          shape: CircleBorder(),
          elevation: 6,
          shadowColor: Color.fromRGBO(0, 0, 0, 1),
        ),
        child: Text(text),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    Widget page;
    switch (bottomNavigationIndex) {
      case 0:
        // Calculator();
        page = Calculator();
        break;
      case 1:
        // Converter();
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('No widget for $bottomNavigationIndex');
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale),
            label: 'Conversion',
          ),
        ],
        selectedItemColor: theme.colorScheme.primary,
        currentIndex: bottomNavigationIndex,
        onTap: (int index) {
          setState(() {
            bottomNavigationIndex = index;
          });
        },
      ),
      body: Container(
        child: page,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
