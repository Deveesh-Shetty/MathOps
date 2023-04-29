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
    return ChangeNotifierProvider(
      create: (context) => CalculatorState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CalculatorState extends ChangeNotifier {
  var result = 0;
  var firstNumber = 0;
  var secondNumber = 0;
  String operator = '+';

  // var query = firstNumber + operator + secondNumber;

  void increment() {
    result++;
    notifyListeners();
  }

  void decrement() {
    result--;
    notifyListeners();
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = 0;
  var firstNumber = 0;
  var secondNumber = 0;
  var operator = '+';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var calculatorState = context.watch<CalculatorState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: Color.fromRGBO(20, 20, 20, 1),
          width: width,
          height: height * 0.35,
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$firstNumber $operator $secondNumber',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    fontSize: 48,
                  ),
                ),
                Text(
                  '$result',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 96,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            child: Column(
              children: [
                // Row 1
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

                // Row 2
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

                // Row 3
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
    var theme = Theme.of(context);
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClick();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25),
          textStyle: TextStyle(
            fontSize: 35,
          ),
          shape: CircleBorder(),
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
