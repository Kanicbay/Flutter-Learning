import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class DarkTheme extends Notifier<bool> {
  @override
  bool build() => false;
  void toggleDark() {
    state = !state;
  }
}

final isDarkModeProvider = NotifierProvider<DarkTheme, bool>(DarkTheme.new);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
