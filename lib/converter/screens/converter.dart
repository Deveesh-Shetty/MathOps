import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/socials_icon.dart';
import 'package:calculator/converter/widgets/Converters/weight_converter.dart';
import 'package:calculator/converter/widgets/Converters/volume_converter.dart';
import 'package:calculator/converter/widgets/Converters/memory_converter.dart';
import 'package:calculator/converter/widgets/Converters/length_converter.dart';
import 'package:calculator/converter/widgets/Converters/temperature_converter.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<StatefulWidget> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  int selectedIndex = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = WeightConverterState();
        break;
      case 1:
        page = VolumeConverterState();
        break;
      case 2:
        page = LengthConverterState();
        break;
      case 3:
        page = TemperatureConverterState();
        break;
      case 4:
        page = MemoryConverterState();
        break;
      case 5:
        page = Placeholder();
        break;
      case 6:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        title: Text('Converter'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('deveeshshetty@gmail.com'),
            accountName: Text('Deveesh Shetty'),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'assets/images/Deveesh-Shetty.jpg',
              ),
            ),
            otherAccountsPictures: [
              SocialsIcon(
                  theme: theme,
                  url: 'https://github.com/Deveesh-Shetty',
                  icon: FontAwesomeIcons.github),
              SocialsIcon(
                  theme: theme,
                  url: 'https://www.linkedin.com/in/deveesh-shetty-908539214',
                  icon: FontAwesomeIcons.linkedin),
              SocialsIcon(
                  theme: theme,
                  url: 'https://twitter.com/shettydeveesh',
                  icon: FontAwesomeIcons.twitter),
            ],
            otherAccountsPicturesSize: Size(24, 24),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 0;
            }),
            leading: FaIcon(FontAwesomeIcons.weightHanging),
            selected: selectedIndex == 0,
            title: Text('Weight'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 1;
            }),
            selected: selectedIndex == 1,
            leading: FaIcon(FontAwesomeIcons.glassWaterDroplet),
            title: Text('Volume'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 2;
            }),
            selected: selectedIndex == 2,
            leading: FaIcon(FontAwesomeIcons.ruler),
            title: Text('Length'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 3;
            }),
            selected: selectedIndex == 3,
            leading: FaIcon(FontAwesomeIcons.temperatureHigh),
            title: Text('Temperature'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 4;
            }),
            selected: selectedIndex == 4,
            leading: FaIcon(FontAwesomeIcons.memory),
            title: Text('Memory'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 5;
            }),
            selected: selectedIndex == 5,
            leading: FaIcon(FontAwesomeIcons.creativeCommonsZero),
            title: Text('Numeral System'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 6;
            }),
            selected: selectedIndex == 6,
            leading: FaIcon(FontAwesomeIcons.weightScale),
            title: Text('BMI'),
          ),
          AboutListTile(
            applicationName: 'CalConverter',
            icon: Icon(Icons.info),
            applicationIcon: FaIcon(FontAwesomeIcons.calculator),
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2023 Deveesh Shetty',
          ),
        ],
      ),
      drawerScrimColor: Color.fromRGBO(0, 0, 0, 0.5),
      body: Container(child: page),
    );
  }
}
