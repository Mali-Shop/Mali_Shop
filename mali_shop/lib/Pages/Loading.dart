import 'package:flutter/material.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:go_router/go_router.dart';
import 'package:mali_shop/Pages/Cart.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(),
            ),
          );
        },
        child: Text("Load cart page"),
      )),
    );
  }
}
