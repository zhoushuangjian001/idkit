<p id='jump'></p>

## Introduce
The following main functions are the formatting of mobile phone numbers and bank card numbers.

## Example Display
```dart
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
```
## Example Test Result Screenshot
![format](https://github.com/zhoushuangjian001/idkit/blob/master/readme_img/format.png?raw=true)

## Friendship Link
**[👈🏻 Return Previous Page](https://pub.flutter-io.cn/packages/idkit)** &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[ 👆🏻 Return Top](#jump)**