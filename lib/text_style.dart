import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppTextStyles extends StatelessWidget {
   const AppTextStyles({super.key});
static final TextStyle boldtext = TextStyle(
fontWeight: FontWeight.w600,
fontSize: 30,
);
static final TextStyle greytext = TextStyle(
color: Color(0xff999EA1),
fontWeight: FontWeight.w600,
);
static final TextStyle orangetext = TextStyle(
color: Color(0xffFF5C39),
fontWeight: FontWeight.w600,
);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
