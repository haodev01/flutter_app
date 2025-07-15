import 'package:go_router/go_router.dart';
import 'package:workspace/screens/card_service_screen.dart';
import 'package:workspace/screens/history_screen.dart';
import 'package:workspace/screens/home_screen.dart';
import 'package:workspace/screens/login_screen.dart';
import 'package:workspace/screens/profile_info_screen.dart';
import 'package:workspace/screens/profile_screen.dart';
import 'package:workspace/screens/signup_screen.dart';
import 'package:workspace/screens/webview_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/sign-in',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/sign-in', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/sign-up', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(
      path: '/profile-info',
      builder: (context, state) => ProfileInfoScreen(),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final url = state.uri.queryParameters['url']!;
        return WebviewScreen(url: url);
      },
    ),
    GoRoute(
      path: '/card-service',
      builder: (context, state) => CardServiceScreen(),
    ),
    GoRoute(path: '/history', builder: (context, state) => HistoryScreen()),
  ],
);
