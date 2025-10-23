// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class CustomImage extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final double width;
//   final double height;

//   const CustomImage({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.width,
//     required this.height,
//   });

//   String getInitials(String name) {
//     final names = name.split(" ");
//     if (names.length > 1) {
//       return names[0][0].toUpperCase() + names[1][0].toUpperCase();
//     } else if (names.isNotEmpty) {
//       return names[0][0].toUpperCase();
//     } else {
//       return "?";
//     }
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     final isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

//     return ClipOval(
//       child: isValidUrl
//           ? CachedNetworkImage(
//               imageUrl: imageUrl,
//               width: width,
//               height: height,
//               fit: BoxFit.cover,
//               placeholder: (context, url) => const Center(
//                 child: CupertinoActivityIndicator(),
//               ),
//               errorWidget: (context, url, error) => _buildErrorWidget(),
//             )
//           : _buildErrorWidget(),
//     );
//   }

//   Widget _buildErrorWidget() {
//     return Container(
//       width: width,
//       height: height,
//       color: Colors.grey.shade300,
//       child: Center(
//         child: Text(
//           getInitials(name),
//           style: TextStyle(
//             fontSize: width * 0.4,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
