import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'categories_data.dart';

class Reuse extends StatelessWidget {
  const Reuse({super.key});

  static Widget customTextField({required String label, Widget? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        border: OutlineInputBorder(),
        suffixIcon: icon,
      ),
    );
  }

  static Widget customSocialMediaButton({
    required String imageName,
    required String text,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset(imageName), SizedBox(width: 5), Text(text)],
      ),
    );
  }

  static Widget newGridTile({
    required String category,
    required String imageName,
    required String brand,
    required String title,
    required double price,
  }) {
    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              GestureDetector(onTap: (){

              },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageName,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          brand,
          style: const TextStyle(
            color: Color(0xffD19A88),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
        Row(
          children: [
            Text(
              "$price",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xffE27B66),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ],
        ),
      ],
    );
  }

  static Widget orangeButton({
    required BuildContext context,
    required Widget page,
    required String text,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFF5C39),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size(double.infinity, 45),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Center(child: Text(text)),
    );
  }

  static Widget newBrandCard({
    required BuildContext context,
    index,
    required String brand,

  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: () {
        },
        child: Text(brand),
      ),
    );
  }

  static Widget filterCard({
    required BuildContext context,
    index,
    required Widget content,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
//gridView --------> childAspectRatio = width/height
//clipRRect --------> BorderRadius ----> image
//Expanded ---------> image  (enough space)
//list of models
