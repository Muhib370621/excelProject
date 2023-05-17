import 'package:excel/excel.dart';
import 'package:excelread/src/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
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
      _counter++;
    });
  }

  void readExcel() async {
    ByteData data = await rootBundle.load("assets/example.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    List<List<dynamic>> rowsList = [];

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      // print("rows${excel.tables[table]!.rows}"); //sheet Name
      for (var row in excel.tables[table]!.rows) {
        List<dynamic> rowList = [];
        for (var cell in row) {
          rowList.add(cell?.value);
        }
        rowsList.add(rowList);
      }
    }

    // Now you have a list of rows
    // You can access each row as follows
    for (var row in rowsList) {
      print(row);
    }
// for (var table in excel.tables.keys) {
    //   // print(excel.tables[table].); //sheet Name
    //   print(excel.tables[table]!.maxCols);
    //   print(excel.tables[table]!.maxRows);
    //   // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    //   List<Data?> tableHeaderList = excel.tables[table]!.rows.isNotEmpty ? excel.tables[table]!.rows[0] : [];
    //   List<List<dynamic>> rowsList = [];
    //
    //   for (var table in excel.tables.keys) {
    //     print(table); //sheet Name
    //
    //     for (var row in excel.tables[table]!.rows) {
    //       List<dynamic> rowList = [];
    //       row.forEach((cell) => rowList.add(cell!.value));
    //       rowsList.add(rowList);
    //     }
    //   }
    //   // Now you have a list of rows
    //   // You can access each row as follows
    //   for (var row in rowsList) {
    //     print(row);
    //   }
    //   List<String> columnList = [];
    //
    //   for (var row in tableHeaderList) {
    //     print(row!.value);
    //     columnList.add(row.value.toString());
    //   }
    // }
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
        onPressed: readExcel,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


