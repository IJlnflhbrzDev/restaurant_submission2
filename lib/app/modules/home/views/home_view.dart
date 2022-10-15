import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantv2/app/modules/list_restaurant/views/list_restaurant_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListRestaurantView(),
    );
  }
}
