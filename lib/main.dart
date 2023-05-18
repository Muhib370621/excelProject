import 'package:excel/excel.dart';
import 'package:excelread/src/controller/mainScreenController.dart';
import 'package:excelread/src/model/dataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'src/core/utils/appColors.dart';
import 'src/view/excelDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
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

  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  void readExcel() async {
    final mainScreenController = Get.put(MainScreenController());
    ByteData data = await rootBundle.load("assets/example.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    // List<List<dynamic>> rowsList = [];

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      for (var row in excel.tables[table]!.rows) {
        // List<dynamic> rowList = [];
        for (var cell in row) {
          mainScreenController.rowList.add(cell?.value);
        }
        // rowsList.add(rowList);
        mainScreenController.rowsList.add(mainScreenController.rowList);
      }
      List<Data?> tableHeaderList = excel.tables[table]!.rows.isNotEmpty
          ? excel.tables[table]!.rows[0]
          : [];
      for (var row in mainScreenController.rowsList) {
        // print(row);
      }
      List<String> columnList = [];

      for (var row in tableHeaderList) {
        // print(row!.value);
        columnList.add(row!.value.toString());
      }
    }

    // Now you have a list of rows
    // You can access each row as follows
    for (var row in mainScreenController.rowsList) {
      // print(row);
      // Extract the first 20 elements
      List<dynamic> firstTwenty = row.sublist(0, 20);
      print(firstTwenty);

      // Extract the remaining elements
      List<dynamic> remaining = row.sublist(20);
      print(remaining);
    }
    // Extract product names to a new list
    List<String> productNames = mainScreenController.rowsList.map((product) => product.toString()).toList();
// print(productNames);
    // Print the product names to verify the operation
    for (var productName in productNames) {
      if (kDebugMode) {
        // print(productName);
      }
    }
    // print(mainScreenController.rowsList);
  }

  @override
  Widget build(BuildContext context) {
    final mainScreenController = Get.put(MainScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Excel Read"),
      ),
      body: SafeArea(
        child: InkWell(
          onTap: (){
            // Get.to(()=>const ExcelDetail());
            for (var row in mainScreenController.rowsList) {
              print(row);
            }
            // print(mainScreenController.rowsList[29][23].toString());
          },
          child: Container(
            height: 8.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  15,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Example.xlsx",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
