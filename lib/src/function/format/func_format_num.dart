extension IDKitNumFormat on String {
  /// Phone number format.
  ///
  /// E.g:
  /// 188 0121 0281
  String get phoneFormat {
    final String phone = replaceAll(' ', '');
    assert(phone.length == 11, 'The length of the phone number is illegal.');
    final String phoneS = phone.substring(0, 3);
    final String phoneM = phone.substring(3, 7);
    final String phoneE = phone.substring(7);
    return '$phoneS $phoneM $phoneE';
  }

  /// Bank card number formatting.
  ///
  /// E.g:
  /// 2222 3333 4444 5555
  /// 2222 3333 4444 5555 1
  /// 2222 3333 4444 5555 234
  String get bankFormat {
    final List<String> list = replaceAll(' ', '').split('');
    final StringBuffer buffer = StringBuffer();
    for (var i = 0; i < list.length; i++) {
      final String item = list[i];
      buffer.write(item);
      if ((i + 1) % 4 == 0 && i != 0) {
        buffer.write(' ');
      }
    }
    list.clear();
    return buffer.toString();
  }
}
