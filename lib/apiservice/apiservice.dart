import 'dart:convert';



import 'package:apitest/constant/const.dart';
import 'package:apitest/model/cartmodel.dart';

import '../model/quotesmodel.dart';
import 'package:http/http.dart' as http;

Future<RestaurantModel> fetchQuotes() async {
  final response = await http.post(Uri.parse(
      Api.baseUrl + 'customer/restaurants/1?pincode=6735001&user_id=2'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return RestaurantModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Cart> getCart() async {
  final response = await http
      .post(Uri.parse("https://ebshosting.co.in/api/getcart?user_id=3"));

  if (response.statusCode == 200) {
    return Cart.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
