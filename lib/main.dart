import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numerology Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primaryBlack,
      ),
      home: MyHomePage(title: 'Numerology Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final inputController = TextEditingController();

  void _incrementCounter() {
    var text = inputController.text;
    text = text.toLowerCase();
    int sum = 0;
    int result = 0;
    text.runes.forEach((int rune) {
      if (rune >= 48 && rune <= 57) {
        sum += (rune - 48);
      } else {
        var char = new String.fromCharCode(rune);
        switch (char) {
          case "a":
          case "q":
          case "y":
          case "i":
          case "j":
            sum = sum + 1;
            break;
          case "b":
          case "r":
          case "k":
            sum = sum + 2;
            break;
          case "g":
          case "c":
          case "l":
          case "s":
            sum = sum + 3;
            break;
          case "d":
          case "m":
          case "t":
            sum = sum + 4;
            break;
          case "e":
          case "h":
          case "n":
          case "x":
            sum = sum + 5;
            break;
          case "u":
          case "v":
          case "w":
            sum = sum + 6;
            break;
          case "o":
          case "z":
            sum = sum + 7;
            break;
          case "f":
          case "p":
            sum = sum + 8;
            break;
          default:
            sum = sum + 0;
        }
      }
    });

    while (sum > 9) {
      if (sum == 11 ||
          sum == 22 ||
          sum == 33 ||
          sum == 44 ||
          sum == 55 ||
          sum == 66 ||
          sum == 77 ||
          sum == 88 ||
          sum == 99) {
        result = sum;
        break;
      }
      var sumText = sum.toString();
      sumText.runes.forEach((int rune) {
        var char = new String.fromCharCode(rune);
        var i = int.parse(char);
        result += i;
      });
      sum = result;
    }
    if (sum < 10) result = sum;
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please write your desired text or number to calculate',
            ),
            Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: inputController,
                )),
            Text(
              'Result : $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Calculate',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;