import 'package:bookly/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImages.logo),
        const Text(
          'Read Your Books',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
