import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:gruas/core/routes/app_router.dart';
import 'package:gruas/core/theme/app_theme.dart';
import 'package:gruas/features/auth/providers/auth_provider.dart';
import 'package:gruas/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains('duplicate-app')) {
      // Si ya está inicializado, continuamos
      print('Firebase ya está inicializado');
    } else {
      // Si es otro error, lo relanzamos
      rethrow;
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Sistema de Grúas',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: AppRouter.getRouter(context),
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
