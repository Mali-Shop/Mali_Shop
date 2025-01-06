import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:mali_shop/Pages/Cart.dart';
import 'package:mali_shop/Pages/Loading.dart';
import 'package:mali_shop/Pages/Payment_service.dart';
import 'package:mali_shop/Pages/payment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Oliver(),
      child: MaterialApp.router(
        title: 'Mali Shop',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

class Oliver extends ChangeNotifier {
  String text = "Choose your method of ";
  String get olitext => text;

  void SetText(String new_text) {
    text = new_text;
    notifyListeners();
  }
}

final GoRouter router = GoRouter(initialLocation: '/pay', routes: <RouteBase>[
  GoRoute(
    path: '/payment',
    builder: (context, state) {
      return const Payment();
    },
  ),
  GoRoute(
      name: '/cart',
      path: '/cart',
      builder: (context, state) {
        return const Cart();
      }),
  GoRoute(
      name: '/pay',
      path: '/pay',
      builder: (context, state) {
        return const Payment_Service();
      }),
  GoRoute(
      name: '/load',
      path: '/load',
      builder: (context, state) {
        return const Loading();
      })
]);
