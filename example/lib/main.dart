import 'package:flutter/material.dart';
import 'package:idkit/idkit.dart';

void main() {
  runApp(const Widgets());
}

void timeFormatHandle() {
  /// Time formatting.
  final DateTime dateTime = DateTime(2022, 6, 12, 9, 22, 50);
  final String style1 = dateTime.format();
  debugPrint(style1); // 2022-06-12 09:22:50

  final String style2 = dateTime.format(style: 'yyyy/MM/dd hh:mm:ss');
  debugPrint(style2); // 2022/06/12 09:22:50

  final String style3 = dateTime.format(style: 'yyyy-MM-dd');
  debugPrint(style3); // 2022-06-12

  final String style4 = dateTime.format(style: 'hh:mm:ss');
  debugPrint(style4); // 09:22:50

  final String style5 = dateTime.format(style: 'yyyy-M-d');
  debugPrint(style5); // 2022-6-12

  final String style6 = dateTime.format(style: 'h:m:s');
  debugPrint(style6); // 9:22:50

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
}

void thousandsHandle() {
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
}

/// Desensitized
void desensitizedMethod() {
  /// Phone number desensitization
  final phone = '18801210283'.phoneDesensitized;
  // Handling extra spaces
  final phone1 = ' 18801210835 '.phoneDesensitized;
  final phone2 = '188 0121 0283'.phoneDesensitized;
  debugPrint('\n// Phone number desensitization');
  debugPrint(phone); // 188****0283
  debugPrint(phone1); // 188****0835
  debugPrint(phone2); // 188****0283

  /// Bank card number desensitization
  final String bank16 = '6333234433554466'.bankDesensitized;
  final String bank17 = '63332344335544661'.bankDesensitized;
  final String bank19 = '6333234433554466234'.bankDesensitized;
  debugPrint('\n// Bank card number desensitization');
  debugPrint(bank16); // **** 4466
  debugPrint(bank17); // **** 4661
  debugPrint(bank19); // **** 6234

  /// ID card number desensitization
  final String id = '411122128995160537'.idDesensitized;
  debugPrint('\n// ID card number desensitization');
  debugPrint(id); // 411122********0537
}

void phoneAndBankFormatMethod() {
  // Phone number format
  final String phone = '18702210183'.phoneFormat;
  final String phone1 = '187 3221 0183'.phoneFormat;
  final String phone2 = ' 187 42220183 '.phoneFormat;
  debugPrint('\n/// Number Formatting');
  debugPrint('// Phone number format');
  debugPrint(phone); // 187 0221 0183
  debugPrint(phone1); // 187 3221 0183
  debugPrint(phone2); // 187 4222 0183

  // Bank card number format
  final String bank16 = '6222333444455551'.bankFormat;
  final String bank17 = '62223334444555562'.bankFormat;
  final String bank19 = '6222333444455556785'.bankFormat;
  debugPrint('\n// Bank card number format');
  debugPrint(bank16); // 6222 3334 4445 5551
  debugPrint(bank17); // 6222 3334 4445 5556 2
  debugPrint(bank19); // 6222 3334 4445 5556 785
}

/// Widgets Test
class Widgets extends StatelessWidget {
  const Widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widgets Test')),
        body: Container(
          alignment: Alignment.center,
          child: const ListChoice(),
        ),
      ),
    );
  }
}

/// Color
class ColorWidget extends StatelessWidget {
  const ColorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HEX
    Color color = '#3767FE'.hexColor;
    color = '#3767FE'.color;
    Color color1 = '3707FE'.hexColor;
    color1 = '3707FE'.color;
    // AHEX
    Color color2 = '#FF37670E'.aHexColor;
    color2 = 'FF37670E'.aHexColor;
    // HEXA
    Color color3 = '#A067FEFF'.hexAColor;
    color3 = 'A067FEFF'.hexAColor;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              color: color,
            ),
            Container(
              height: 100,
              width: 100,
              color: color1,
            ),
            Container(
              height: 100,
              width: 100,
              color: color2,
            ),
            Container(
              height: 100,
              width: 100,
              color: color3,
            ),
          ],
        ),
      ),
    );
  }
}

/// Gap Test
class GapTest extends StatelessWidget {
  const GapTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 40, color: Colors.red),
        20.vGap,
        Container(height: 20, color: Colors.green),
        50.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 100, height: 20, color: Colors.red),
            100.hGap,
            Container(height: 20, width: 100, color: Colors.pink),
          ],
        )
      ],
    );
  }
}

/// Choice Widget
class ListChoice extends StatelessWidget {
  const ListChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChoiceState<String>> list = ['王二', '张三', '李四', '李四', '李四']
        .map((e) => ChoiceState(data: e))
        .toList();
    return IDKitChoice<String>.grid(
      type: ChoiceType.single,
      sources: list,
      mMaxCount: 2,
      itemBuilder: (context, data) {
        final color = data.state ? Colors.red : Colors.blue;
        return Container(
          width: 200,
          color: color,
          alignment: Alignment.center,
          child: Text(data.data ?? ''),
        );
      },
      valueCall: (_) {},
      // multipleValueCall: (_) {},
    );
  }
}
