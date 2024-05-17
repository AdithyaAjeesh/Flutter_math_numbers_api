import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FunctionProvider extends ChangeNotifier {
  Dio dio = Dio();
  String output = '';
  TextEditingController numberController = TextEditingController();

  Future<void> getNumberFacts(context) async {
    final number = numberController.text.trim();
    final response = await dio.get('http://numbersapi.com/22');
    if (response.statusCode == 200) {
      print(response.data);
      notifyListeners();
      return output = response.data;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('ERROR'),
            content: Text('Failed to Fetch the Data'),
          );
        },
      );
    }
  }
}
