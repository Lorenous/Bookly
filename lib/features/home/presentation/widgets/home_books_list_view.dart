import 'package:bookly/config/routes/app_routes.dart';
import 'package:bookly/features/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: BookItem(
              onTap: () =>
                  GoRouter.of(context).push(AppRoutes.bookDetailsView)),
        ),
      ),
    );
  }
}
