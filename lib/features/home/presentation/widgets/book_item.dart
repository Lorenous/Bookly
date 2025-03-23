import 'package:bookly/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final void Function()? onTap;
  const BookItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(AppImages.testImage),
            ),
          ),
        ),
      ),
    );
  }
}
