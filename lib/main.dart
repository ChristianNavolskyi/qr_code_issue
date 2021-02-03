import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() async {
  // cubitCounting();
  // await blocCounting();

  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (_) => FirstScreen(),
        "/other": (_) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  GlobalKey _qrKey = GlobalKey(debugLabel: "first");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 34, 100),
      ),
      body: Center(
        child: Column(
          children: [
            Text("First"),
            SizedBox(
              width: 300,
              height: 300,
              child: QRView(key: _qrKey, onQRViewCreated: (_) => print("created")),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pushNamed("/other"),
              child: Text("Go to other"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  GlobalKey _qrKey = GlobalKey(debugLabel: "second");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 34, 100),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Second"),
            SizedBox(
              width: 300,
              height: 300,
              child: QRView(key: _qrKey, onQRViewCreated: (_) => print("created")),
            ),
          ],
        ),
      ),
    );
  }
}
