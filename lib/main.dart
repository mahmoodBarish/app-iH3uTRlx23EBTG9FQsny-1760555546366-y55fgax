import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/followers.dart';
import 'screens/profile_info_page.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/followers',
  routes: [
    GoRoute(
      path: '/followers',
      builder: (BuildContext context, GoRouterState state) {
        return const Followers();
      },
    ),
    GoRoute(
      path: '/profile_info_page',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileInfoPage();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const Profile();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Production App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
