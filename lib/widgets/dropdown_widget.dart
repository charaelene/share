import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  final List<String> items;
  final String hint;
  const DropdownExample({super.key, required this.hint, required this.items});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(canvasColor: Color.fromRGBO(94, 170, 102, 1.0)),
      child: DropdownButton<String>(
        hint: Text(
          'Add ${widget.hint}',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        value: selectedValue,
        isDense: true,
        underline: SizedBox.shrink(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items:
            widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map<Widget>((String item) {
            return Text(
              item,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
