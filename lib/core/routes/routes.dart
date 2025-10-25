import 'package:bookia/feautres/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feautres/auth/presentation/login/page/login_screen.dart';
import 'package:bookia/feautres/auth/presentation/register/page/register_screen.dart';
import 'package:bookia/feautres/home/data/models/best_seller_response/product.dart';
import 'package:bookia/feautres/home/presentation/page/details_screen.dart';
import 'package:bookia/feautres/main/main_app_screen.dart';
import 'package:bookia/feautres/splash_screen.dart';
import 'package:bookia/feautres/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String details = '/details';

  static GoRouter routes = GoRouter(
    // initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: main,
        builder: (context, state) {
          return const MainAppScreen();
        },
      ),
      GoRoute(
        path: details,
        builder: (context, state) {
          var book = state.extra as Product;
          return DetailsScreen(book: book);
        },
      ),
    ],
  );
}
