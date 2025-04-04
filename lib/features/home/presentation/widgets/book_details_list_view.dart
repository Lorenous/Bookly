import 'package:bookly/features/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 16),
          child: BookItem(),
        ),
      ),
    );
  }
}
