import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAndDropDownRow extends StatelessWidget {
  const TextAndDropDownRow({
    super.key,
    required this.textController,
    required this.dropDownValue,
    required this.inputDecoration,
    required this.list,
    required this.onChange,
    required this.isResult,
  });

  final TextEditingController textController;
  final String dropDownValue;
  final InputDecoration inputDecoration;
  final List<String> list;
  final Function(String?) onChange;
  // For the result input to be readonly
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            readOnly: isResult,
            controller: textController,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // Allowing only numbers and decimal places upto 6 terms after decimal
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,6}'))
            ],
            decoration: inputDecoration,
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
          items: list.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(value),
              ),
            );
          }).toList(),
          onChanged: onChange,
        ),
      ],
    );
  }
}
