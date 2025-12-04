import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Color.fromARGB(255, 7, 94, 84),
];

const List<Color> _secondaryColorTheme = [
  const Color.fromARGB(255, 71, 91, 101),
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  AppTheme({this.selectedColor = 0, this.darkMode = false})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
        'Colors must be between 0 and ${_colorThemes.length}',
      );

  ThemeData theme() {
    Color baseColor = _colorThemes[selectedColor];
    Color secondaryColor = _secondaryColorTheme[0];

    return darkMode == true
        ? ThemeData(
            colorScheme:
                ColorScheme.fromSeed(
                  seedColor: baseColor,
                  brightness: Brightness.dark,
                ).copyWith(
                  primary: baseColor,
                  onPrimary: Colors.white,
                  secondary: secondaryColor,
                ),
          )
        : ThemeData(colorSchemeSeed: baseColor, brightness: Brightness.light);
  }
}
