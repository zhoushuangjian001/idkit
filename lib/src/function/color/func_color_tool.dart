import 'package:flutter/material.dart';

extension IDKitStringColor on String {
  /// Hex string directly to color.
  ///
  /// Avoid users copying hexadecimal values that cannot be used directly.
  Color get color => hexColor;
  Color get hexColor {
    assert(isNotEmpty, 'Conversion string cannot be empty.');
    String value = this;
    if (value.contains(' ')) {
      value = replaceAll(' ', '');
    }
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    assert(value.length == 6,
        'The length of the string is illegal, the legal length is 6.');
    return Color(int.parse(value, radix: 16) + 0xFF000000);
  }

  /// AHex string directly to color.
  ///
  /// Avoid users copying hexadecimal values that cannot be used directly.
  Color get aHexColor {
    assert(isNotEmpty, 'Conversion string cannot be empty.');
    String value = this;
    if (value.contains(' ')) {
      value = replaceAll(' ', '');
    }
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    assert(value.length == 8,
        'The length of the string is illegal, the legal length is 8.');
    return Color(int.parse(value, radix: 16));
  }

  /// HexA string directly to color.
  ///
  /// Avoid users copying hexadecimal values that cannot be used directly.
  Color get hexAColor {
    assert(isNotEmpty, 'Conversion string cannot be empty.');
    String value = this;
    if (value.contains(' ')) {
      value = replaceAll(' ', '');
    }
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    assert(value.length == 8,
        'The length of the string is illegal, the legal length is 8.');
    final String left = value.substring(0, 6);
    final String right = value.substring(6, 8);
    return Color(int.parse(right + left, radix: 16));
  }
}
