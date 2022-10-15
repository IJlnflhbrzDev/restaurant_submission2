import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantv2/app/modules/list_restaurant/controllers/list_restaurant_controller.dart';

var cListRestaurants = Get.put(ListRestaurantController());

class FutureBuilderRestaurant extends GetView<ListRestaurantController> {
  const FutureBuilderRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: FutureBuilder(
        future: cListRestaurants.getListRestaurant(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: cListRestaurants.listBodyRestaurants.length,
            itemBuilder: (context, index) {
              print(cListRestaurants.listBodyRestaurants[index]);
              return const Text('data');
            },
          );
        },
      ),
    );
  }
}
