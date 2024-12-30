import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/Cart.dart';

void main() {
  runApp(MaterialApp(
    home:Cart() ,
    debugShowCheckedModeBanner: false,
  ));
}

class MaliShop extends StatefulWidget {
  const MaliShop({super.key});

  @override
  State<MaliShop> createState() => _MaliShopState();
}

class _MaliShopState extends State<MaliShop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaliShop",
    );
  }
}

