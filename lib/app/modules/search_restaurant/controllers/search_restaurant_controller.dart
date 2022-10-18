// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchRestaurantController extends GetxController {
  final queryRestaurantsSearch = TextEditingController();
  var queryInp = '';
  var listBodyRestaurants;

  Future<dynamic> getListRestaurant() async {
    var response = await http.get(
        Uri.parse('https://restaurant-api.dicoding.dev/search?q=$queryInp'));
    var responseJson = json.decode(response.body)['restaurants'];

    listBodyRestaurants = responseJson;
    return listBodyRestaurants;
  }
}

// https://restaurant-api.dicoding.dev/search?q=queryInp