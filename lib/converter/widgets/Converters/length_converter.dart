import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/text_and_dropdown.dart';
import 'package:calculator/converter/utils/converter_function.dart';

class LengthConverterState extends StatefulWidget {
  const LengthConverterState({super.key});

  @override
  State<StatefulWidget> createState() => _LengthConverter();
}

class _LengthConverter extends State<LengthConverterState> {
  final List<String> lengthUnitsList = [
    'Astronomical Unit (AU)',
    'Light Year (ly)',
    'Parsec (pc)',
    'Mile (mi)',
    'Kilometer (km)',
    'Meter (m)',
    'Centimeter (cm)',
    'Millimeter (mm)',
    'Micrometer (μm)',
    'Nanometer (nm)',
    'Angstorm (Å)',
    'Picometer (pm)',
    'Yard (yd)',
    'Foot (ft)',
    'Inch (in)',
  ];

  // Taking Meter as reference
  String referenceUnit = 'Meter (m)';

  final TextEditingController fromTextController = TextEditingController();
  final TextEditingController toTextController = TextEditingController();

  // Default Values
  String fromDropdownValue = 'Mile (mi)';
  String toDropdownValue = 'Kilometer (km)';

  @override
  void dispose() {
    fromTextController.dispose();
    toTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextAndDropDownRow(
                textController: fromTextController,
                dropDownValue: fromDropdownValue,
                inputDecoration: InputDecoration(
                  hintText: 'Enter the length',
                  label: Text('Length'),
                  icon: FaIcon(FontAwesomeIcons.rulerVertical),
                ),
                list: lengthUnitsList,
                onChange: (newValue) {
                  setState(() {
                    fromDropdownValue = newValue!;
                  });
                },
                isResult: false,
              ),
              SizedBox(
                height: 32,
              ),
              FaIcon(FontAwesomeIcons.arrowDownLong),
              TextAndDropDownRow(
                textController: toTextController,
                dropDownValue: toDropdownValue,
                inputDecoration: InputDecoration(
                  label: Text('Length'),
                  icon: FaIcon(FontAwesomeIcons.rulerVertical),
                ),
                list: lengthUnitsList,
                onChange: (newValue) {
                  setState(() {
                    toDropdownValue = newValue!;
                  });
                },
                isResult: true,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 500,
                child: TextButton(
                  onPressed: () {
                    String convertedValue = convertUnit(
                      double.parse(fromTextController.text),
                      fromDropdownValue,
                      toDropdownValue,
                      referenceUnit,
                    );

                    toTextController.text = convertedValue;
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('Convert'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
