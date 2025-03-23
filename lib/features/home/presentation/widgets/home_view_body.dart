import 'package:bookly/core/constants/styles.dart';
import 'package:bookly/features/home/presentation/widgets/best_seller_sliver_list_view.dart';
import 'package:bookly/features/home/presentation/widgets/home_books_list_view.dart';
import 'package:bookly/features/home/presentation/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeViewAppBar(),
              const SizedBox(height: 30),
              const HomeBooksListView(),
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 25),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const BestSellerSliverListView(),
      ],
    );
  }
}
