<p id='jump'></p>

## Introduce
The following main functions are the desensitization processing of mobile phone numbers, bank card numbers, and ID numbers.

## Example Display
```dart
/// Phone number desensitization
final phone = '18801210283'.phoneDesensitized;
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
```
## Example Test Result Screenshot
![desensitization](https://github.com/zhoushuangjian001/idkit/blob/master/readme_img/desensitization.png?raw=true)

## Friendship Link
**[👈🏻 Return Previous Page](https://pub.flutter-io.cn/packages/idkit)** &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[ 👆🏻 Return Top](#jump)**