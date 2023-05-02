import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightConverterState extends StatefulWidget {
  const WeightConverterState({super.key});

  @override
  State<StatefulWidget> createState() => _WeightConverter();
}

class _WeightConverter extends State<WeightConverterState> {
  final textController = TextEditingController();
  String dropDownValue = 'Option 1';

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: 'Enter the weight',
                      label: Text('Weight'),
                      icon: FaIcon(FontAwesomeIcons.weightHanging),
                    ),
                    onSubmitted: (String value) {
                      print('The text is $value');
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                DropdownButton(
                  value: dropDownValue,
                  underline: Container(),
                  items: ['Option 1', 'Option 2', 'Option 3', 'Option 4']
                      .map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                print(textController.text);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
