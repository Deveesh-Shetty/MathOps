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

class CalculatorState extends ChangeNotifier {
  var count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var calculatorState = context.watch<CalculatorState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Counter',
            style: theme.textTheme.headlineLarge,
          ),
          Text(
            '${calculatorState.count}',
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  calculatorState.increment();
                },
                shape: CircleBorder(),
                color: theme.colorScheme.primaryContainer,
                textColor: theme.colorScheme.onPrimaryContainer,
                padding: EdgeInsets.all(10),
                child: Icon(Icons.add),
              ),
              MaterialButton(
                onPressed: () {
                  calculatorState.decrement();
                },
                shape: CircleBorder(),
                color: theme.colorScheme.primaryContainer,
                textColor: theme.colorScheme.onPrimaryContainer,
                padding: EdgeInsets.all(10),
                child: Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavigationIndex = 1;

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
