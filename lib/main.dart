import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MyFirstScreen(),
      //   '/second': (context) => SecondScreen('second screen'),
      //   '/third': (context) => SecondScreen('third screen'),
      // },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
    MyHomePageState  createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'paint app ',
          style: TextStyle(fontSize: 23.0)
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: MyPainter()
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(150, 0, 250, 255);
    Rect rect = const Rect.fromLTWH(50.0, 50.0, 150.0, 150.0);
    canvas.drawRect(rect, p);
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    rect = const Rect.fromLTWH(100.0, 100.0, 150.0, 150.0);
    canvas.drawRect(rect, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

