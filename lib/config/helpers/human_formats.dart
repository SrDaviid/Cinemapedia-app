import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formatterNumber;
  }
}

String getDayOfWeek() {
  DateTime now = DateTime.now();
  String dayOfWeek = DateFormat('EEEE').format(now);
  String dayOfMonth = DateFormat('d').format(now);
  return '$dayOfWeek  $dayOfMonth';
}

String getMonth() {
  DateTime now = DateTime.now();
  String actualMonth = DateFormat('MMMM').format(now);
  return actualMonth;
}
