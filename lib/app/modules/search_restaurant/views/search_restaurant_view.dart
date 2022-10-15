import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_restaurant_controller.dart';

class SearchRestaurantView extends GetView<SearchRestaurantController> {
  const SearchRestaurantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchRestaurantView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchRestaurantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
