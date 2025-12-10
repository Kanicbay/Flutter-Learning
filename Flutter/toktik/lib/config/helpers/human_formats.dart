import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadbleNumer(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formattedNumber;
  }
}
