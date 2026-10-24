import 'package:flutter/material.dart';
import 'package:otlop_app/categories_data.dart';
import 'package:otlop_app/remote_data_source.dart';
import 'package:otlop_app/reusable_widgets.dart';
import 'package:otlop_app/text_style.dart';

class FilterProducts extends StatefulWidget {
  final int categoryId;
  final int brandId;
  final String title;

  const FilterProducts.getCategoryId({
    super.key,
    required this.categoryId,
    required this.title,
  }) : brandId = -1;

  const FilterProducts.getBrandId({
    super.key,
    required this.brandId,
    required this.title,
  }) : categoryId = -1;

  @override
  State<FilterProducts> createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
  var response = [];
  RemoteDataSource filterProducts = RemoteDataSource();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.categoryId != -1) {
      filterProducts
          .getProductsByCategoryID(categoryId: widget.categoryId)
          .then((val) {
            isLoading = false;
            response = val;
            setState(() {});
          });
    } else {
      filterProducts.getProductsByBrandID(brandId: widget.brandId).then((val) {
        isLoading = false;
        response = val;
        setState(() {});
      });
    }
  }

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
        title: Text(widget.title),
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
                          Icon(Icons.search, size: 15, color: Colors.grey[700]),
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
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoriesData.filters.length,
                  itemBuilder: (context, index) {
                    return Reuse.filterCard(
                      context: context,
                      index: index,
                      content: CategoriesData.filters[index]["filter"],
                    );
                  },
                ),
              ),

              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        itemCount: CategoriesData.starbucksProducts.length,
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
