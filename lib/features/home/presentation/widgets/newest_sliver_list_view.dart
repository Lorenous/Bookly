import 'package:bookly/features/home/presentation/widgets/newest_item.dart';
import 'package:flutter/material.dart';

class NewestSliverListView extends StatelessWidget {
  const NewestSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const NewestItem(),
    );
  }
}
