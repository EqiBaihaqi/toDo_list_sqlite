// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sikomo/app/commons/widgets/custom_image_local.dart';
// import 'package:sikomo/app/core/app_text_styles.dart';
// import 'package:sikomo/generated/assets.dart';

// import '../../core/app_colors.dart';

// class CustomBottomSheetUploadImage extends StatelessWidget {
//   CustomBottomSheetUploadImage(
//       {Key? key, required this.functionCamera, required this.functionGallery})
//       : super(key: key);

//   final Function() functionCamera;
//   final Function() functionGallery;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 4,
//             width: 64,
//             decoration: BoxDecoration(
//               color: AppColors.colorNetral4,
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Text(
//             'Select Media',
//             style: AppTextStyles.semiBold18,
//           ),
//           const SizedBox(height: 24),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               InkWell(
//                 onTap: functionCamera,
//                 child: const Column(
//                   children: [
//                     CustomImageLocal(
//                       imagePath: Assets.imagesButtonCamera,
//                       width: 64,
//                       height: 64,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Camera',
//                       style: AppTextStyles.mediumB1,
//                     )
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: functionGallery,
//                 child: const Column(
//                   children: [
//                     CustomImageLocal(
//                       imagePath: Assets.imagesButtonGallery,
//                       width: 64,
//                       height: 64,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Gallery',
//                       style: AppTextStyles.mediumB1,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
