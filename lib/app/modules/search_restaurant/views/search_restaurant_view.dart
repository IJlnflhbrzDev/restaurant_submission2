// ignore_for_file: avoid_print, await_only_futures, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantv2/app/modules/detail_restaurant/views/detail_restaurant_view.dart';
import 'package:submission_restaurantv2/app/modules/list_restaurant/views/futurebulder_list_restaurant.dart';

import '../controllers/search_restaurant_controller.dart';

var cSearch = Get.put(SearchRestaurantController());

class SearchRestaurantView extends GetView<SearchRestaurantController> {
  const SearchRestaurantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize: 25),
                ),
                Text(
                  'Find a restaurant that you like',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 30),
                TextField(
                  onChanged: (text) async {
                    cSearch.queryInp = text;
                    await cSearch.getListRestaurant();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
                Expanded(
                  flex: 2,
                  // height: Get.height,
                  child: SizedBox(
                    height: Get.height,
                    child: Center(
                      child: Container(
                        child: FutureBuilder(
                          future: cSearch.getListRestaurant(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: cSearch.listBodyRestaurants.length,
                                itemBuilder: (context, index) {
                                  var data = cSearch.listBodyRestaurants[index];
                                  return InkWell(
                                    onTap: () {
                                      cDetailController.idRestaurant =
                                          data['id'];
                                      cDetailController.getListRestaurant();
                                      Get.to(
                                        () => DetailRestaurantView(
                                          restaurantID: data['id'],
                                          restaurantNAME: data['name'],
                                          restaurantCITY: data['city'],
                                          restaurantDESCRIPTION:
                                              data['description'],
                                          restaurantPICTUREID:
                                              data['pictureId'],
                                          restaurantRATING:
                                              data['rating'].toString(),
                                          restaurantFood:
                                              cListRestaurants.foods,
                                          restaurantDrink:
                                              cListRestaurants.drinks,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, bottom: 10),
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
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                'https://restaurant-api.dicoding.dev/images/medium/${data['pictureId']}',
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 80),
                                          )),
                                          const SizedBox(width: 15),
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6,
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: Colors.grey,
                                                          size: 16),
                                                      Text(
                                                        data['city'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .grey),
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
                                                        data['rating']
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1
                                                            ?.copyWith(
                                                              color:
                                                                  Colors.grey,
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
                                },
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
