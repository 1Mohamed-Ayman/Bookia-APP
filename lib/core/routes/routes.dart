import 'package:bookia/feautres/splash_screen.dart';
import 'package:bookia/feautres/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcome = '/welcome';

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
    ],
  );
}
