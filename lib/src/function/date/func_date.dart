import 'package:flutter/material.dart';
import 'package:idkit/src/function/date/func_date_tool.dart';

const String defaultStyle = 'yyyy-MM-dd hh:mm:ss';

extension IDKitDateTime on DateTime {
  /// Time formatting.
  String format({String style = defaultStyle}) {
    if (style.isEmpty) style = defaultStyle;
    return DateUnit.handleDateTime(this, style);
  }

  /// Display time in friendly format.
  String friendlyFormat({Locale? locale}) =>
      DateUnit.handleFriendlyDateTime(this, locale: locale);

  /// Get the day of the week for a given time.
  String getWeak({Locale? locale}) =>
      DateUnit.getWeakOfDateTime(this, locale: locale);
}
