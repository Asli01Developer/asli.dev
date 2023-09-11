import 'dart:convert';

import 'package:http/http.dart';

import '../../../constants/api_constants.dart';
import '../../../models/currency.dart';

class HomeController {
  String? amountCcy;
  String? convertedAmountCcy;
  String? resultAmount;
  String? oneResultAmount;
  String inputAmount = "1";

  List<CurrencyModel> currencies = [
    const CurrencyModel(
      id: 0,
      code: "uz",
      ccy: "UZS",
      ccyNmRU: "",
      ccyNmUZ: "",
      ccyNmUZC: "",
      ccyNmEN: "",
      nominal: "1",
      rate: "1",
      diff: "",
      date: "",
    ),
  ];

  void Function(void Function()) update;

  HomeController(this.update);

  void getApiData() async {
    Response? response;

    try {
      final url = Uri.parse(ApiConstants.currencyPath);
      response = await get(url);
    } catch (e, stackTrace) {
      print("$e\n\n$stackTrace");
    }

    final List<Map<String, Object?>> data = List<Map<String, Object?>>.from(jsonDecode(response?.body ?? ""));
    for (final e in data) {
      currencies.add(CurrencyModel.fromJson(e));
    }

    amountCcy = currencies.first.ccy;
    convertedAmountCcy = currencies.skip(1).first.ccy;
    oneResultAmount = convertAmount("1", currencies.first.rate, currencies.skip(1).first.rate);

    update(() {});
  }

  void inputAmountText(String? value) {
    inputAmount = value ?? "1";

    resultAmount = convertAmount(
      inputAmount,
      currencies.firstWhere((e) => e.ccy == amountCcy).rate,
      currencies.firstWhere((e) => e.ccy == convertedAmountCcy).rate,
    );

    update(() {});
  }

  void changeAmountCcy(String? newCcy) {
    amountCcy = newCcy;

    oneResultAmount = convertAmount(
      "1",
      currencies.firstWhere((e) => e.ccy == amountCcy).rate,
      currencies.firstWhere((e) => e.ccy == convertedAmountCcy).rate,
    );

    resultAmount = convertAmount(
      inputAmount,
      currencies.firstWhere((e) => e.ccy == amountCcy).rate,
      currencies.firstWhere((e) => e.ccy == convertedAmountCcy).rate,
    );

    update(() {});
  }

  void changeConvertedAmountCcy(String? newCcy) {
    convertedAmountCcy = newCcy;

    oneResultAmount = convertAmount(
      "1",
      currencies.firstWhere((e) => e.ccy == amountCcy).rate,
      currencies.firstWhere((e) => e.ccy == convertedAmountCcy).rate,
    );

    resultAmount = convertAmount(
      inputAmount,
      currencies.firstWhere((e) => e.ccy == amountCcy).rate,
      currencies.firstWhere((e) => e.ccy == convertedAmountCcy).rate,
    );

    update(() {});
  }

  String convertAmount(String? inputAmountInCcy, String? amountInCcy, String? convertedAmountInCcy) {
    double? a = double.tryParse(inputAmountInCcy ?? "");
    double? b = double.tryParse(amountInCcy ?? "");
    double? c = double.tryParse(convertedAmountInCcy ?? "");

    if (a == null || b == null || c == null) {
      throw const FormatException("Convert Amount data is empty");
    }

    return ((a * b) / c).toStringAsFixed(4);
  }
}
