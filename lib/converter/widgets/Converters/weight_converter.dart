import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/text_and_dropdown.dart';
import 'package:calculator/converter/constants/weight.dart';

class WeightConverterState extends StatefulWidget {
  const WeightConverterState({super.key});

  @override
  State<StatefulWidget> createState() => _WeightConverter();
}

class _WeightConverter extends State<WeightConverterState> {
  final List<String> weighingUnitsList = [
    'Pound (lbs)',
    'Kilogram (kg)',
    'Gram (g)',
    'Tonne (t)'
  ];

  final TextEditingController fromTextController = TextEditingController();
  final TextEditingController toTextController = TextEditingController();

  String fromDropdownValue = 'Pound (lbs)';
  String toDropdownValue = 'Kilogram (kg)';

  double unitConversionValue(String unit) {
    switch (unit) {
      case 'Pound (lbs)':
        return POUND_TO_KILO;
      case 'Kilogram (kg)':
        return KILO_TO_KILO;
      case 'Gram (g)':
        return GRAM_TO_KILO;
      case 'Tonne (t)':
        return TONNE_TO_KILO;
      default:
        return -1;
    }
  }

  void convertUnit(
    double fromValue,
    String fromUnit,
    String toUnit,
  ) {
    // If both the units are same
    if (fromUnit == toUnit) {
      toTextController.text = fromValue.toString();
      return;
    }

    // Converting the fromValue to Standard Kilogram to ease the conversion
    double fromUnitInKilo = fromValue * unitConversionValue(fromUnit);

    // If the toUnit is Kilogram then return that only
    if (toUnit == 'Kilogram (kg)') {
      toTextController.text = fromUnitInKilo.toString();
      return;
    }

    // If it is something other than Kilogram
    // Basically first it gets the conversion value then it divides
    // the conversion value with the fromUnitInKilo which is calculated
    // It became easy to convert because the program is taking Kilo as reference
    double unitConversionVal = fromUnitInKilo / unitConversionValue(toUnit);
    toTextController.text = unitConversionVal.toString();
  }

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
                  hintText: 'Enter the weight',
                  label: Text('Weight'),
                  icon: FaIcon(FontAwesomeIcons.weightHanging),
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
                  hintText: 'Enter the weight',
                  label: Text('Weight'),
                  icon: FaIcon(FontAwesomeIcons.weightHanging),
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
                    convertUnit(
                      double.parse(fromTextController.text),
                      fromDropdownValue,
                      toDropdownValue,
                    );
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
