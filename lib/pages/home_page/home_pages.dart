import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../style/app_colors.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  _HomePageState() {
    controller = HomeController(setState)..getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      resizeToAvoidBottomInset: false,
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
              /// Header Title text
              const Text(
                "Currency Converter",
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Check live rates, set rate alerts, receive notifications and more.",
                style: TextStyle(
                  color: AppColors.grayText,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              /// Card Item
              Card(
                elevation: 2,
                color: AppColors.white,
                surfaceTintColor: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Amount Input
                      const Text(
                        "Amount",
                        style: TextStyle(
                          color: AppColors.grayText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleFlag(controller.amountCcy?.substring(0, 2) ?? ""),
                          const SizedBox(width: 10),
                          DropdownMenu<String>(
                            initialSelection: controller.convertedAmountCcy,
                            inputDecorationTheme: const InputDecorationTheme(
                              border: InputBorder.none,
                            ),
                            width: 100,
                            menuHeight: 300,
                            textStyle: const TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            enableFilter: true,
                            enableSearch: true,
                            onSelected: controller.changeAmountCcy,
                            dropdownMenuEntries: controller.currencies.map((e) {
                              return DropdownMenuEntry(
                                value: e.ccy,
                                label: e.ccy,
                              );
                            }).toList(),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              onChanged: controller.inputAmountText,
                              decoration:  const InputDecoration(
                                filled: true,
                                fillColor: AppColors.scaffoldBG,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.\d]')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      /// Divider Stack
                      const SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Divider(),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.secondary,
                              child: Icon(
                                CupertinoIcons.arrow_up_arrow_down,
                                color: AppColors.white,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),

                      /// Converted Amount Input
                      const SizedBox(height: 10),
                      const Text(
                        "Converted Amount",
                        style: TextStyle(
                          color: AppColors.grayText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleFlag(controller.convertedAmountCcy?.substring(0, 2) ?? ""),
                          const SizedBox(width: 10),
                          DropdownMenu<String>(
                            initialSelection: controller.convertedAmountCcy,
                            inputDecorationTheme: const InputDecorationTheme(
                              border: InputBorder.none,
                            ),
                            width: 100,
                            menuHeight: 300,
                            textStyle: const TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            enableFilter: true,
                            enableSearch: true,
                            onSelected: controller.changeConvertedAmountCcy,
                            dropdownMenuEntries: controller.currencies.map((e) {
                              return DropdownMenuEntry(
                                value: e.ccy,
                                label: e.ccy,
                              );
                            }).toList(),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: controller.resultAmount,
                                fillColor: AppColors.scaffoldBG,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColors.white,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.\d]')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Indicative Exchange Rate",
                  style: TextStyle(
                    color: AppColors.grayText,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "1 ${controller.amountCcy} = ${controller.oneResultAmount} ${controller.convertedAmountCcy}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
