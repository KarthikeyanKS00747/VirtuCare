import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:virtucare/view/screens/chat_page.dart';
import 'package:virtucare/view/screens/home_page.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute> [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const MaterialPage(child: SizedBox.shrink()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
        MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: '/chatpage',
      pageBuilder: (context, state) =>
        MaterialPage(child: ChatPage()),
    ),
  ]
);