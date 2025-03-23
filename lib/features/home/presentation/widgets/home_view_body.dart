import 'package:bookly/features/home/presentation/widgets/home_books_list_view.dart';
import 'package:bookly/features/home/presentation/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeViewAppBar(),
        SizedBox(height: 30),
        HomeBooksListView(),
      ],
    );
  }
}
