import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/Payment_service.dart';
import 'package:go_router/go_router.dart';
import 'package:mali_shop/main.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:provider/provider.dart';

class My_Cart extends StatefulWidget {
  const My_Cart({super.key});

  @override
  State<My_Cart> createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {
  @override
  Widget build(BuildContext context) {
    final cartmodel = Provider.of<CartModel>(context);
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          centerTitle: true,
        ),
        body: Container(
            child: cartmodel.items.isEmpty
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
                            shrinkWrap: true,
                            itemCount: cartmodel.items.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartmodel.items[index];
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
                                                  cartItem.product['image']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 7.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '\$ ${cartItem.product['Price']}',
                                            style: AppWidget.BigBold(),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 100.0,
                                            ),
                                            child: Text(
                                              cartItem.product['Name'],
                                              style: AppWidget.Big(),
                                              overflow: TextOverflow.visible,
                                              maxLines: 7,
                                            ),
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
                                                      if (cartItem.quantity >
                                                          1) {
                                                        cartmodel.updateQuantity(
                                                            cartItem.product[
                                                                'Name'],
                                                            cartItem.quantity -
                                                                1);
                                                      } else {
                                                        cartmodel.items
                                                            .removeAt(index);
                                                      }
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                ),
                                                Text(
                                                 ' ${cartItem.quantity}',
                                                ),
                                                Container(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      cartmodel.updateQuantity(cartItem.product['Name'], cartItem.quantity+1);
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
                                  '\$ ${cartmodel.subtotal.toStringAsFixed(2)}',
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
}
