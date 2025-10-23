// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sikomo/app/commons/widgets/custom_image_local.dart';
// import 'package:sikomo/app/core/app_text_styles.dart';
// import 'package:sikomo/generated/assets.dart';

// import '../../core/app_colors.dart';

// class CustomBottomSheetSelectMedia extends StatelessWidget {
//   final ImagePicker _picker = ImagePicker();
//   final ValueChanged<ImageSource> onSelectionMade;

//   // Menerima callback dari widget pemanggil
//   CustomBottomSheetSelectMedia({super.key, required this.onSelectionMade});

//   Future<void> _pickImage(BuildContext context, ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);

//     if (image != null) {
//       // Menampilkan gambar yang dipilih
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Image picked from ${source.toString()}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No image selected')),
//       );
//     }

//     // Memanggil callback untuk memberi tahu pemilih gambar
//     onSelectionMade(source);
//   }

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
//                 onTap: () {
//                   _pickImage(context, ImageSource.camera);
//                   Navigator.pop(context);
//                 },
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
//                 onTap: () {
//                   _pickImage(context, ImageSource.gallery);
//                   Navigator.pop(context);
//                 },
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
