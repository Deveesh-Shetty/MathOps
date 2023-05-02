import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/calculator/screens/calculator.dart';
import 'package:calculator/converter/screens/converter.dart';

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
      title: 'Cal Converter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavigationIndex = 1;

  @override
  void dispose() {
    super.dispose();
  }

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
        page = Conversion();
        break;
      default:
        throw UnimplementedError('No page for $bottomNavigationIndex');
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calculator),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.scaleBalanced),
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
