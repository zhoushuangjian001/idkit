import 'package:flutter/material.dart';

extension IDKitGap on num {
  /// Horizontal gap widget
  Widget get hGap => SizedBox(width: toDouble());

  /// Vertical gap widget
  Widget get vGap => SizedBox(height: toDouble());
}
