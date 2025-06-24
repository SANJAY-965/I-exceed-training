import 'package:flutter/material.dart';
import 'dart:isolate'; // Required for isolates

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IsolateExamplePage(),
    );
  }
}

class IsolateExamplePage extends StatefulWidget {
  @override
  _IsolateExamplePageState createState() => _IsolateExamplePageState();
}

class _IsolateExamplePageState extends State<IsolateExamplePage> {
  String result = 'Press the button to start';

  Future<void> startHeavyTask() async {
    // Create a ReceivePort to get messages from the isolate
    final receivePort = ReceivePort();

    // Start the isolate
    await Isolate.spawn(heavyTask, receivePort.sendPort);

    // Get the SendPort from the isolate to send it a message
    final sendPort = await receivePort.first as SendPort;

    // Create another ReceivePort to get the result from the isolate
    final responsePort = ReceivePort();

    // Send the message + response port
    sendPort.send([100000000, responsePort.sendPort]);

    // Wait for the result
    final sum = await responsePort.first;

    setState(() {
      result = 'Sum = $sum';
    });
  }

  static void heavyTask(SendPort initialSendPort) {
    final port = ReceivePort();
    // Send a way to communicate back to the isolate
    initialSendPort.send(port.sendPort);

    port.listen((message) {
      final int count = message[0];
      final SendPort replyTo = message[1];

      int sum = 0;
      for (int i = 0; i < count; i++) {
        sum += i;
      }

      replyTo.send(sum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Isolate Example'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startHeavyTask,
              child: Text('Start CPU Task in Isolate'),
            ),
          ],
        ),
      ),
    );
  }
}
