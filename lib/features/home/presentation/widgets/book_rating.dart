import 'package:bookly/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  const BookRating({super.key, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 14,
        ),
        const SizedBox(width: 8),
        const Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 8),
        const Opacity(
          opacity: 0.5,
          child: Text(
            '(2390)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
