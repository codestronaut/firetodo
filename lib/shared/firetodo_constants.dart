import 'package:flutter/material.dart';

class FireTodoColors {
  static const Color mindfulBrown = Color(0xFF4F3422);
  static const Color mindfulBrownLight = Color(0xFF926247);
  static const Color mindfulGreen = Color(0xFF9BB168);
  static const Color mindfulOrange = Color(0xFFED7E1C);
  static const Color mindfulCream = Color(0xFFF7F4F2);
  static const Color mindfulCreamDarker = Color(0xFFE8DDD9);
  static const Color mindfulPurple = Color(0xFFA694F5);
  static const Color mindfulYellow = Color(0xFFFFCE5C);
  static const Color mindfulRed = Color(0xFFFF6868);
  static const Color grayRock = Color(0xFFE1E1E0);
  static const Color grayRockDarker = Color(0xFF736B66);
}

class FireTodoSpacings {
  static const double spacingNone = 0.0;
  static const double spacingXxs = 4.0;
  static const double spacingXs = 8.0;
  static const double spacingSm = 12.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 20.0;
  static const double spacingXlg = 24.0;
}

class FireTodoTextStyles {
  static const TextStyle regular = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Urbanist',
  );

  static const TextStyle regularItalic = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontFamily: 'Urbanist',
  );

  static const TextStyle medium = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: 'Urbanist',
  );

  static const TextStyle mediumItalic = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontFamily: 'Urbanist',
  );

  static const TextStyle semiBold = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontFamily: 'Urbanist',
  );

  static const TextStyle semiBoldItalic = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    fontFamily: 'Urbanist',
  );

  static const TextStyle bold = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: 'Urbanist',
  );

  static const TextStyle boldItalic = TextStyle(
    color: FireTodoColors.mindfulBrown,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    fontFamily: 'Urbanist',
  );
}
