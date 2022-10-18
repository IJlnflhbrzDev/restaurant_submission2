// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_restaurant/bindings/list_restaurant_binding.dart';
import '../modules/list_restaurant/views/list_restaurant_view.dart';
import '../modules/search_restaurant/bindings/search_restaurant_binding.dart';
import '../modules/search_restaurant/views/search_restaurant_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST_RESTAURANT,
      page: () => const ListRestaurantView(),
      binding: ListRestaurantBinding(),
    ),
    // GetPage(
    //   name: _Paths.DETAIL_RESTAURANT,
    //   page: () => const DetailRestaurantView(),
    //   binding: DetailRestaurantBinding(),
    // ),
    GetPage(
      name: _Paths.SEARCH_RESTAURANT,
      page: () => const SearchRestaurantView(),
      binding: SearchRestaurantBinding(),
    ),
  ];
}
