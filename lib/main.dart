import 'package:bookly/config/routes/app_routes.dart';
import 'package:bookly/core/constants/app_colors.dart';
import 'package:bookly/core/constants/hive_boxes.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_home_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/home_books_cubit/home_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<BookEntity>(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(HiveBoxes.homeBooks);
  await Hive.openBox<BookEntity>(HiveBoxes.newestBooks);
  await Hive.openBox<BookEntity>(HiveBoxes.relatedBooks);
  Bloc.observer = SimpleBlocObserver();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBooksCubit(
            fetchHomeBooksUseCase: FetchHomeBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchNewestBooksUseCase: FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
