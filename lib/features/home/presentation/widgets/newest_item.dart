import 'package:bookly/config/routes/app_routes.dart';
import 'package:bookly/core/constants/app_fonts.dart';
import 'package:bookly/core/constants/styles.dart';
import 'package:bookly/features/home/presentation/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRoutes.bookDetailsView),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 45, bottom: 20),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const BookItem(),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harry Potter and the Goblet of Fire',
                    style: Styles.textStyle20
                        .copyWith(fontFamily: AppFonts.gtSectraFine),
                  ),
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      'J.K. Rowling',
                      style: Styles.textStyle14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '19.99 €',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const BookRating()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
