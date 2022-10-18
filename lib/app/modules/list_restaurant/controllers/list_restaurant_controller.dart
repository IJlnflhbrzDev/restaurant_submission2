// ignore_for_file: constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListRestaurantController extends GetxController {
  var listBodyRestaurants = [];
  var listBodyRestaurantsMenus = [];

  var foods;
  var drinks;
  Future<dynamic> getListRestaurant() async {
    var response =
        await http.get(Uri.parse('https://restaurant-api.dicoding.dev/list'));
    var responseJson = json.decode(response.body)['restaurants'];
    listBodyRestaurants = responseJson;
    // print(responseJson);

    return listBodyRestaurants;
  }
}
