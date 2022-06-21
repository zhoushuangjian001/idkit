<p id='jump'></p>

## Introduce
The main functions introduced below are the processing of adding thousandths symbols to money, and the reservation of specified digits of money. At the same time, you can also specify whether to round off.

## Example Display
```dart
// int
debugPrint('// Int ');
debugPrint((-0).format());
debugPrint((-123).format());
debugPrint((-1234).format());
debugPrint(123456.format());
debugPrint(1234567.format());
debugPrint(123456789.format());
debugPrint(1234567890.format());
// double
debugPrint('\n// Double ');
debugPrint(0.0.format());
debugPrint(123.12.format());
debugPrint(1234.123.format());
debugPrint(123456.1234.format());
debugPrint(1234567.12345.format());
debugPrint(123456789.123456.format());
debugPrint(1234567890.1234567.format());
// // String
debugPrint('\n// String ');
debugPrint('0.0'.format());
debugPrint('123.12'.format());
debugPrint('1234.123'.format());
debugPrint('-  123456.1234'.format());
debugPrint('+ 1234567.12345 '.format());
debugPrint('-1234567 89.123456'.format());
debugPrint('+ 1234 567890.123 4567 '.format());

/// Custom thousandth symbol
debugPrint('\n// Custom thousandth symbol ');
debugPrint(1234567.format(symbol: '_'));
debugPrint(1234567890.2.format(symbol: '、'));

/// Retain a certain number of decimal places
debugPrint('\n// Retain a certain number of decimal places;Whether to round');
debugPrint(0.56.format(fractionDigits: 0));
debugPrint(0.56.format(fractionDigits: 0, round: false));
debugPrint(1234.5.format(fractionDigits: 2));
debugPrint(1234567.123490.format(fractionDigits: 4));
debugPrint(1234567.123490.format(fractionDigits: 4, round: false));
```
## Example Test Result Screenshot

![thousands](https://github.com/zhoushuangjian001/idkit/blob/master/readme_img/thousands.png?raw=true)

## Friendship Link
**[👈🏻 Return Page](https://pub.flutter-io.cn/packages/idkit)** &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[ 👆🏻 Return Top](#jump)**