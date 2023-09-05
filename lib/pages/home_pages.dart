import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.scaffoldBG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
            bottom: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Curreny Converter",
                style: TextStyle(
                    color: AppColor.secondaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Check live rates, set rate alerts, receive notifications and more.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColor.grayText),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Card(
                elevation: 5,
                surfaceTintColor: AppColor.wite,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            color: AppColor.grayText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleFlag("uz"),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownMenu(
                              inputDecorationTheme: InputDecorationTheme(
                                border: InputBorder.none,
                              ),
                              width: 100,
                              textStyle: TextStyle(
                                fontSize: 24,
                                color: AppColor.grayText,
                                fontWeight: FontWeight.bold,
                              ),
                              initialSelection: "1",
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                  value: "1",
                                  label: 'USD',
                                ),
                                DropdownMenuEntry(
                                  value: "2",
                                  label: 'UZS',
                                ),
                                DropdownMenuEntry(
                                  value: "3",
                                  label: 'KZT',
                                )
                              ]),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.scaffoldBG,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: AppColor.wite),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: AppColor.wite),
                                ),
                              ),keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[\.\d]")),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Divider(),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColor.secondaryColor,
                              child: Icon(
                                CupertinoIcons.arrow_up_arrow_down,
                                color: AppColor.wite,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ), Text(
                        'Converted Amount',
                        style: TextStyle(
                            color: AppColor.grayText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleFlag("uz"),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownMenu(
                              inputDecorationTheme: InputDecorationTheme(
                                border: InputBorder.none,
                              ),
                              width: 100,
                              textStyle: TextStyle(
                                fontSize: 24,
                                color: AppColor.grayText,
                                fontWeight: FontWeight.bold,
                              ),
                              initialSelection: "1",
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                  value: "1",
                                  label: 'USD',
                                ),
                                DropdownMenuEntry(
                                  value: "2",
                                  label: 'UZS',
                                ),
                                DropdownMenuEntry(
                                  value: "3",
                                  label: 'KZT',
                                )
                              ]),
                          Expanded(
                            child: TextField(readOnly: true,
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.scaffoldBG,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: AppColor.wite),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(color: AppColor.wite),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[\.\d]")),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,

                      )
                    ],
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.only(right: 290,top: 25),
                child: Text(
                  'Indicative Exchange Rate',
                  style: TextStyle(
                      color: AppColor.grayText,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ), Padding(
                padding: const EdgeInsets.only(right: 330,top: 20),
                child: Text(
                  '1 USD = 1.36 SGD',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
