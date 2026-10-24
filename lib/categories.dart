import 'package:flutter/material.dart';
import 'package:otlop_app/categories_data.dart';
import 'package:otlop_app/text_style.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
   
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double itemWidth = screenWidth * 0.22; 
    final double imageBoxSize = screenWidth * 0.18; 
    final double fontSize = screenWidth * 0.035; 

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Text("See all", style: AppTextStyles.orangetext),
                  )
                ],
              ),
            ),

            SizedBox(
              height: screenHeight * 0.15, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: CategoriesData.categoriesList.length,
                itemBuilder: (context, index) {
                  final category = CategoriesData.categoriesList[index];

                  return Container(
                    width: itemWidth, 
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: imageBoxSize,
                          height: imageBoxSize,
                          decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: category.categoryImage,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          category.categoryName,
                          maxLines: 1, 
                          overflow: TextOverflow.ellipsis, 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}