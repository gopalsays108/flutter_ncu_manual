import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  late String label;
  late IconData iconData;
  late TextEditingController tc;
  late Function fn;

  setFunction(Function fn) {
    this.fn = fn;
  }

  TextBoxWidget({
    required String label,
    required IconData iconData,
    required TextEditingController tc,
  }) {
    this.label = label;
    this.iconData = iconData;
    this.tc = tc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (String value) {
          if (this.fn != null) {
            fn(int.parse(value));
          }
        },
        keyboardType: TextInputType.number,
        controller: tc,
        decoration: InputDecoration(
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(label),
            hintText: 'Type $label'),
      ),
    );
  }
}
