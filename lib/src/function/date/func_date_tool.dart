import 'package:flutter/material.dart';

abstract class DateUnit {
  /// Time formatting.
  static String handleDateTime(DateTime dateTime, String style) {
    String result = style;
    // Year
    bool isYear = false;
    if (result.contains('yyyy') || result.contains('YYYY')) {
      final String year = dateTime.year.toString();
      result = result.replaceFirst(RegExp(r'(yyyy|YYYY)'), year);
      isYear = true;
    }
    if (!isYear) {
      if (result.contains('yy') || result.contains('YY')) {
        final String year = (dateTime.year % 100).toString();
        result = result.replaceFirst(RegExp(r'(yy|YY)'), year.padLeft(2, '0'));
      }
    }

    // Month
    late final String month = dateTime.month.toString();
    bool isMonth = false;
    if (result.contains('MM')) {
      result = result.replaceFirst(RegExp(r'(MM)'), month.padLeft(2, '0'));
      isMonth = true;
    }
    if (!isMonth) {
      if (result.contains('M')) {
        result = result.replaceFirst(RegExp(r'M'), month);
      }
    }

    // Day
    late final String day = dateTime.day.toString();
    bool isDay = false;
    if (result.contains('dd') || result.contains('DD')) {
      result = result.replaceFirst(RegExp(r'(DD|dd)'), day.padLeft(2, '0'));
      isDay = true;
    }
    if (!isDay) {
      if (result.contains('d') || result.contains('D')) {
        result = result.replaceFirst(RegExp(r'(d|D)'), day);
      }
    }

    // Hour
    late final String hour = dateTime.hour.toString();
    bool isHour = false;
    if (result.contains('hh') || result.contains('HH')) {
      result = result.replaceFirst(RegExp(r'(HH|hh)'), hour.padLeft(2, '0'));
      isHour = true;
    }
    if (!isHour) {
      if (result.contains('H') || result.contains('h')) {
        result = result.replaceFirst(RegExp(r'(H|h)'), hour);
      }
    }

    // Minute
    late final String minute = dateTime.minute.toString();
    bool isMinute = false;
    if (result.contains('mm')) {
      result = result.replaceFirst(RegExp(r'mm'), minute.padLeft(2, '0'));
      isMinute = true;
    }
    if (!isMinute) {
      if (result.contains('m')) {
        result = result.replaceFirst(RegExp(r'm'), minute);
      }
    }

    // Second
    late final String second = dateTime.second.toString();
    bool isSecond = false;
    if (result.contains('ss') || result.contains('SS')) {
      result = result.replaceFirst(RegExp(r'(ss|SS)'), second.padLeft(2, '0'));
      isSecond = true;
    }
    if (!isSecond) {
      if (result.contains('s') || result.contains('S')) {
        result = result.replaceFirst(RegExp(r'(s|S)'), second);
      }
    }
    // Result
    return result;
  }

  /// Display time in friendly format.
  static String handleFriendlyDateTime(DateTime dateTime, {Locale? locale}) {
    locale ??= const Locale.fromSubtags();
    final bool isCh = _isZh(locale);
    final DateTime curDateTime = DateTime.now();
    if (dateTime.isUtc) {
      dateTime = dateTime.toLocal();
    }
    final Duration duration = curDateTime.difference(dateTime);
    // 1.Just Recently.
    if (duration.inMinutes < 1) {
      final String result =
          isCh ? String.fromCharCodes([0x0000521A, 0x0000521A]) : 'Just now';
      return result;
    }

    // 2.Minutes ago.
    if (duration.inMinutes >= 1 && duration.inHours < 1) {
      final int minute = duration.inMinutes;
      final String mChar =
          String.fromCharCodes([0x00005206, 0x0000949F, 0x0000524D]);
      final String result = isCh ? '$minute $mChar' : '$minute minute ago';
      return result;
    }

    // 3. What time in the morning or afternoon.
    if (duration.inHours >= 1 && duration.inDays < 1) {
      final int minute = dateTime.minute;
      final String mAdd = minute.toString().padLeft(2, '0');
      final Map<String, dynamic> map = _getAmOrPm(dateTime.hour, isCh);
      final int hour = map['hour'] as int;
      final String mark = map['mark'] as String;
      final String result = isCh ? '$mark $hour:$mAdd' : '$hour:$mAdd $mark';
      return result;
    }

    // 4.What time was it yesterday.
    if (duration.inDays >= 1 && duration.inDays < 2) {
      final String yesterday =
          isCh ? String.fromCharCodes([0x00006628, 0x00005929]) : 'Yesterday';
      final int minute = dateTime.minute;
      final String mAdd = minute.toString().padLeft(2, '0');
      final Map<String, dynamic> map = _getAmOrPm(dateTime.hour, isCh);
      final int hour = map['hour'] as int;
      final String mark = map['mark'] as String;
      final String result =
          isCh ? '$yesterday $mark$hour:$mAdd' : '$hour:$mAdd $mark $yesterday';
      return result;
    }

    // 5. More than two days and less than one week.
    if (duration.inDays >= 2 && duration.inDays < 7) {
      final String weak = getWeakOfDateTime(dateTime, locale: locale);
      final int minute = dateTime.minute;
      final String mAdd = minute.toString().padLeft(2, '0');
      final Map<String, dynamic> map = _getAmOrPm(dateTime.hour, isCh);
      final int hour = map['hour'] as int;
      final String mark = map['mark'] as String;
      final String result =
          isCh ? '$weak $mark$hour:$mAdd' : '$weak $hour:$mAdd $mark ';
      return result;
    }

    // 6. Days of the month.
    late String yearCode = String.fromCharCode(0x00005E74);
    late String monthCode = String.fromCharCode(0x00006708);
    late String dayCode = String.fromCharCode(0x000065E5);
    if (duration.inDays < 365 && duration.inDays >= 7) {
      final String month = dateTime.month.toString();
      final String day = dateTime.day.toString();
      final int minute = dateTime.minute;
      final String mAdd = minute.toString().padLeft(2, '0');
      final Map<String, dynamic> map = _getAmOrPm(dateTime.hour, isCh);
      final int hour = map['hour'] as int;
      final String mark = map['mark'] as String;
      final String result = isCh
          ? '$month$monthCode$day$dayCode $mark$hour:$mAdd'
          : '$day/$month $hour:$mAdd $mark';
      return result;
    }
    // 7. Year
    if (duration.inDays >= 365) {
      final String year = dateTime.year.toString();
      final String month = dateTime.month.toString();
      final String day = dateTime.day.toString();
      final int minute = dateTime.minute;
      final String mAdd = minute.toString().padLeft(2, '0');
      final Map<String, dynamic> map = _getAmOrPm(dateTime.hour, isCh);
      final int hour = map['hour'] as int;
      final String mark = map['mark'] as String;
      final String result = isCh
          ? '$year$yearCode$month$monthCode$day$dayCode $mark$hour:$mAdd'
          : '$day/$month/$year $hour:$mAdd $mark';
      return result;
    }
    return isCh ? String.fromCharCodes([0x0000672A, 0x000077E5]) : 'und';
  }

