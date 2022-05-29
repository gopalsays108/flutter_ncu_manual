import 'package:flutter/material.dart';
import 'package:second_app/widget/slider_widget.dart';
import 'package:second_app/widget/textbox_widget.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  _EmiState createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  int _value = 1; // in dart file
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0.0;

  takeSliderValue(int value) {
    _value = value; // scope increase
    t3.text = _value.toString();
    print('Rec Value $value');
    setState(() {});
  }

  _compute() {
    int loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    double monthlyPr = loanAmount / tenure;
    double monthlyRoi = (loanAmount * (roi / 100)) / tenure;
    emi = monthlyPr + monthlyRoi;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ///New TB
    TextBoxWidget tb =
        TextBoxWidget(label: 'Tenure', iconData: Icons.calendar_today, tc: t3);
    tb.setFunction(takeSliderValue);

    return Scaffold(
      body: Column(
        children: [
          TextBoxWidget(label: 'Loan Amount', iconData: Icons.money, tc: t1),
          TextBoxWidget(label: 'ROI', iconData: Icons.attach_money, tc: t2),
          tb,
          SliderWidget(takeSliderValue, _value),
          //pass func as arg to constructor
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepOrangeAccent),
            ),
            onPressed: _compute,
            child: Text('Compute'),
          ),
          Text("Emi $emi"),
        ],
      ),
      appBar: AppBar(
        title: Text('Emi Calculator'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
