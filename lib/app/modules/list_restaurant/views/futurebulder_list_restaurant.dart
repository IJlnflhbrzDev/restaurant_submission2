// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantv2/app/modules/detail_restaurant/controllers/detail_restaurant_controller.dart';
import 'package:submission_restaurantv2/app/modules/detail_restaurant/views/detail_restaurant_view.dart';
import 'package:submission_restaurantv2/app/modules/list_restaurant/controllers/list_restaurant_controller.dart';

var cListRestaurants = Get.put(ListRestaurantController());
var cDetailController = Get.put(DetailRestaurantController());

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
              var data = cListRestaurants.listBodyRestaurants[index];

              var listFoods =
                  cDetailController.listBodyRestaurantsMenusFoods.map((e) {
                return e;
              }).toList();
              cListRestaurants.foods = listFoods;

              var listDrinks =
                  cDetailController.listBodyRestaurantsMenusDrinks.map(
                (e) {
                  return e;
                },
              ).toList();
              cListRestaurants.drinks = listDrinks;
              if (snapshot.hasData) {
                return InkWell(
                  onTap: () {
                    cDetailController.idRestaurant = data['id'];
                    cDetailController.getListRestaurant();
                    Get.to(
                      () => DetailRestaurantView(
                        restaurantID: data['id'],
                        restaurantNAME: data['name'],
                        restaurantCITY: data['city'],
                        restaurantDESCRIPTION: data['description'],
                        restaurantPICTUREID: data['pictureId'],
                        restaurantRATING: data['rating'].toString(),
                        restaurantFood: listFoods,
                        restaurantDrink: listDrinks,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 1,
                          offset: Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                'https://restaurant-api.dicoding.dev/images/medium/${data['pictureId']}',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 80),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined,
                                        color: Colors.grey, size: 16),
                                    Text(
                                      data['city'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_outlined,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      data['rating'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                            color: Colors.grey,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }
}
