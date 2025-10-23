import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by muhamadsaid on 3/21/24, Android Studio
 */

class EmptyAppBar extends GetView implements PreferredSizeWidget {
  const EmptyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0.0);
}
