extension IDKitDesensitized on String {
  /// Mobile phone number desensitization.
  ///
  /// E.g : 18801210281 -> 188****0281
  String get phoneDesensitized {
    assert(isNotEmpty, 'The length of the phone number cannot be empty.');
    String phone = replaceAll(' ', '');
    assert(phone.length == 11,
        'The length of the mobile phone number is illegal, the legal length is 11.');
    return phone.replaceRange(3, 7, '*' * 4);
  }

  /// Desensitization of bank card numbers.
  ///
  /// Examples are as follows:
  /// 6222 2234 5323 4223     -> **** 4223
  /// 6222 2234 5323 4223 1   -> **** 2231
  /// 6222 2234 5323 4223 341 -> **** 3341
  String get bankDesensitized {
    assert(isNotEmpty, 'Card number length cannot be empty.');
    String bank = replaceAll(' ', '');
    final int length = bank.length;
    assert(length >= 4,
        'The length of the card number does not meet the specification.');
    bank = substring(length - 4);
    return '${'*' * 4} $bank';
  }

  String get idDesensitized {
    // 411422 19890516 0337
    String id = replaceAll(' ', '');
    assert(id.length == 18, 'ID number length is invalid.');
    final String idStart = id.substring(0, 6);
    final String idEnd = id.substring(14);
    return '$idStart${'*' * 8}$idEnd';
  }
}
