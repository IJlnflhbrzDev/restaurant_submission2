// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailRestaurantController extends GetxController {
  //  https://restaurant-api.dicoding.dev/detail/id
  var listBodyRestaurants;
  var listBodyRestaurantsMenusFoods = [];
  var listBodyRestaurantsMenusDrinks = [];
  var idRestaurant = ' ';
  Future<dynamic> getListRestaurant() async {
    var response = await http.get(
        Uri.parse('https://restaurant-api.dicoding.dev/detail/$idRestaurant'));
    var responseJson = json.decode(response.body);
    listBodyRestaurants = responseJson;

    print(responseJson['restaurant']['menus']['foods']);
    listBodyRestaurantsMenusFoods =
        responseJson['restaurant']['menus']['foods'];
    listBodyRestaurantsMenusDrinks =
        responseJson['restaurant']['menus']['drinks'];

    return listBodyRestaurants;
  }
}
