import 'package:go_router/go_router.dart';
import 'package:workspace/screens/home_screen.dart';
import 'package:workspace/screens/login_screen.dart';
import 'package:workspace/screens/signup_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/sign-in',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/sign-in', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/sign-up', builder: (context, state) => SignupScreen()),
  ],
);
