import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class DarkTheme extends Notifier<bool> {
  @override
  bool build() => false;
  void toggleDark() {
    state = !state;
  }
}

class SelectedColor extends Notifier<int> {
  @override
  int build() => 0;

  void update(int index) {
    state = index;
  }
}

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkModeProvider = NotifierProvider<DarkTheme, bool>(DarkTheme.new);

// Un simple int
final selectedColorProvider = NotifierProvider<SelectedColor, int>(
  SelectedColor.new,
);

// Notifier para Theme
class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() => AppTheme();

  void toggleDarkMode(){

  }

  void changeColorIndex(int colorIndex){

  }

}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, AppTheme>(
  () => ThemeNotifier(),
);
