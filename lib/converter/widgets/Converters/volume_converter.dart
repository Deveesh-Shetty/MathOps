import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/text_and_dropdown.dart';
import 'package:calculator/converter/lib/converter_function.dart';

class VolumeConverterState extends StatefulWidget {
  const VolumeConverterState({super.key});

  @override
  State<StatefulWidget> createState() => _VolumeConverter();
}

class _VolumeConverter extends State<VolumeConverterState> {
  final List<String> weighingUnitsList = [
    'Litre (l)',
    'millilitre (ml)',
    'cubic meter (m3)',
    'cubic centimeter (cm3)',
    'gallon (g)'
  ];

  // Taking Kilogram in reference
  String referenceUnit = 'Litre (l)';

  final TextEditingController fromTextController = TextEditingController();
  final TextEditingController toTextController = TextEditingController();

  // Default Values
  String fromDropdownValue = 'gallon (g)';
  String toDropdownValue = 'Litre (l)';

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
                  hintText: 'Enter the volume',
                  label: Text('Volume'),
                  icon: FaIcon(FontAwesomeIcons.water),
                ),
                list: weighingUnitsList,
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
                  label: Text('Volume'),
                  icon: FaIcon(FontAwesomeIcons.water),
                ),
                list: weighingUnitsList,
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
