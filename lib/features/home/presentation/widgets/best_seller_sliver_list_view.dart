import 'package:bookly/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerSliverListView extends StatelessWidget {
  const BestSellerSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const BestSellerItem(),
    );
  }
}
