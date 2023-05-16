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


    for (var table in excel.tables.keys) {
      // print(excel.tables[table].); //sheet Name
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      List<Data?> innerList = excel.tables[table]!.rows.isNotEmpty ? excel.tables[table]!.rows.first : [];
      // Workbook workbook = Workbook();
      // workbook.decode(bytes);

      // List extractedValues = innerList
      //     .map((data) => data)
      //     .where((value) => value == 'customer' || value == 'name')
      //     .toList();
      // print("customer"+extractedValues.toString());
      // print(excel.tables[table]!.rows[0]);
      List<Data> dataModelList = [];
      // List<String> filteredValues = innerList
      //     .map((data) => data.toString())
      //     .toList();
      // print("filter"+filteredValues.toString());


      for (var row in innerList) {
        dataModelList.add(row!);
        print(dataModelList.length);
        // if(row)
        // print("$row");
      }
      List<String> names = extractNames(dataModelList);

    }
  }
  List<String> extractNames(List<DataModel> dataList) {
    List<String> names = [];

    for (DataModel data in dataList) {
      names.add(data.name);
    }

    return names;
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


