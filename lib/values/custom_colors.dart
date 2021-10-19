import 'package:flutter/material.dart';

class CustomColors {
  Color _gradientMainColor = Color.fromARGB(255, 141, 29, 153);
  Color _gradientSecColor = Color.fromARGB(255, 54, 4, 181);

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecundaryColor() {
    return _gradientSecColor;
  }
}
