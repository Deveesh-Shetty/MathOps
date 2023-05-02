import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/socials_icon.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<StatefulWidget> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            leading: FaIcon(FontAwesomeIcons.weightScale),
            title: Text('BMI'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 3;
            }),
            selected: selectedIndex == 3,
            leading: FaIcon(FontAwesomeIcons.creativeCommonsZero),
            title: Text('Numeral System'),
          ),
          ListTile(
            onTap: () => setState(() {
              selectedIndex = 4;
            }),
            selected: selectedIndex == 4,
            leading: FaIcon(FontAwesomeIcons.memory),
            title: Text('Memory'),
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
    );
  }
}
