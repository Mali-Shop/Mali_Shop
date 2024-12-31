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
    CartItem(
        name: "Phone", image: "assets/Phone.png", price: 300.0, quantity: 1),
    CartItem(
        name: 'Speaker',
        image: "assets/speaker.png",
        price: 500.0,
        quantity: 1),
    CartItem(
        name: "Headset", image: "assets/headset.png", price: 100.0, quantity: 1)
  ];
  double get totalprice =>
      cartItems.fold(0, (total, item) => total + (item.price * item.quantity));

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
                        return Container(
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                        '\$ ${cartItem.price}',
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.0)),
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              decrease(index);
                                            },
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(cartItem.quantity.toString()),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          FloatingActionButton.small(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.0)),
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              increase(index);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(35.0),
                        ), 
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Total",
                                style: AppWidget.BigBold(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '\$ ${totalprice.toStringAsFixed(1)}',
                                style: AppWidget.BigBold(),
                                                    
                              ),
                            )
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(bottom: 50.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            
                            

                          ),
                          child: Text(
                            "Place Order",
                            style: AppWidget.pay(),
                            ),
                          onPressed: () {
                            
                          },
                        )
                      ),
                    ],
                  ),
                  
                ],
              ));
  }

  void increase(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrease(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else if (cartItems[index].quantity == 1) {
        cartItems.removeAt(index);
      }
    });
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity});
}
