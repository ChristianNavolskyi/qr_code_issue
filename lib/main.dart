import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() async {
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

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  GlobalKey _qrKey = GlobalKey(debugLabel: "first");
  QRViewController _qrController;

  @override
  Widget build(BuildContext context) {
    print("Build first screen");

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
              child: QRView(key: _qrKey, onQRViewCreated: (controller) => _qrController = controller),
            ),
            MaterialButton(
              onPressed: () {
                print("navigating to next screen");
                Navigator.of(context).pushNamed("/other");
              },
              child: Text("Go to other"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GlobalKey _qrKey = GlobalKey(debugLabel: "second");
  QRViewController _qrController;

  @override
  Widget build(BuildContext context) {
    print("Build second screen");

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
              child: QRView(key: _qrKey, onQRViewCreated: (controller) => _qrController = controller),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }
}
