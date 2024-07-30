import 'package:currency_convertor/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  String url = " https://v6.exchangerate-api.com/v6/4a17fbc9a011e7e5504f24b1/latest/";
  late Uri burl;
  late final response;
  Future <bool> checkCountry(String baseCountry) async {
    burl = Uri.parse("$url$baseCountry");
    response = await http.get(burl);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }
  Future <Currency_value_model> fetchData(String baseCountry) async {
    try {
    // final response = await http.get(burl);
    // bool exist = await checkCountry(baseCountry);
    // if (exist) {
      final jsonData = jsonDecode(response.body);
      return Currency_value_model.fromJson(jsonData);
    // }
    // else {
      // throw Exception("Failed to load data");
    // }
    }
    catch (e){
      print('Error: $e');
      rethrow;
    }
  }
}