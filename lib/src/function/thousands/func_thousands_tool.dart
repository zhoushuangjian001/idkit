abstract class IDKitThousands {
  /// Sign bit handling.
  static Map<String, String> handleSignBit(String value) {
    late String sign = '';
    String result = value;
    if (value.startsWith(RegExp(r'^(-|\+)'))) {
      sign = value.substring(0, 1);
      result = value.substring(1);
    }
    result = result.isEmpty ? '0' : result;
    return <String, String>{'sign': sign, 'value': result};
  }

  /// String thousandths processing.
  static String handleThousands(
      String value, String symbol, int? digits, bool round) {
    final bool isRegular = RegExp(r'^\d+(\.)?(\d+)?$').hasMatch(value);
    assert(isRegular, 'String is not composed of . and 0-9.');
    String result = value;
    late String dPart = '';
    late final bool isPoint = result.contains('.');
    late bool isHandle = false;
    if (digits != null) {
      assert(!digits.isNegative, 'The fractionDigits cannot be negative.');
      if (round) {
        final double num = double.tryParse(value) ?? 0;
        result = num.toStringAsFixed(digits);
      } else {
        if (isPoint) {
          final List<String> list = result.split('.');
          result = list.first;
          dPart = list.last;
          if (dPart.length > digits) {
            dPart = dPart.substring(0, digits);
          }
          isHandle = true;
        }
      }
    }
    if (isPoint && !isHandle) {
      final List<String> list = result.split('.');
      result = list.first;
      dPart = list.last.padLeft(digits ?? 0, '0');
    }
    if (result.length > 3) {
      final List<String> iPartBuffer = [];
      final Iterable<String> iPartIterable = result.split('').reversed;
      for (var i = 0; i < iPartIterable.length; i++) {
        final String item = iPartIterable.elementAt(i);
        if (i % 3 == 0 && i != 0) {
          iPartBuffer.add(symbol);
        }
        iPartBuffer.add(item);
      }
      result = iPartBuffer.reversed.join();
    }
    return dPart.isEmpty ? result : '$result.$dPart';
  }
}
