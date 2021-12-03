import 'package:flutter/material.dart';

import 'java_script.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JavaScript InterOp Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter JavaScript InterOp Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _m1 = '<empty>';
  String _m2 = '<empty>';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => {
                setState(() => {JavaScript.callJavaScript('from dart')})
              },
              child: const Text('Call JS Function'),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() => {_m1 = JavaScript.calledFromDartWithReturn()})
              },
              child: const Text('Call JS Function with Return'),
            ),
            Text('from JavaScript: $_m1'),
            ElevatedButton(
              onPressed: () async => {
                _m2 = await JavaScript.calledFromDartReturnAfterDelay(1000),
                setState(() => {})
              },
              child: const Text('Call JS Function with Return'),
            ),
            Text('from JavaScript: $_m2'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
