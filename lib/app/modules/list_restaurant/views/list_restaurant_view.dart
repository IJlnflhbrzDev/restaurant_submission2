import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantv2/app/modules/list_restaurant/views/futurebulder_list_restaurant.dart';
import 'package:submission_restaurantv2/app/modules/search_restaurant/views/search_restaurant_view.dart';

import '../controllers/list_restaurant_controller.dart';

class ListRestaurantView extends GetView<ListRestaurantController> {
  const ListRestaurantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Tooltip(
              message: 'Cari Restaurant',
              child: Material(
                child: InkWell(
                  onTap: () => Get.to(const SearchRestaurantView()),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 25),
            ),
            Text(
              'Recommendation restaurant for you!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 30),
            const Expanded(child: FutureBuilderRestaurant())
          ],
        ),
      ),
    );
  }
}
