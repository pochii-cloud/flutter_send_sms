import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

List<String> recipients = ['0741445868', '0706219186'];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send message'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              // ignore: deprecated_member_use
              child: RaisedButton(
                  child: const Text('click to send message'),
                  onPressed: () {
                    _sendSMS('This is just a test message', recipients);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipients) async {
  String _result = await sendSMS(message: message, recipients: recipients)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
