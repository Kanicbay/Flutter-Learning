import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkTheme extends Notifier<bool> {
  @override
  bool build() => false;
  void toggleDark() {
    state = !state;
  }
}

final isDarkModeProvider = NotifierProvider<DarkTheme, bool>(DarkTheme.new);
