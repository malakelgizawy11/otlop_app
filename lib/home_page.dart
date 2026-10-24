import 'package:flutter/material.dart';
import 'package:otlop_app/reusable_widgets.dart';
import 'package:otlop_app/text_style.dart';

import 'filter_products_screen.dart';
import 'remote_data_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteDataSource homeData = RemoteDataSource();
  var response = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    homeData.getCategories().then((value) {
      isLoading = !isLoading;
      response = value;
      setState(() {});
    });
    homeData.getBrands().then((value) {
      isLoading = !isLoading;
      response = value;
      setState(() {});
    });
    homeData.getHomeProducts().then((value) {
      isLoading = !isLoading;
      response = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              // s1
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Good evening 🥐"),
                      Text("Alex", style: AppTextStyles.boldtext),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Color(0xffFF5C39),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),

              // s2
              Container(
                padding: const EdgeInsets.all(5),
                width: 180,
                decoration: const BoxDecoration(
                  color: Color(0xffFFF5F3),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xffFF5C39), size: 16),
                    Expanded(
                      child: Text(
                        "14 Tahrir Square, Cairo",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Color(0xffFF5C39),
                      size: 16,
                    ),
                  ],
                ),
              ),

              // s3
              Row(
                children: [
                  Text("Categories", style: AppTextStyles.boldtext),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text("See all", style: AppTextStyles.orangetext),
                  ),
                ],
              ),
              SizedBox(
                height: 110,
                child: isLoading?Center(child: CircularProgressIndicator(),): ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: response.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FilterProducts.getCategoryId(
                                        categoryId:
                                            response[index]['categoryId'],
                                        title: response[index]['name'],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.network(
                                    response[index]['pictureUrl'],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            response[index]['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // s4
              Text("Brands", style: AppTextStyles.boldtext),
              SizedBox(
                height: 50,
                child: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
                  itemCount: response.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterProducts.getBrandId(
                              brandId: response[index]['brandId'],
                              title: response[index]['name'],
                            ),
                          ),
                        );
                      },
                      child: Reuse.newBrandCard(
                        context: context,
                        index: index,
                        brand: response[index]["name"],
                      ),
                    );
                  },
                ),
              ),

              // s5
              Text("Popular right now", style: AppTextStyles.boldtext),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : response.isEmpty
                    ? Text("No products")
                    : GridView.builder(
                        itemCount: response.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.55,
                            ),
                        itemBuilder: (context, index) {
                          return Reuse.newGridTile(
                            category: response[index]["category"],
                            imageName: response[index]["pictureUrl"],
                            brand: response[index]["brand"],
                            title: response[index]["name"],
                            price: response[index]["price"],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
