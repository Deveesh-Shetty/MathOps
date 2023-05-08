import 'package:calculator/converter/utils/bmi_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMICalculatorState extends StatefulWidget {
  const BMICalculatorState({super.key});

  @override
  State<StatefulWidget> createState() => _BMICalculator();
}

class _BMICalculator extends State<BMICalculatorState> {
  double? bmi_value;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
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
              TextField(
                controller: heightController,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  // Allowing only numbers and decimal places upto 6 terms after decimal
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,6}'))
                ],
                decoration: InputDecoration(
                  hintText: 'Enter your Height in centimeters',
                  label: Text('Height (cm)'),
                  icon: FaIcon(FontAwesomeIcons.ruler),
                ),
                onSubmitted: (String value) {
                  print('The text is $value');
                },
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  // Allowing only numbers and decimal places upto 6 terms after decimal
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,6}'))
                ],
                decoration: InputDecoration(
                  hintText: 'Enter your Weight in kilogram',
                  label: Text('Weight (kg)'),
                  icon: FaIcon(FontAwesomeIcons.weightScale),
                ),
                onSubmitted: (String value) {
                  print('The text is $value');
                },
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 500,
                child: TextButton(
                  onPressed: () {
                    // If the textboxes are empty dont calculate
                    if (weightController.text == "" ||
                        heightController.text == "") return;

                    setState(() {
                      bmi_value = calculateBMI(
                          double.parse(heightController.text),
                          double.parse(weightController.text));
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('Calculate'),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${bmi_value?.toStringAsFixed(1) ?? ""} \t \t ${getBMIInfo(bmi_value!)}',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
