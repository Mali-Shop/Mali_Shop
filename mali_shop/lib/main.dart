

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mali_shop/Pages/Category_page.dart';
import 'package:mali_shop/Pages/Loading.dart';
import 'package:mali_shop/Pages/My_Cart.dart';
import 'package:mali_shop/Pages/Payment_service.dart';
import 'package:mali_shop/Pages/Product_detail.dart';
import 'package:mali_shop/Pages/payment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    

    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context) => Oliver()),
        ChangeNotifierProvider(create: (_) => CartModel()),

      ],
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

final GoRouter router = GoRouter(initialLocation: '/category', routes: <RouteBase>[
  GoRoute(
    path: '/payment',
    builder: (context, state) {
      return const Payment();
    },
  ),

  

  GoRoute(
    path: '/category',
    builder: (context, state) {
      return const Category_Page();
    },
  ),
  
   GoRoute(
    path: '/my_cart',
    builder: (context, state) {
      return const My_Cart();
    },
  ),
  
  
  GoRoute(
      name: '/load',
      path: '/load',
      builder: (context, state) {
        return const Loading();
      })
]);


//Cart Model class

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Map<String, dynamic> item) {
    // Check if the item already exists in the cart
    final existingItem = _items.firstWhere(
      (cartItem) => cartItem.product['Name'] == item['Name'],
      orElse: () => CartItem(product: item, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++; // Increment quantity if item exists
    } else {
      _items.add(CartItem(product: item, quantity: 1)); // Add new item
    }

    notifyListeners();
  }

  void updateQuantity(String productName, int quantity) {
    final item = _items.firstWhere((cartItem) => cartItem.product['Name'] == productName);
    item.quantity = quantity;
    notifyListeners();
  }
  void removeFromCart(String productName) {
    _items.removeWhere((cartItem) => cartItem.product['Name'] == productName);
    notifyListeners();
  }

  double get subtotal {
    return _items.fold(0, (sum, item) => sum + (item.product['Price'] * item.quantity));
  }


  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class CartItem {
  final Map<String, dynamic> product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
