import 'package:intl/intl.dart';

class RegularizeHelper {
  static String doubleToRealCurrency({required double value}) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
  }

  static double stringRealCurrencyToDouble(String value) {
    if (value == '') return 0.0;
    var newValue = value.replaceAll('.', '').replaceAll(',', '.');
    return double.parse(newValue);
  }

  static String removeAccents(String text) {
    const String withAccent = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
    const String noAccent = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";

    for (var i = 0; i < withAccent.length; i++) {
      text = text.replaceAll(withAccent[i], noAccent[i]);
    }
    return text;
  }
}