  /// Get the day of the week.
  static String getWeakOfDateTime(DateTime dateTime, {Locale? locale}) {
    locale ??= const Locale.fromSubtags();
    final bool isCh = _isZh(locale);
    final DateTime curDateTime = dateTime.isUtc ? dateTime.toLocal() : dateTime;
    final int weekday = curDateTime.weekday;
    late String result;
    switch (weekday) {
      case 1:
        result = isCh ? String.fromCharCodes([0x00005468, 0x00004E00]) : 'Mon';
        break;
      case 2:
        result = isCh ? String.fromCharCodes([0x00005468, 0x00004E8C]) : 'Tue';
        break;
      case 3:
        result = isCh ? String.fromCharCodes([0x00005468, 0x00004E09]) : 'Wed';
        break;
      case 4:
        result = isCh ? String.fromCharCodes([0x00005468, 0x000056DB]) : 'Thu';
        break;
      case 5:
        result = isCh ? String.fromCharCodes([0x00005468, 0x00004E94]) : 'Fri';
        break;
      case 6:
        result = isCh ? String.fromCharCodes([0x00005468, 0x0000516D]) : 'Sat';
        break;
      case 7:
        result = isCh ? String.fromCharCodes([0x00005468, 0x000065E5]) : 'Sun';
        break;
      default:
        result = isCh ? String.fromCharCodes([0x0000672A, 0x000077E5]) : 'und';
    }
    return result;
  }

  static Map<String, dynamic> _getAmOrPm(int hour, bool isCh) {
    // 0-6
    late final String em =
        isCh ? String.fromCharCodes([0x000051CC, 0x00006668]) : 'AM';
    // 6-11
    late final String am =
        isCh ? String.fromCharCodes([0x00004E0A, 0x00005348]) : 'AM';
    // 11-12
    late final String no1 =
        isCh ? String.fromCharCodes([0x00004E2D, 0x00005348]) : 'AM';
    // 12-13
    late final String no2 =
        isCh ? String.fromCharCodes([0x00004E2D, 0x00005348]) : 'PM';
    // 13-16
    late final String pm =
        isCh ? String.fromCharCodes([0x00004E0B, 0x00005348]) : 'PM';
    // 16-18
    late final String ev =
        isCh ? String.fromCharCodes([0x0000508D, 0x0000665A]) : 'PM';
    // 18-24
    late final String ni =
        isCh ? String.fromCharCodes([0x0000665A, 0x00004E0A]) : 'PM';
    String mark = 'und';
    if (hour >= 0 && hour < 6) {
      mark = em;
    }
    if (hour >= 6 && hour < 11) {
      mark = am;
    }
    if (hour >= 11 && hour < 12) {
      mark = no1;
    }
    if (hour >= 12 && hour < 13) {
      mark = no2;
    }
    if (hour >= 13 && hour < 16) {
      mark = pm;
    }
    if (hour >= 16 && hour < 18) {
      mark = ev;
    }
    if (hour >= 18 && hour < 24) {
      mark = ni;
    }
    if (hour > 12) {
      hour = hour - 12;
    }
    return {'hour': hour, 'mark': mark};
  }

  static bool _isZh(Locale locale) {
    return locale.languageCode.startsWith(RegExp(r'^[zZ][hH]'));
  }
}
