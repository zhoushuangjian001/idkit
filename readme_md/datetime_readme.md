## Introduce
The main function described below is to format the given time. The functions include: time conventional format processing, time friendly format processing, judging time is the day of the week, etc. At the same time, all support internationalization, mainly in English and Chinese.

## Example Display
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

## Example Test Result Screenshot
![datetime](https://github.com/zhoushuangjian001/idkit/blob/master/readme_img/datetime.png?raw=true)