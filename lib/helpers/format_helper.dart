import 'package:intl/intl.dart';

class FormatHelper {
  String toCurrencyVnd(dynamic price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(
        locale: 'vi_VN', name: null, decimalDigits: null);
    return numberFormat.format(price);
  }
}

final formatHelper = FormatHelper();
