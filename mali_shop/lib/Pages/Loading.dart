import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/My_Cart.dart';



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
              builder: (context) => My_Cart(),
            ),
          );
        },
        child: Text("Load cart page"),
      )),
    );
  }
}
