// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_restaurant_controller.dart';

class DetailRestaurantView extends GetView<DetailRestaurantController> {
  const DetailRestaurantView({
    Key? key,
    required this.restaurantID,
    required this.restaurantPICTUREID,
    required this.restaurantNAME,
    required this.restaurantCITY,
    required this.restaurantRATING,
    required this.restaurantDESCRIPTION,
    required this.restaurantFood,
    required this.restaurantDrink,
  }) : super(key: key);
  static const routeName = '/restaurant_detaild';

  final String? restaurantID;
  final String? restaurantPICTUREID;
  final String? restaurantNAME;
  final String? restaurantCITY;
  final String? restaurantRATING;
  final String? restaurantDESCRIPTION;
  final List restaurantFood;
  final List restaurantDrink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: ListView(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15)),
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/medium/$restaurantPICTUREID',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$restaurantNAME',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.zero,
                                child: Icon(Icons.location_on_outlined,
                                    color: Colors.grey, size: 16),
                              ),
                              Text(
                                '$restaurantCITY',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outlined,
                                size: 16,
                                color: Colors.grey,
                              ),
                              Text(
                                restaurantRATING.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$restaurantDESCRIPTION',
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Menu Makanan',
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(height: 3),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: restaurantFood.length,
                                  itemBuilder: (context, index) {
                                    var foodName =
                                        restaurantFood[index]['name'];
                                    return Text(foodName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 13, height: 1.7));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Menu Minuman',
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(height: 3),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: restaurantDrink.length,
                                  itemBuilder: (context, index) {
                                    var drinkName =
                                        restaurantDrink[index]['name'];

                                    return Text(drinkName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 13, height: 1.7));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
