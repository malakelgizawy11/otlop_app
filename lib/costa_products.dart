import 'package:flutter/material.dart';
import 'package:otlop_app/reusable_widgets.dart';
import 'package:otlop_app/text_style.dart';

import 'categories_data.dart';

class Costa extends StatefulWidget {
  const Costa({super.key});

  @override
  State<Costa> createState() => _CostaState();
}

class _CostaState extends State<Costa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        title: Text("Costa"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 15,
                            color: Colors.grey[700],
                          ),
                          Text(
                            "Search products...",
                            style: AppTextStyles.greytext,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list, size: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,
                child:
                ListView.builder(scrollDirection: Axis.horizontal,
                  itemCount: CategoriesData.filters.length,
                  itemBuilder: (context, index) {
                    return Reuse.filterCard(
                      context: context,
                      index: index,
                      content: CategoriesData.filters[index]["filter"],
                    );
                  },
                ),)

              ,

              Expanded(
                child: GridView.builder(
                  itemCount: CategoriesData.costaProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    var item = CategoriesData.costaProducts[index];
                    return Reuse.newGridTile(
                      category: item["category"],
                      imageName: item["image"],
                      brand: item["brand"],
                      title: item["title"],
                      price: item["price"],
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
