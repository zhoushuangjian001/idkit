## Introduce
The components mainly introduced below are the gap blocks, which are mainly used for the spacing between components.
## Example Display
```dart
/// Gap Widget
class GapWidget extends StatelessWidget {
  const GapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Gap Widget Test')),
        body: Container(
          alignment: Alignment.center,
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
```
## Example Test Result Screenshot 

![gap](https://github.com/zhoushuangjian001/idkit/blob/master/readme_img/gap.png?raw=true)