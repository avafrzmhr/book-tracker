import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({super.key});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  var dropDownValue = 'Read';
    var items = [
      'Read',
      'Currently reading',
      'Want to read',
    ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        elevation: 1,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
        value: dropDownValue,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
          if(newValue == 'Read') {
            
          }
        });
  }
}
