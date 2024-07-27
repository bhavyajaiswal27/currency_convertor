import 'package:currency_convertor/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  static String url = " https://v6.exchangerate-api.com/v6/4a17fbc9a011e7e5504f24b1/latest/";
  static Future <Currency_value_model> fetchData(String baseCountry) async {
    Uri murl = Uri.parse("$url$baseCountry");
    try {
    final response = await http.get(murl);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Currency_value_model.fromJson(jsonData);
    }
    else {
      throw Exception("Failed to load data");
    }
    }
    catch (e){
      print('Error: $e');
      rethrow;
    }
  }
}