import 'package:example/main.dart' as ma;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idkit/idkit.dart';

void main() {
  test('Function Test', () {
    ma.desensitizedMethod();
    ma.phoneAndBankFormatMethod();
  });
}
