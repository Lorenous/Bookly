import 'package:bookly/core/constants/app_images.dart';
import 'package:bookly/features/home/presentation/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(30),
          child: HomeViewAppBar(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const BookItem(),
        ),
      ],
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(AppImages.testImage),
          ),
        ),
      ),
    );
  }
}
