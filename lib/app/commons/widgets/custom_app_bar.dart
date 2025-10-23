// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:traceability_monitoring_system/app/commons/widgets/custom_image_local.dart';

// import '../../core/app_colors.dart';
// import '../../core/app_text_styles.dart';

// /**
//  * Created by muhamadsaid on 3/21/24, Android Studio
//  */

// class CustomAppBar extends GetView implements PreferredSizeWidget {
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.elevation,
//     this.actions,
//     this.titleColor = AppColors.colorNetral9,
//     this.colorIconBack = AppColors.colorNetral9,
//     this.backgroundColor = Colors.white,
//     this.showLeading = true,
//   });

//   final String title;
//   final double? elevation;
//   final List<Widget>? actions;
//   final Color titleColor;
//   final Color colorIconBack;
//   final Color backgroundColor;
//   final bool showLeading;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title,
//           style: AppTextStyles.semiBold18.copyWith(color: titleColor)),
//       elevation: elevation ?? 0,
//       backgroundColor: backgroundColor,
//       centerTitle: false,
//       automaticallyImplyLeading: showLeading,
//       leading: showLeading
//           ? IconButton(
//               icon: CustomImageLocal(
//                 imagePath: Assets.iconsBack,
//                 color: colorIconBack,
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             )
//           : null,
//       actions: actions,
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(60.0);
// }
