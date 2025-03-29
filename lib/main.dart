import 'package:bookly/config/routes/app_routes.dart';
import 'package:bookly/core/constants/app_colors.dart';
import 'package:bookly/core/constants/hive_boxes.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<BookEntity>(BookEntityAdapter());
  await Hive.openBox<BookEntity>(HiveBoxes.homeBooks);
  await Hive.openBox<BookEntity>(HiveBoxes.newestBooks);
  await Hive.openBox<BookEntity>(HiveBoxes.relatedBooks);

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      routerConfig: AppRoutes.router,
    );
  }
}
