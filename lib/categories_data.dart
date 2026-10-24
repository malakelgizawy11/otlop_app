import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlop_app/starbucks_products.dart';

import 'category_model.dart';
import 'cilantro_products.dart';
import 'costa_products.dart';

class CategoriesData extends StatelessWidget {
  const CategoriesData({super.key});

  static final List<Map<String, dynamic>> brands = [
    {"brand": "Starbucks", "page": Starbucks()},
    {"brand": "Costa", "page": Costa()},
    {"brand": "Cilantro", "page": Cilantro()},
    {"brand": "Starbucks", "page": Starbucks()},
  ];

  static final List<Map<String, dynamic>> products = [
    {
      "category": "Frappuccino",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Cake",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Frappuccino",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Cake",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Frappuccino",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Cake",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Frappuccino",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Cake",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
  ];

  static List<CategoryModel> categoriesList = [
    CategoryModel(
      categoryImage: SvgPicture.asset("images/c1.svg"),
      categoryName: "Frappuccino",
    ),
    CategoryModel(
      categoryImage: SvgPicture.asset("images/c2,4.svg"),
      categoryName: "Latte",
    ),
    CategoryModel(
      categoryImage: SvgPicture.asset("images/c3.svg"),
      categoryName: "Mocha",
    ),
    CategoryModel(
      categoryImage: SvgPicture.asset("images/c2,4.svg"),
      categoryName: "Macchiato",
    ),
    CategoryModel(
      categoryImage: SvgPicture.asset("images/c1.svg"),
      categoryName: "Frappuccino",
    ),
  ];

  static final List<Map<String, dynamic>> filters = [
    {
      "filter": Row(children: [Text("Relevance")]),
    },
    {
      "filter": Row(children: [Text("Price"), Icon(Icons.arrow_drop_up)]),
    },
    {
      "filter": Row(children: [Text("Price"), Icon(Icons.arrow_drop_down_sharp)]),
    },
    {
      "filter": Row(children: [Text("A-Z")]),
    },
  ];


  static final List<Map<String, dynamic>> costaProducts = [
    {
      "category": "Costa",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Costa",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Costa",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Costa",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Costa",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Costa",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Costa",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Costa",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },

  ];


  static final List<Map<String, dynamic>> starbucksProducts = [
    {
      "category": "Starbucks",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Double Caramel Frappuccino.png",
      "brand": "Starbucks",
      "title": "Double Caramel Frappuccino",
      "price": "200EGP",
    },
    {
      "category": "Starbucks",
      "image": "images/Blueberry Cheesecake.png",
      "brand": "Starbucks",
      "title": "Blueberry Cheesecake",
      "price": "155EGP",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
