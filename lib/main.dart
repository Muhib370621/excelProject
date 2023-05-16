import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  initState() {
    readExcel();
    super.initState();
    // Add listeners to this class
  }

  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void readExcel() async {
    // var file = "assets/example.xlsx"; // Replace with the path to your Excel file

//     ByteData data = await rootBundle.load("assets/example.xlsx");
//     var byte = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     var excel = Excel.decodeBytes(byte);
// var bytes = File(excel).readAsBytesSync();
//     var excels = Excel.decodeBytes(bytes);
//     for (var table in excel.tables.keys) {
//       print(table); //sheet Name
//       print(excels.tables[table]!.maxCols);
//       print(excels.tables[table]!.maxRows);
//       for (var row in excels.tables[table]!.rows) {
//         print("$row");
//       }
//     }

    ByteData data = await rootBundle.load("assets/example.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print("$row");
      }
    }
// You can also copy it to the device when the app starts
//     final directory = await getApplicationDocumentsDirectory();
//     String filePath = join(directory, "Declaratieformulier.xlsx");
//     await File(filePath).writeAsBytes(bytes);
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
