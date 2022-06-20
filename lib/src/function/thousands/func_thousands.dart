import 'package:idkit/src/function/thousands/func_thousands_tool.dart';

extension IDKitThousandsNum on num {
  /// Numerical thousandths handling in numeric format.
  ///
  /// [symbol]
  /// Symbolic form of thousandths.
  ///
  /// [fractionDigits]
  /// Keep the number of fractional parts.
  String format({String symbol = ',', int? fractionDigits, bool round = true}) {
    String result = toString();
    return result.format(
        symbol: symbol, fractionDigits: fractionDigits, round: round);
  }
}

/// Number thousandths handling in string format.
extension IDKitThousandsString on String {
  /// Number thousandths handling in string format.
  ///
  /// [symbol]
  /// Symbolic form of thousandths.
  ///
  /// [fractionDigits]
  /// Keep the number of fractional parts.
  ///
  /// [round]
  /// True turns rounding on; False turns rounding off.
  String format({String symbol = ',', int? fractionDigits, bool round = true}) {
    String result = replaceAll(' ', '');
    final Map<String, String> map = IDKitThousands.handleSignBit(result);
    late String sign = map['sign']!;
    result = map['value']!;
    result =
        IDKitThousands.handleThousands(result, symbol, fractionDigits, round);
    return sign.isEmpty ? result : '$sign$result';
  }
}
