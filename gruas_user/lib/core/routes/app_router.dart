import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas_user/features/auth/screens/login_screen.dart';
import 'package:gruas_user/features/auth/screens/register_screen.dart';
import 'package:gruas_user/features/admin/screens/admin_dashboard_screen.dart';
import 'package:gruas_user/features/user/screens/user_dashboard_screen.dart';
import 'package:gruas_user/features/worker/screens/worker_dashboard_screen.dart';
import 'package:gruas_user/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:gruas_user/features/user/screens/user_map_test_screen.dart';

class AppRouter {
  static GoRouter getRouter(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String initialLocation = '/login';

    if (defaultTargetPlatform == TargetPlatform.windows) {
      if (authProvider.adminExists) {
        initialLocation = '/login';
      } else {
        initialLocation = '/register';
      }
    } else {
      initialLocation = '/login';
    }

    return GoRouter(
      initialLocation: initialLocation,
      refreshListenable: authProvider,
      redirect: (BuildContext context, GoRouterState state) {
        final bool isAuthenticated = authProvider.isAuthenticated;
        final bool isAdmin = authProvider.isAdmin;
        final String location = state.matchedLocation;

        if (defaultTargetPlatform == TargetPlatform.windows && 
            !authProvider.adminExists && 
            location != '/register') {
          return '/register';
        }
        
        if (!isAuthenticated && location != '/login' && location != '/register') {
          return '/login';
        }
        if (isAuthenticated && (location == '/login' || location == '/register')) {
          if (isAdmin) return '/admin/dashboard';
          if (authProvider.userRole == UserRole.user) return '/user/dashboard';
          if (authProvider.userRole == UserRole.worker) return '/worker/dashboard';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/admin/dashboard',
          builder: (context, state) => const AdminDashboardScreen(),
        ),
        GoRoute(
          path: '/user/dashboard',
          builder: (context, state) => const UserDashboardScreen(),
        ),
        GoRoute(
          path: '/worker/dashboard',
          builder: (context, state) => const WorkerDashboardScreen(),
        ),
        GoRoute(
          path: '/user/map-test',
          builder: (context, state) => const UserMapTestScreen(),
        ),
      ],
    );
  }
} 