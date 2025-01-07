import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/Payment_service.dart';
import 'package:go_router/go_router.dart';
import 'package:mali_shop/support_widget/widget_support.dart';

class My_Cart extends StatefulWidget {
  const My_Cart({super.key});

  @override
  State<My_Cart> createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          centerTitle: true,
        ),
        body: Container(
            child: cartItems.isEmpty
                ? Container(
                    child: Center(
                      child: Text("No Items in Cart"),
                    ),
                  )
                : Center(
                    child: Column(
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
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
                                        width: 7.0,
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
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                border: Border.all(
                                                    color: Colors.yellow)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      decrease(index);
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                ),
                                                Text(cartItem.quantity
                                                    .toString()),
                                                Container(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      increase(index);
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
                          margin: EdgeInsets.only(bottom: 70.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              context.go('/pay');
                            },
                            child: Text(
                              "Checkout",
                              style: AppWidget.pay(),
                              ),
                          ),
                        )
                      ],
                    ),
                  )));
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
