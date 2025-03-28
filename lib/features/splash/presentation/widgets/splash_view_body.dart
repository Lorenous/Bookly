import 'package:bookly/config/routes/app_routes.dart';
import 'package:bookly/core/constants/app_images.dart';
import 'package:bookly/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      // ignore: use_build_context_synchronously
      () => GoRouter.of(context).go(AppRoutes.homeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImages.logo),
        Text(
          'Read Your Books',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
