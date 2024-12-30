import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mali_shop/support_widget/widget_support.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}


class _CartState extends State<Cart> {

  


  int quantity = 1;
  final List<CartItem> cartItems = [
    CartItem(name: "Phone", image: "assets/Phone.png", price: 300.0),
    CartItem(name: 'Speaker', image: "assets/speaker.png", price: 500.0),
    CartItem(name: "Headset", image: "assets/headset.png", price: 100.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Cart",
            style: AppWidget.SmallBold(),
          ),
        ),
        body: cartItems.isEmpty
            ? Center(
                child: Text("No Items in Cart"),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                    image: AssetImage(
                                      cartItem.image,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  
                                  children: [
                                    Text(
                                      '${cartItem.price}',
                                      style: AppWidget.BigBold(),
                                      ),
                                    Text(
                                      cartItem.name,
                                      style: AppWidget.Big(),
                                    ),
                                    Row(
                                      children: [
                                        FloatingActionButton.small(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0)
                                          ),
                                          backgroundColor: Colors.grey[800],
                                          child: Icon(Icons.remove),
                                          onPressed: () {
                                            
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          quantity.toString(),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        FloatingActionButton.small(
                                          
                                           shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0)
                                          ),
                                          backgroundColor: Colors.grey[800],
                                          
                                          child: Icon(Icons.add),
                                          onPressed: () {
                                            
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ));
  }
}



class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
  });
}

