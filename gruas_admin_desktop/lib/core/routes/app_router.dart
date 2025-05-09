import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/users_screen.dart';
import '../../screens/login_screen.dart';
import '../../services/auth_service.dart';

final router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.matchedLocation == '/login';

    if (!isAuthenticated && !isLoginRoute) {
      return '/login';
    }

    if (isAuthenticated && isLoginRoute) {
      return '/dashboard';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersScreen(),
    ),
  ],
); 