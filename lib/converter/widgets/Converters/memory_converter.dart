import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/converter/widgets/text_and_dropdown.dart';
import 'package:calculator/converter/lib/converter_function.dart';

class MemoryConverterState extends StatefulWidget {
  const MemoryConverterState({super.key});

  @override
  State<StatefulWidget> createState() => _MemoryConverter();
}

class _MemoryConverter extends State<MemoryConverterState> {
  final List<String> weighingUnitsList = [
    'PetaByte (PB)',
    'TeraByte (TB)',
    'GigaByte (GB)',
    'MegaByte (MB)',
    'KiloByte (KB)',
    'Byte (B)',
    'Nibble (n)',
    'Bit (b)'
  ];

  // Taking Kilogram in reference
  String referenceUnit = 'MegaByte (MB)';

  final TextEditingController fromTextController = TextEditingController();
  final TextEditingController toTextController = TextEditingController();

  // Default Values
  String fromDropdownValue = 'MegaByte (MB)';
  String toDropdownValue = 'GigaByte (GB)';

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
                  hintText: 'Enter the memory size',
                  label: Text('Memory Size'),
                  icon: FaIcon(FontAwesomeIcons.memory),
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
                  label: Text('Memory Size'),
                  icon: FaIcon(FontAwesomeIcons.memory),
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
