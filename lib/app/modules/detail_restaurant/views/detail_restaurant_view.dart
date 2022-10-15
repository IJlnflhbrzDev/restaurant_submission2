import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_restaurant_controller.dart';

class DetailRestaurantView extends GetView<DetailRestaurantController> {
  const DetailRestaurantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailRestaurantView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailRestaurantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
