import 'package:flutter/material.dart';
import 'package:getx_pattern_architecture/app/style/style_color.dart';
import 'package:google_fonts/google_fonts.dart';

// h1
TextStyle h1Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 32,
    );

TextStyle h1Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 32,
    );

TextStyle h1Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 32,
);

// h2
TextStyle h2Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 28,
    );

TextStyle h2Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    );

TextStyle h2Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 24,
);

// h3
TextStyle h3Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );
TextStyle h4MediumTitle({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );

TextStyle h3Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );

TextStyle h3Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 20,
);

// h4
TextStyle h4Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );

TextStyle h4Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );

TextStyle h4Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 18,
);
TextStyle h4InterSemiBold({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );

// b1
TextStyle b1Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

TextStyle h6Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

TextStyle b1Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );

TextStyle b1Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 16,
);

TextStyle h7SemiBold({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

// b2
TextStyle b2Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

TextStyle b2Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

TextStyle b2Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

TextStyle h8Regular({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

TextStyle b3Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );

TextStyle b3Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);

// b4
TextStyle b4Reguler({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );

TextStyle b4Medium({Color colorText = CustomColor.netral10}) =>
    GoogleFonts.inter(
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 10,
    );

TextStyle b4Bold({Color colorText = CustomColor.netral10}) => GoogleFonts.inter(
  color: colorText,
  fontWeight: FontWeight.w700,
  fontSize: 10,
);

class AppTextStyles {
  // Heading
  static TextStyle bold32({Color? color}) => GoogleFonts.openSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular24({Color? color}) => GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium24({Color? color}) => GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold24({Color? color}) => GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold24({Color? color}) => GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular20({Color? color}) => GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium20({Color? color}) => GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold20({Color? color}) => GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold20({Color? color}) => GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular18({Color? color}) => GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium18({Color? color}) => GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle f18Semibold({Color? color}) => GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold18({Color? color}) => GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  // Body
  static TextStyle regular16({Color? color}) => GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium16({Color? color}) => GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold16({Color? color}) => GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold16({Color? color}) => GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular14({Color? color}) => GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium14({Color? color}) => GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold14({Color? color}) => GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold14({Color? color}) => GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular12({Color? color}) => GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium12({Color? color}) => GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold12({Color? color}) => GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold12({Color? color}) => GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );

  static TextStyle regular10({Color? color}) => GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle medium10({Color? color}) => GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle semibold10({Color? color}) => GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: color ?? CustomColor.netral9,
  );
  static TextStyle bold10({Color? color}) => GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: color ?? CustomColor.netral9,
  );
}
