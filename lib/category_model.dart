import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryModel extends StatelessWidget {
  final SvgPicture categoryImage;
  final String categoryName;

  const CategoryModel({super.key,required this.categoryName, required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
