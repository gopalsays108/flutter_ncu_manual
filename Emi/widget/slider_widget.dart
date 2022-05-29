import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  Function takeSlider;
  int value = 1;

  SliderWidget(this.takeSlider, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: value.toDouble(),
        min: 1,
        max: 12,
        onChanged: (double value) {
          takeSlider(value.toInt());
        },
      ),
    );
  }
}
