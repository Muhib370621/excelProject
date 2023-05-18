import 'package:excelread/src/controller/mainScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExcelDetail extends StatefulWidget {
  const ExcelDetail({Key? key}) : super(key: key);

  @override
  State<ExcelDetail> createState() => _ExcelDetailState();
}

class _ExcelDetailState extends State<ExcelDetail> {
  @override
  // void initState() {
  //   final mainScreenController = Get.put(MainScreenController());
  //   print(mainScreenController.rowsList.toString());
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final mainScreenController = Get.put(MainScreenController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: SafeArea(
            child: Obx(
          () => ListView.builder(
              padding: EdgeInsets.only(top: 1.5.h),
              shrinkWrap: true,
              itemCount: mainScreenController.rowsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 9.h,
                      width: 90.w,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 4.h,
                            width: 10.w,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  // "Product Title",
                                  mainScreenController.rowsList[0][20].toString().substring(0,22),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                mainScreenController.rowsList[0][21].toString(),
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                  ],
                );
              }),
        )

            //   ListView.builder(
            //       padding: EdgeInsets.only(top: 1.5.h),
            //       shrinkWrap: true,
            //       itemCount: 2,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             Container(
            //               height: 9.h,
            //               width: 90.w,
            //               padding: const EdgeInsets.all(10),
            //               decoration: const BoxDecoration(
            //                 color: Colors.grey,
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(
            //                     15,
            //                   ),
            //                 ),
            //               ),
            //               child: Row(
            //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Container(
            //                     height: 4.h,
            //                     width: 10.w,
            //                     decoration: const BoxDecoration(
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: 4.w,
            //                   ),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         "Product Title",
            //                         style: TextStyle(
            //                           fontSize: 20.sp,
            //                           color: Colors.blueGrey,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                       Text(
            //                         "Product sub Title",
            //                         style: TextStyle(
            //                           fontSize: 17.sp,
            //                           color: Colors.blueGrey,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //             SizedBox(
            //               height: 1.5.h,
            //             ),
            //           ],
            //         );
            //       // }),
            // )
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: 9.h,
            //       width: 90.w,
            //       padding: const EdgeInsets.all(10),
            //       decoration: const BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(
            //             15,
            //           ),
            //         ),
            //       ),
            //       child: Row(
            //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             height: 4.h,
            //             width: 10.w,
            //             decoration: const BoxDecoration(
            //               color: Colors.black,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 4.w,
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Product Title",
            //                 style: TextStyle(
            //                   fontSize: 20.sp,
            //                   color: Colors.blueGrey,
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ),
            //               Text(
            //                 "Product sub Title",
            //                 style: TextStyle(
            //                   fontSize: 17.sp,
            //                   color: Colors.blueGrey,
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            ));
  }
}
