import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopx/model/product_model.dart';

class ApiServices {
  static final http.Client client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
      );

      if (response.statusCode == 200) {
        final obj = productFromJson(response.body);
        print("respone : ${jsonEncode(obj)}");
        return obj;
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while fetching JSON body: $e");
    }

    return null;
  }
}
