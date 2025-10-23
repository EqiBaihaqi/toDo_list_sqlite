import 'package:flutter/material.dart';

import 'app_dimens.dart';

class AppDecoration {
  static BoxDecoration cardDecoration({double? radius}) => BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.all(Radius.circular(radius ?? AppDimens.borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      );
  static ShapeBorder bottomSheetDecoration = const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(16),
    ),
  );
}
