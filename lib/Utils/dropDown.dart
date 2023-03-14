// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// const List<String> list = <String>['License Type', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  DropdownButtonExample({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  // String dropdownValue = "LicenseType";

  @override
  Widget build(BuildContext context) {
    String? dropdownValue = widget.list.first;

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value),
            ),
          ),
        );
      }).toList(),
    );
  }
}
