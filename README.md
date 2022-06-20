## idkit

### Introduction
The idkit is a package that is more convenient for Flutter developers to develop. It contains functions, components, etc. that are commonly used in project development.

### Feature Catalog
[1.Handling of time.](#jump1)
[2.Money thousandths processing.](#jump2)


### Example
#### <p id='jump1'>1. Handling Of Time</p>
```dart
// Given time.
final DateTime dateTime = DateTime(2022, 6, 12, 9, 22, 50);
// 1) yyyy-MM-dd hh:mm:ss
//    2022-06-12 09:22:50
final String style1 = dateTime.format();
debugPrint(style1); // 2022-06-12 09:22:50

// 2) yyyy/MM/dd hh:mm:ss
//    2022/06/12 09:22:50
final String style2 = dateTime.format(style: 'yyyy/MM/dd hh:mm:ss');
debugPrint(style2); // 2022/06/12 09:22:50

// 3) yyyy-MM-dd
//    2022-06-12 
final String style3 = dateTime.format(style: 'yyyy-MM-dd');
debugPrint(style3); // 2022-06-12

// 4) hh:mm:ss
//    09:22:50
final String style4 = dateTime.format(style: 'hh:mm:ss');
debugPrint(style4); // 09:22:50

// 5) yyyy-M-d
//    2022-6-12 
final String style5 = dateTime.format(style: 'yyyy-M-d');
debugPrint(style5); // 2022-6-12

// 6) h:m:s
//    9:22:50 
final String style6 = dateTime.format(style: 'h:m:s');
debugPrint(style6); // :22:50

///  Custom time format.
// 7) yyyy~MM+dd hh:mm:ss
final String style7 = dateTime.format(style: 'yyyy~MM+dd hh:mm:ss');
debugPrint(style7); // 2022~06+12 hh:mm:ss

/// Friendly time formatting.
const Locale locale = Locale('zh');
// 1) Just now
final DateTime dateTime1 = DateTime.now();
debugPrint(dateTime1.friendlyFormat());
debugPrint(dateTime1.friendlyFormat(locale: locale));

// 2) Minutes ago
final DateTime dateTime2 = dateTime1.subtract(const Duration(minutes: 2));
debugPrint(dateTime2.friendlyFormat());
debugPrint(dateTime2.friendlyFormat(locale: locale));

// 3) Am & Pm
final DateTime dateTime3 = dateTime1.subtract(const Duration(minutes: 120));
debugPrint(dateTime3.friendlyFormat());
debugPrint(dateTime3.friendlyFormat(locale: locale));

// 4) Yesterday
final DateTime dateTime4 =
    dateTime1.subtract(const Duration(days: 1, hours: 4));
debugPrint(dateTime4.friendlyFormat());
debugPrint(dateTime4.friendlyFormat(locale: locale));

// 5) Day of the week
final DateTime dateTime5 =
    dateTime1.subtract(const Duration(days: 3, hours: 8));
debugPrint(dateTime5.friendlyFormat());
debugPrint(dateTime5.friendlyFormat(locale: locale));

// 6) Time of year
final DateTime dateTime6 =
    dateTime1.subtract(const Duration(days: 240, hours: 10));
debugPrint(dateTime6.friendlyFormat());
debugPrint(dateTime6.friendlyFormat(locale: locale));

// 7) Outside one year
final DateTime dateTime7 =
    dateTime1.subtract(const Duration(days: 400, hours: 12));
debugPrint(dateTime7.friendlyFormat());
debugPrint(dateTime7.friendlyFormat(locale: locale));

/// The given time is the day of the week.
final DateTime dateTime8 = DateTime(2022, 6, 12);
debugPrint(dateTime8.getWeak());
debugPrint(dateTime8.getWeak(locale: locale));

final DateTime dateTime9 = DateTime(2022, 5, 22);
debugPrint(dateTime9.getWeak());
debugPrint(dateTime9.getWeak(locale: locale));

final DateTime dateTime10 = DateTime(2022, 3, 2);
debugPrint(dateTime10.getWeak());
debugPrint(dateTime10.getWeak(locale: locale));
```
##### NOTE: Screenshot of test results
![DateTime](https://github.com/zhoushuangjian001/idkit/blob/master/readme/datetime.png?raw=true)

#### <p id='jump2'>2. Money thousandths processing</p>

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
##### NOTE: Screenshot of test results
![DateTime](https://github.com/zhoushuangjian001/idkit/blob/master/readme/datetime.png?raw=true)

## Suggest
If there is any problem in use, please contact me in time. Meanwhile, your new features or components are welcome.