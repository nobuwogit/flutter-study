import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _message = 'text input';
  var janken = <String>['goo', 'choki', 'per'];
  var _selected = 'one';
  var _value = 10.0;
  var _stars = '☆☆☆☆☆';
  var _star = 0;
  var _index = 0;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Name'),
          leading: const BackButton(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: iconPressedA,
                tooltip: 'add star...',
                icon: const Icon(Icons.android)),
            IconButton(
                onPressed: iconPressedB,
                tooltip: 'subtract star',
                icon: const Icon(Icons.favorite))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Center(
              child: Text(_stars,
                  style: const TextStyle(fontSize: 22.0, color: Colors.black)),
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  _message,
                  style: const TextStyle(
                      fontSize: 30.0
                  )
              ),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.android, size: 32.0),
                    title: const Text(
                        'first item',
                        style: TextStyle(fontSize: 28.0)
                    ),
                    selected: _index == 1,
                    onTap: () {
                      _index = 1;
                      tapTitle();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite, size: 32.0),
                    title: const Text(
                        'second item',
                        style: TextStyle(fontSize: 28.0)
                    ),
                    selected: _index == 2,
                    onTap: () {
                      _index = 2;
                      tapTitle();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, size: 32.0),
                    title: const Text(
                        'third item',
                        style: TextStyle(fontSize: 28.0)
                    ),
                    selected: _index == 3,
                    onTap: () {
                      _index = 3;
                      tapTitle();
                    },
                  )
                ],
              )
            ]
        )
    );
    bottomNavigationBar:
    BottomNavigationBar(
      currentIndex: _index,
      backgroundColor: Colors.lightBlueAccent,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: 'android',
            icon: Icon(
                Icons.android,
                color: Colors.black,
                size: 50)
        ),
        BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50)
        ),
        BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 50)
        )
      ],
      onTap: tapButtonIcon,


    );
  }

  void b_onPressed() =>
      setState(() {
        _message = 'you said ${_controller.text}';
      });

  void textChanged(String val) {
    setState(() {
      _message = val.toUpperCase();
    });
  }

  void popupSelected(String? val) {
    setState(() {
      _selected = val ?? 'not selected';
      _message = 'selected: $_selected';
    });
  }

  void sliderChanged(double value) {
    setState(() {
      _value = value.floorToDouble();
      _message = 'set value $_value';
    });
  }

  void buttonPressed() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text("hello!!!"),
              content: const Text("This is Sample"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop<String>(context, 'Cancel'),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.pop<String>(context, 'OK'),
                    child: const Text('OK'))
              ],
            )).then<void>((value) => resultAlert(value));
  }

  void buttonPressed_sd() {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) =>
            SimpleDialog(
              title: const Text('Select Assignment'),
              children: <Widget>[
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'One'),
                    child: const Text('one')),
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'Two'),
                    child: const Text('two')),
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'three'),
                    child: const Text('three'))
              ],
            )).then((value) => resultAlert(value));
  }

  void resultAlert(value) {
    setState(() {
      _message = 'selected is $value';
    });
  }

  void iconPressedA() {
    _message = 'tap "andoroid".';
    _star++;
    update();
  }

  void iconPressedB() {
    _message = 'tap "favorite".';
    _star--;
    update();
  }

  void update() {
    _star = _star < 0 ? 0 : _star > 5 ? 5 : _star;
    setState(() {
      _stars = '☆☆☆☆☆★★★★★'.substring(5 - _star, 5 - _star + 5);
      _message = '$_message[$_star]';
    });
  }

  void tapButtonIcon(int value) {
    var items = ['Android', 'Heart', 'Home'];
    setState(() {
      _index = value;
      _message = 'you taped${items[_index]}.';
    });
  }

  void tapTitle() {
    setState(() {
      _message = 'you tapeed : No. $_index';
    });
  }
}
