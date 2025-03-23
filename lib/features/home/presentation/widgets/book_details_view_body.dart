import 'package:bookly/core/constants/styles.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_actions.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_list_view.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_view_app_bar.dart';
import 'package:bookly/features/home/presentation/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BookDetailsViewAppBar(),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.22,
            child: const BookItem(),
          ),
          const SizedBox(height: 40),
          const Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const Opacity(
            opacity: 0.7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(height: 16),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 50),
          const BookDetailsActions(),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'You can also like',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const BookDetailsListView(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
