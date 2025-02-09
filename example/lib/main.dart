import 'package:flutter/material.dart';
import 'package:in_app_keyboard/in_app_keyboard.dart';
import 'package:scaled_app/scaled_app.dart';

void main() {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) {
      const double widthOfDesign = 400;
      return deviceSize.width / widthOfDesign;
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In App Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'In App Keyboard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerText1 = TextEditingController();
  final _focusNodeText1 = FocusNode();
  final _keyboardTypeText1 = KeyboardType.Numeric;
  final _controllerText2 = TextEditingController();
  final _focusNodeText2 = FocusNode();
  final _keyboardTypeText2 = KeyboardType.Alphanumeric;
  final _controllerText3 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: _focusNodeText1,
              controller: _controllerText1,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                labelText: 'This is Number',
              ),
            ),
            TextFormField(
              focusNode: _focusNodeText2,
              controller: _controllerText2,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                labelText: 'This is AlphaNumeric',
              ),
            ),
            TextFormField(
              controller: _controllerText3,
              decoration: InputDecoration(
                labelText: 'Field wihout focus',
              ),
            ),
            Expanded(
              child: Container(),
            ),
            FilledButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: Text('Unfocus'),
            ),
            Text('Tap on the text fields to show the keyboard'),
            AppKeyboard(
              // pass design width to the keyboard if using ScaledWidgets from scaled_app package
              width: 400,
              focusNodes: [_focusNodeText1, _focusNodeText2],
              textControllers: [_controllerText1, _controllerText2],
              keyboardTypes: [_keyboardTypeText1, _keyboardTypeText2],
              defaultLayouts: [
                KeyboardDefaultLayouts.English,
                KeyboardDefaultLayouts.Arabic,
              ],
              onShow: (isShow) {
                print('Keyboard is ${isShow ? 'visible' : 'hidden'}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
