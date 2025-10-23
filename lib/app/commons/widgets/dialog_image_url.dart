import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogImageUrl extends StatelessWidget {
  const DialogImageUrl({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      children: [
        Stack(
          children: [
            SizedBox(
              height: Get.height * 0.5,
              width: Get.width,
              child: Image.network(
                imageUrl!,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error,
                            color: Colors.red, size: 50), // Error icon
                        SizedBox(height: 10),
                        Text(
                          'Image not found',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
